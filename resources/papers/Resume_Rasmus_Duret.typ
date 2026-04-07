#import "@preview/basic-resume:0.2.9": *

#let name = "Rasmus Duret"
#let location = "London, United Kingdom"
#let email = "rasmus@duret.dk"
#let github = "github.com/[username]"
#let linkedin = "linkedin.com/in/[username]"
#let phone = "+44 07 521 438 168"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  phone: phone,
  accent-color: "#26428b",
  font: "New Computer Modern",
  paper: "a4",
  author-position: left,
  personal-info-position: left,
)


== Education

#edu(
  institution: "PhD/MRes Economics - London School of Economics",
  dates: dates-helper(start-date: "Sep 2025", end-date: "Present"),
  degree: "MRes Year 1"
)
- Core courses: Microeconomics, Macroecoomics, Econometrics.

#edu(
  institution: "MSc Economics - London School of Economics",
  dates: dates-helper(start-date: "Sep 2023", end-date: "Jun 2024"),
  degree: "First Class, 74%, ranked 11th/140"
)
- Courses: Public Economics (83%, 1st/12); Econometrics (76%, 6th/140); Microeconomics (72%, 8th/140); Macroeconomics (64%, 22nd/140).
- Dissertation: 90%, best in year.

#edu(
  institution: "BSc Economics - University College London",
  location: "London, UK",
  dates: dates-helper(start-date: "Sep 2020", end-date: "Jun 2023"),
  degree: "First Class, 73.2%",
)
- Selected courses: Game Theory (80%); Advanced International Economics (74%); Microeconometrics (69%); Microeconomics (74%); Computational Methods (77%); Mathematics (77%) and Statistics (73%) for Economists.
- Dissertation: 81%, nominated for best in year.

== Research Interests

Social mobility and inequality, public economics, causal inference and policy evaluation.


== Research
#work(
  title: link("test")[Cash for Cradles: the effects of Estonia's Large Family Allowance],
  company: text("with David Seim and Jaanika Merikull", style: "italic")
)
#v(-4pt)
In 2017, Estonia introduced a €300/month allowance for families with 3 or more children, _quadrupling_ marginal child benefits. Using administrative data, we are examining how this affected fertility, and assessing the effects on between-household inequality as well as the gender gap.

#v(4pt)


#work(
  title: link("https://drive.google.com/file/d/18ow9jjNmwBO9SGe66hJhkvrW3q2vqVe0/view")[For Whom the Constraint Binds? Evidence on Swedish students' labour supply],
  company: text("MSc Dissertation - grade 90%, best in year", style: "italic"),
  location: "",
  dates: "",
)
#v(-4pt)
Using Swedish admin data (LISA), I investigated the impact of temporarily removing the income threshold for higher education stipends during COVID, employing bunching, simulated IV, and DID methods. Students’ average earnings rose \~11%, with larger effects for higher earners prior to reform.
#v(4pt)

#work(
  title: link("https://drive.google.com/file/d/1tXeWdGNeAEZwmp1XzGiFgBMMay4HjwBG/view")[Unravelling Network Capital: a network model of Exposure and Friending Effects],
  company: text("BSc Dissertation - grade 81%, nominated for best in year", style: "italic"),
  location: "",
  dates: "",
)
#v(-4pt)
Developed a network-based model of social capital to provide theoretical foundations for the empirical findings of Chetty et al. (2022). Calibrating on their data and reproducing key findings through simulation.
#v(4pt)

== Experience

#work(
  title: "Pre-Doctoral Fellow - London School of Economics",
  dates: dates-helper(start-date: "Sep 2024", end-date: "Present"),
  location: ""
)
#v(-16pt)
- *PI*: Prof. Johannes Spinnewijn.
- Using administrative data to investigate #link("https://personal.lse.ac.uk/spinnewi/CDI_draft.pdf")[health inequality] in the Netherlands. Work included extensive data processing, regression analysis, machine learning methods (LASSO, Boosted Trees, Random Forests) in STATA and R.


#work(
  title: "Summer Student, Institute for Fiscal Studies",
  dates: dates-helper(start-date: "Jul 2024", end-date: "Aug 2024"),
)
#v(-16pt)
- *PI*: Elaine Drayton. 
- Used data from the Understanding Society survey to estimate the effects of social housing on socioeconomic outcomes in England, using an event study design. #link("test")[Presented findings] to IFS staff, produced reports supporting future research.

#work(
  title: "Researcher, CORE Economics Project",
  location: "",
  dates: dates-helper(start-date: "Aug 2022", end-date: "Sep 2025"),
)
#v(-16pt)
- *PI*: Prof. Wendy Carlin
- Wrote an empirical #link("https://books.core-econ.org/the-economy/macroeconomics/02-unemployment-wages-inequality-10-application-labour-market-denmark.html")[section on Flexicurity and the Danish economic model] for the new edition of the #link("https://www.core-econ.org/")[CORE Economy textbook]; built #link("https://rassssd.github.io/io_testing/Pages/AD_WSPS_PC_WIP/AD_WSPS_PC_WIP.html")[interactive versions] of the WS-PS labour market model. 


== Skills

#generic-two-by-two(
  top-left: "Programming: Stata, R, Python, SQL, Git/GitHub, LaTeX, ArcGIS, HTML",
  top-right: "",
  bottom-left: "Languages: Danish & French (native), English (proficiency), Spanish (intermediate), Swedish & Norwegian (reading), German (novice)",
  bottom-right: "",
)

== References

#generic-two-by-two(
  top-left: "Prof. Johannes Spinnewijn",
  top-right: "Prof. David Seim",
  bottom-left: "London School of Economics — j.spinnewijn@lse.ac.uk",
  bottom-right: "Stockholm University — david.seim@su.se",
)

#generic-one-by-two(
  left: "Prof. Wendy Carlin — University College London — w.carlin@ucl.ac.uk",
  right: "",
)
