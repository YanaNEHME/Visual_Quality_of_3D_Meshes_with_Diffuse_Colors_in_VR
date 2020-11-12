# Required package to generate figures
install.packages("ggplot2", repos = "http://cran.us.r-project.org")
library(ggplot2)

################## Paths to be specified ################################
args = commandArgs(trailingOnly=TRUE)

# The full path of the data file ("All_Stimuli_MOS_and_MLE.csv")
full_path_of_dataFile = args[1] #ex: 'D:/IEEE TVCG/Replicability Stamp/Statistical_Analysis/All_Stimuli_MOS_and_MLE.csv' 

# The full path to the "Output_figures" directory in which the generated figures are saved
full_path_of_outputFile = args[2]#ex: "D:/IEEE TVCG/Replicability Stamp/Statistical_Analysis/Output_figures/" 


################### Get The subjective data collected from THE subjective experiment ########################

# Specify the full path of the data file ("All_Stimuli_MOS_and_MLE.csv")
full_path_of_dataFile = 'D:/IEEE TVCG/Replicability Stamp/Statistical_Analysis/All_Stimuli_MOS_and_MLE.csv' 

# Read data
Collected_data <-read.csv(full_path_of_dataFile,header=T,sep = ",",stringsAsFactors=T)


# Data organization
Collected_data[, 'Viewpoint'] <- as.factor(Collected_data[, 'Viewpoint'])
Collected_data[, 'Distortion_strength'] <- as.factor(Collected_data[, 'Distortion_strength'])
Collected_data$Distortion_type_aka <- factor(Collected_data$Distortion_type_aka ,levels = c("QGeo", "QCol", "SGeo", "SCol"))


#################### Generate Figure 6 ################################
#Ovrview of the mean opinion scores of all the stimuli, associated with their confidence intervals. 

pdf(file=paste0(full_path_of_outputFile,"/Fig_6.pdf"), width=11.68, height=8.26) #save figure as pdf

ggplot(data = Collected_data , aes(x = Distortion_strength, y = MOS, color = Viewpoint)) + 
  geom_errorbar(aes(ymax = MOS + CI, ymin= MOS - CI, linetype = Animation),lwd=0.5, width =0.8, position = position_dodge(0.6)) +
  geom_point(aes(shape=Animation), position = position_dodge(0.6), size=2.5) +
  facet_grid(Distortion_type_aka ~ Source_model)+
  xlab("Strengths") + 
  ylab("MOS") +
  labs(color = "Viewpoints", shape="Animations", linetype="Animations") +
  theme_bw() +
  theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
        strip.background  = element_rect(colour="black", fill="white"),
        strip.text = element_text(size = 14), 
        legend.title = element_text(size = 14), legend.text = element_text(size=12),
        axis.text =  element_text(size=12),axis.title=element_text(size=14))+
  scale_shape_manual(values=c(19,21))

invisible(dev.off())
print(paste0("Fig. 6 saved in ",full_path_of_outputFile))

#################### Generate Figure 7 ################################

# fig 7.a
pdf(file=paste0(full_path_of_outputFile,"/Fig_7(a).pdf"), width=6.5, height=6.5)#save figure as pdf

ggplot(Collected_data, aes(x=Source_model, y=MOS))+
  stat_boxplot(geom ='errorbar') +
  geom_boxplot(outlier.colour="black", outlier.shape=8, outlier.size=4)+
  stat_summary(fun=mean, geom="point", aes(x=Source_model, y=MOS), 
               shape=20, size =6 ,position = position_dodge(0.75),show.legend = FALSE)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title=element_text(size=22), axis.text.y=element_text(size=18), axis.text.x=element_text(size=18),
        legend.title = element_text(size=22), legend.background = element_blank())+
  ylab("MOS")+
  xlab("Source models")

invisible(dev.off())
print(paste0("Fig. 7(a) saved in ",full_path_of_outputFile))

# fig 7.b
pdf(file=paste0(full_path_of_outputFile,"/Fig_7(b).pdf"), width=6.5, height=6.5)#save figure as pdf

ggplot(Collected_data, aes(x=Source_model, y=MOS, color= Viewpoint))+
  stat_boxplot(geom ='errorbar') +
  geom_boxplot(outlier.colour="black", outlier.shape=8, outlier.size=4)+
  stat_summary(fun = mean, geom="point", aes(x=Source_model, y=MOS, color= Viewpoint), 
               shape=20, size =6 ,position = position_dodge(0.75),show.legend = FALSE)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title=element_text(size=22), axis.text.y=element_text(size=18),axis.text.x=element_text(size=18),
        legend.title = element_text(size=22), legend.text = element_text(size=18),
        legend.direction = "horizontal", legend.position = "top",
        legend.background = element_blank())+#
  ylab("MOS")+
  xlab("Source models")+
  labs(color="Viewpoints")

invisible(dev.off())
print(paste0("Fig. 7(b) saved in ",full_path_of_outputFile))

# fig 7.c
pdf(file=paste0(full_path_of_outputFile,"/Fig_7(c).pdf"), width=6.5, height=6.5)#save figure as pdf

ggplot(Collected_data, aes(x=Distortion_type_aka, y=MOS, color= Viewpoint))+
  stat_boxplot(geom ='errorbar') +
  geom_boxplot(outlier.colour="black", outlier.shape=8, outlier.size=4)+
  stat_summary(fun = mean, geom="point", aes(x=Distortion_type_aka, y=MOS, color= Viewpoint), 
               shape=20, size =6 ,position = position_dodge(0.75),show.legend = FALSE)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title=element_text(size=22), axis.text.y=element_text(size=18),axis.text.x=element_text(size=18),
        legend.title = element_text(size=22), legend.text = element_text(size=18),
        legend.direction = "horizontal", legend.position = "top",
        legend.background = element_blank())+#
  ylab("MOS")+
  xlab("Distortion types")+
  labs(color="Viewpoints")

invisible(dev.off())
print(paste0("Fig. 7(c) saved in " ,full_path_of_outputFile))

# fig 7.d
pdf(file=paste0(full_path_of_outputFile,"/Fig_7(d).pdf"), width=6.5, height=6.5)#save figure as pdf

ggplot(Collected_data, aes(x=Distortion_strength, y=MOS, color= Viewpoint))+
  stat_boxplot(geom ='errorbar') +
  geom_boxplot(outlier.colour="black", outlier.shape=8, outlier.size=4)+
  stat_summary(fun = mean, geom="point", aes(x=Distortion_strength, y=MOS, color= Viewpoint), 
               shape=20, size =6 ,position = position_dodge(0.75),show.legend = FALSE)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title=element_text(size=22), axis.text.y=element_text(size=18),axis.text.x=element_text(size=18),
        legend.title = element_text(size=22), legend.text = element_text(size=18),
        legend.direction = "horizontal", legend.position = "top",
        legend.background = element_blank())+#
  ylab("MOS")+
  xlab("Distortion types")+
  labs(color="Viewpoints")

invisible(dev.off())
print(paste0("Fig. 7(d) saved in ",full_path_of_outputFile))

#################### Generate Figure 8 ################################

# fig 8.a
pdf(file=paste0(full_path_of_outputFile,"/Fig_8(a).pdf"), width=5, height=7)#save figure as pdf

ggplot(Collected_data, aes(x=Source_model, y=CI))+
  stat_boxplot(geom ='errorbar') +
  geom_boxplot(outlier.colour="black", outlier.shape=8, outlier.size=4)+
  stat_summary(fun=mean, geom="point", aes(x=Source_model, y=CI), 
               shape=20, size =6 ,position = position_dodge(0.75),show.legend = FALSE)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title=element_text(size=22), axis.text.y=element_text(size=18), axis.text.x=element_text(size=18),
        legend.title = element_text(size=22), legend.background = element_blank())+
  ylab("CI")+
  xlab("Source models")+
  ylim(c(0,0.6))

invisible(dev.off())
print(paste0("Fig. 8(a) saved in ", full_path_of_outputFile))

# fig 8.b
pdf(file=paste0(full_path_of_outputFile,"/Fig_8(b).pdf"), width=5, height=7)#save figure as pdf

ggplot(Collected_data, aes(x=Viewpoint, y=CI))+
  stat_boxplot(geom ='errorbar') +
  geom_boxplot(outlier.colour="black", outlier.shape=8, outlier.size=4)+
  stat_summary(fun=mean, geom="point", aes(x=Viewpoint, y=CI), 
               shape=20, size =6 ,position = position_dodge(0.75),show.legend = FALSE)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title=element_text(size=22), axis.text.y=element_text(size=18), axis.text.x=element_text(size=18),
        legend.title = element_text(size=22), legend.background = element_blank())+
  ylab("CI")+
  xlab("Viewpoints")+
  ylim(c(0,0.6))

invisible(dev.off())
print(paste0("Fig. 8(b) saved in ",full_path_of_outputFile))

# fig 8.c
pdf(file=paste0(full_path_of_outputFile,"/Fig_8(c).pdf"), width=5, height=7)#save figure as pdf

ggplot(Collected_data, aes(x=Viewpoint, y=CI, color= Animation))+
  stat_boxplot(geom ='errorbar') +
  geom_boxplot(outlier.colour="black", outlier.shape=8, outlier.size=4)+
  stat_summary(fun = mean, geom="point", aes(x=Viewpoint, y=CI, color= Animation), 
               shape=20, size =6 ,position = position_dodge(0.75),show.legend = FALSE)+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title=element_text(size=22), axis.text.y=element_text(size=18),axis.text.x=element_text(size=18),
        legend.title = element_text(size=22), legend.text = element_text(size=18),
        legend.direction = "horizontal", legend.position = "top",
        legend.background = element_blank())+#
  ylab("CI")+
  xlab("Viewpoints")+
  labs(color="Animations")+
  ylim(c(0,0.6))

invisible(dev.off())
print(paste0("Fig. 8(c) saved in ",full_path_of_outputFile))


#################### ANOVA test ################################
res.aov <- (aov(CI ~ Source_model*Viewpoint*Animation, data = Collected_data))
print("")
print("ANOVA Test for CIs")
print(summary(res.aov))
