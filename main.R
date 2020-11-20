#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    shiny.rstudio.com
#

library(shiny)
library(shinythemes)
source("www/introduccion.R")
source("www/recoleccion.R")
# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("cyborg"), 
                
                # Application title
                titlePanel("Universidad Peruana de Ciencias Aplicadas"),
                
                tabsetPanel(
                  tabPanel("Descripcion",introduccion),
                  tabPanel("Recoleccion", recoleccion),
                  tabPanel("Preprocesamiento", "contents"),
                  tabPanel("Transformacion", "contents"),
                  tabPanel("Exploracion", "contents"),
                  tabPanel("Modeolo", "contents"),
                  tabPanel("Comunicacion", "contents"))
                
                
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$idTabla1 <- renderTable({
    #iris
    ?fileInput #prueba
    file <- input$idArchivo
    ext <- tools::file_ext(file$datapath)
    
    req(file)
    validate(need(ext == "csv", "Please upload a csv file"))
    
    read.csv(file$datapath )
    
  })
}

# Run the application 
shinyApp(ui = ui, server = server)