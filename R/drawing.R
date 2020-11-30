source("H:/project/ChangJiang/script/package.R")

name1 <- c("hist-aer", "hist-GHG","hist-nat","historical")

dsi <- list()
for(k in 1:length(name1)){
  load(paste0("H:/result/variable/mean_dsi/mean_dsi_",name1[k],".RData"))

  if(k == 1){
    MDSI[[5]][1981:2052] <- NA
    MDSI[[8]][1981:2052] <- NA
  }

  if(k == 2){
    MDSI[[5]][1987:2052] <- NA
    MDSI[[8]][1981:2052] <- NA
  }

  if(k == 3){
    MDSI[[5]][1981:2052] <- NA
    MDSI[[7]][2041:2052] <- NA
  }

  MDSI <- data.frame(MDSI)
  dsi[[k]] <- apply(MDSI, 1, median, na.rm = TRUE)
}


p <- ggplot()+
  geom_density(aes(dsi[[1]]), color = "#950FDF", size = 1)+
  geom_density(aes(dsi[[2]]), color = "#FF8A00", size = 1)+
  geom_density(aes(dsi[[3]]), color = "#FF0000", size = 1)+
  geom_density(aes(dsi[[4]]), color = "#0000FF", size = 1)+
  theme_bw()+
  annotate("segment", x = -0.9, xend = -0.7, y = 3, yend = 3, color = "#950FDF", size = 1)+
  annotate("text", x = -0.65, y = 3, label = "Hist-AER", family = "times",vjust = 0.5, hjust = 0, fontface = "bold")+
  annotate("segment", x = -0.9, xend = -0.7, y = 2.8, yend = 2.8, color = "#FF8A00", size = 1)+
  annotate("text", x = -0.65, y = 2.8, label = "Hist-GHG", family = "times",vjust = 0.5, hjust = 0, fontface = "bold")+
  annotate("segment", x = -0.9, xend = -0.7, y = 2.6, yend = 2.6, color = "#FF0000", size = 1)+
  annotate("text", x = -0.65, y = 2.6, label = "Hist-NAT", family = "times",vjust = 0.5, hjust = 0, fontface = "bold")+
  annotate("segment", x = -0.9, xend = -0.7, y = 2.4, yend = 2.4, color = "#0000FF", size = 1)+
  annotate("text", x = -0.65, y = 2.4, label = "Hist-ALL", family = "times",vjust = 0.5, hjust = 0, fontface = "bold")+
  xlab("DSI")+ylab("Probability density")+
  theme(
    panel.grid = element_blank(),
    axis.text.x = element_text(face = "bold", size = rel(1), family = "times", color = "black"),
    axis.text.y = element_text(face = "bold", size = rel(1), family = "times", color = "black"),
    axis.title.y = element_text(face = "bold", size = rel(1), family = "times", color = "black"),
    axis.title.x = element_text(face = "bold", size = rel(1), family = "times", color = "black")
  )

png("H:/figure/fig.22.png",width = 6, height = 4, units = "in",res = 400)
p
dev.off()




#-------------------------------------------------------------------------------










