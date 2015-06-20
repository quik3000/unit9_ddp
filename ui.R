# ui.R

library(shiny)

shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel(h2("Risk Category by BMI for Caucasian & Asian", style = "color:black")),
    
    sidebarPanel(
      h4(strong("Introduction:")),
      p("This application helps users understand their health 
                          risk as indicated by their BMI which can be calculated 
                          from their weight and height. According to researches done, 
                          there are significant difference in how BMI values can 
                          indicate the risk of people for certain non-communicable 
                          diseases for the different races. For example, Caucasian 
                          with BMI of 30 have high risk of heart diseases, whereas
                          Asian have a high risk of heart diseases even with a BMI of 28."),
      br(),
      p("Enter your weight (in kilograms) and your  
        height (in metres) under the respective boxes below. Then, 
        click on the", strong("Calculate"), "button. Your BMI will be 
        displayed on the right panel."),
      br(),
      p("Your corresponding health risk (based on your BMI) 
        will also be displayed on the right panel."),
      numericInput("weight", label = h4("Your Weight in kilograms"), 
                   value = 72),
      numericInput("height", label = h4("Your Height in metres"), 
                   value = 1.75),
      submitButton("Calculate")
      ),
    mainPanel(
      h3("Your BMI Calculation", style = "color:black"),
      br(),
      h4("You have entered"),
      textOutput("inputValue1"), h4("for weight in kilograms"),
      br(),
      textOutput("inputValue2"), h4("for height in metres"),
      br(),
      h4("which resulted in ", strong("Body Mass Index"), "of "),
      textOutput("calculate"),
      br(),
      br(),
      h4("Under", strong("WHO"), "BMI Classification, you are in the following range:"),
      h4(strong(textOutput("whoclass")), align = "center", style = "color:maroon"),
      br(),
      h4("For", strong("ASIAN"), "BMI Classification, you are in the following range:"),
      h4(strong(textOutput("asianclass")), align = "center", style = "color:maroon"),
      br(),
      h4("Your corresponding health risk is:"),
      h4(strong(textOutput("riskclass")), align = "center", style = "color:maroon")
    )
      )
      )