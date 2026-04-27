library(shiny)

ui <- fluidPage(
  titlePanel("Frisch-Waugh-Lovell Theorem"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("n", "Sample size:", min=50, max=500, value=200, step=50),
      sliderInput("beta_true", "True slope (β₁):", min=0, max=5, value=2, step=0.5),
      sliderInput("beta_x2", "Effect of X2 on Y:", min=0, max=5, value=3, step=0.5),
      sliderInput("corr", "X1-X2 correlation (loading):", min=0, max=3, value=1.5, step=0.25),
      sliderInput("seed", "Random seed:", min=1, max=100, value=1, step=1)
    ),
    mainPanel(
      plotOutput("fwl_plot", height="800px", width="800px"),
      verbatimTextOutput("summary")
    )
  )
)

server <- function(input, output) {
  
  data <- reactive({
    set.seed(input$seed)
    n <- input$n
    X2 <- rnorm(n)
    X1 <- input$corr * X2 + rnorm(n)
    Y  <- input$beta_true * X1 + input$beta_x2 * X2 + rnorm(n)
    tilde_Y  <- resid(lm(Y ~ X2))
    tilde_X1 <- resid(lm(X1 ~ X2))
    list(X1=X1, X2=X2, Y=Y, tilde_Y=tilde_Y, tilde_X1=tilde_X1, n=n)
  })
  
  output$fwl_plot <- renderPlot({
    d <- data()
    X1 <- d$X1; Y <- d$Y
    tilde_Y <- d$tilde_Y; tilde_X1 <- d$tilde_X1
    beta_true <- input$beta_true
    
    b_raw    <- coef(lm(Y ~ X1))[2]
    b_resY   <- coef(lm(tilde_Y ~ X1))[2]
    b_resX   <- coef(lm(Y ~ tilde_X1))[2]
    b_fwl    <- coef(lm(tilde_Y ~ tilde_X1))[2]
    att_factor <- var(tilde_X1) / var(X1)
    
    xlim_all <- range(c(X1, tilde_X1))
    ylim_all <- range(c(Y, tilde_Y))
    
    plot_reg_CI <- function(x, y, main_title, slope, show_att=FALSE) {
      fit  <- lm(y ~ x)
      pred <- predict(fit, interval="confidence")
      plot(x, y, xlim=xlim_all, ylim=ylim_all,
           main=main_title, xlab="X", ylab="Y",
           pch=16, col=rgb(0,0,0,0.3), cex=0.8,
           cex.main=1.3, cex.lab=1.2, cex.axis=1.1)
      matlines(x[order(x)], pred[order(x),],
               col=c("darkred","darkred","darkred"),
               lty=c(1,2,2), lwd=2)
      abline(a=coef(fit)[1], b=beta_true, col="navy", lwd=2)
      
      legend_items <- c(paste0("Slope = ", round(slope, 3)),
                        paste0("True slope = ", beta_true))
      legend_colors <- c("darkred", "navy")
      
      if (show_att) {
        legend_items <- c(legend_items,
                          paste0("Attenuation: Var(X1~)/Var(X1) = ",
                                 round(att_factor, 3)))
        legend_colors <- c(legend_colors, "black")
      }
      legend("topleft", legend=legend_items,
             text.col=legend_colors, bty="n", cex=1.1)
    }
    
    par(mfrow=c(2,2), mar=c(3,3,2,1), pty="s")
    plot_reg_CI(X1,       Y,       "Raw Y vs X1",                     b_raw,  FALSE)
    plot_reg_CI(X1,       tilde_Y, "Residual Y vs X1",                b_resY, TRUE)
    plot_reg_CI(tilde_X1, Y,       "Y vs Residual X1",                b_resX, FALSE)
    plot_reg_CI(tilde_X1, tilde_Y, "Residual Y vs Residual X1 (FWL)", b_fwl,  FALSE)
  }, res=96)
  
  output$summary <- renderPrint({
    d <- data()
    b_full     <- coef(lm(d$Y ~ d$X1 + d$X2))[2]
    b_fwl      <- coef(lm(d$tilde_Y ~ d$tilde_X1))[2]
    b_raw      <- coef(lm(d$Y ~ d$X1))[2]
    att_factor <- var(d$tilde_X1) / var(d$X1)
    cat("Full model coefficient on X1: ", round(b_full,      4), "\n")
    cat("FWL coefficient:              ", round(b_fwl,       4), "\n")
    cat("Raw (omitted variable bias):  ", round(b_raw,       4), "\n")
    cat("True beta:                    ", input$beta_true,        "\n")
    cat("Attenuation factor:           ", round(att_factor,  4), "\n")
    cat("  (= Var(X1~)/Var(X1); raw slope ≈ true slope × attenuation)\n")
    cat("  Check: true × attenuation = ", round(input$beta_true * att_factor, 4), "\n")
  })
}

shinyApp(ui, server)