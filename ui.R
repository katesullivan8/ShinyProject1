shinyUI(dashboardPage(
  dashboardHeader(title = 'US Education Data'),
  dashboardSidebar(
    sidebarUserPanel(name = "Budget allocations and student outcomes"),
    sidebarMenu(
      menuItem("Introduction", tabName = "intro", icon = icon("flag")),
      menuItem("Method", tabName = "method", icon = icon("search")),
      menuItem("Data", tabName = "data_tbl", icon = icon("database")),
      menuItem("Charts", tabName='map', icon=icon("map")),
      menuItem(
        "Conclusions",
        tabName = "conclusions",
        icon = icon("lightbulb")
      )
    )
  ),
  dashboardBody(tabItems(
    tabItem(
      tabName = "intro",
      fluidRow(column(12),
               (box(
                 p(
                   "Public education "
                 ),
                 title = "School",
                 width = 12
                 ))),
      fluidRow(column(12),
               (box(
                 p(
                   "Middle school kids need to learn things,
                   including how to be decent people... The soft skills "
                 ),
                 title = "Focus",
                 width = 12
                 ))),
      
      fluidRow(column(12),
               (box(
                 p(
                   "This dataset is meant to provide tools we can use to evaluate the
                   use of funds from different budget categories"
                 ),
                 title = "Rationale",
                 width = 12
                 )))
    ),
    tabItem(tabName = "method",
            fluidRow(column(12),
                     (
                       box(
                         p(
                           "This dataset is meant to provide tools we can use to evaluate the
                           use of funds from different budget categories"
                         ),
                         title = "Rationale",
                         width = 12
                         )
                     ))),
    
    tabItem(
      tabName = "data_tbl",
      fluidRow(
        column(4, offset = 2,
               selectInput("st",
                           "State:",
                           c(
                             "All",
                             unique(as.character(scores_time$state))
                           ))),
        column(4, offset = 2,
               selectInput("yr",
                           "Year:",
                           c(
                             "All",
                             unique(as.character(scores_time$year))
                           ))),
        
        DT::dataTableOutput("table"),
        width = 12
      )
    ),
    tabItem(tabName="map", 
            fluidRow(
              column(12,
                selectInput(inputId = "scores_cost",
                            "Select item to display",
                            choice)),
              box(htmlOutput("map"))

              
            ),
            fluidRow(
              column(12, 
                selectInput(inputId = "score_choice", 
                            "Select Test Type", 
                            c("Math Scores", "Reading Scores"))),
              box(htmlOutput("expense_type"))
            )),
    tabItem(tabName = "conclusions",
            fluidRow(column(12),
                     (
                       box(
                         p('Data Source: U.S. Department of Education National
                          Center for Education Statistics Common Core of Data 
                          (CCD) "National Public Education Financial Survey 
                          (State Fiscal)" 1999-00 (FY 2000) v.1b  2000-01 
                          (FY 2001) v.1b  2001-02 (FY 2002) v.1d  2002-03 (FY 2003) v.1b 
                          2003-04 (FY 2004) v.1b  2004-05 (FY 2005) v.1b  2005-06 (FY 2006) v.1b  
                          2006-07 (FY 2007) v.1b  2007-08 (FY 2008) v.1b  2008-09 (FY 2009) v.1b  
                          2009-10 (FY 2010) v.2a  2010-11 (FY 2011) v.1a  2011-12 (FY 2012) v.1a  2012-13 
                          (FY 2013) v.1a  2013-14 (FY 2014) v.1a; "State Nonfiscal Public Elementary/Secondary Education Survey" 2016-17 v.1a.',

                           "https://nces.ed.gov/ccd/elsi/tableGenerator.aspx", 
                           "http://www.pewresearch.org/fact-tank/2017/04/04/what-does-the-federal-government-spend-your-tax-dollars-on-social-insurance-programs-mostly/"
                         ),
                         title = "Citations",
                         width = 12
                         )
                     ))),
  ))
      ))
