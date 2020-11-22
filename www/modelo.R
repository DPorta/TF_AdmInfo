#regresiones, clasificaciones, reduccion de dimensiones, Kmeans, arboles de clasificacion


x<-rnorm(20,mean=rep(c(2:5),each=5),sd=0.5)
y<-rnorm(20,mean=rep(c(1,4,2,3),each=5),sd=0.3)

plot(x,y,col="red",pch=8,cex=1)
text(x,y,labels=1:20)

df<-data.frame(x,y)
distancias<-dist(df)
cluster<-hclust(distancias)
plot(cluster)

###implementar Kmeans
k=3
euclidiana<-function(df,p){
  return (sqrt((df$x-p$x)^2+(df$y-p$y)^2))
}
kmeans<-function(df,k){
  #asignar variables(puntos) en el rango
  x1<-sample(min(df$x):max(df$x),size=k)
  y1<-sample(min(df$y):max(df$y),size=k)
  dfk<-data.frame(x1,y1)
  #dist(dfk)
  df$d1<-euclidiana(df,dfk[1,])
  df$d2<-euclidiana(df,dfk[2,])
  df$d3<-euclidiana(df,dfk[3,])
  
  for (i in 1:NROW(df)){
    df$d[i]<-min(df$d1[i],df$d2[i],df$d3[i])
  }
  df$clase<-which(df$d[1],df$d2)
}

