recoleccion<-sidebarLayout(sidebarPanel(
  h3("Panel laretal"),
  fileInput(inputId = "idArchivo",label = "Seleccione Archivo")
),mainPanel(
  h3("Panel principal"),
  tableOutput(outputId="idTabla1") 
))