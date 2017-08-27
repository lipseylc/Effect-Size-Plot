##### R file to load data #####
rm(list=ls())

project_wd = getwd()

#### Read data ####
# Prospects #

data_select = c("ECLS","LSAY","Prospects")

# OLS #
for(data_l in data_select){
  
  # Recode data, wave, subject name
  if(data_l == "Prospects"){
    data_s = "Pros"
    data_wave = c("P1","P2","P3","P4","P5","P6","P7")
    subjects = c("Math","Reading")
  }else if (data_l == "LSAY"){
    data_s = data_l
    data_wave = c("G8","G9","G10","G11","G12")
    subjects = c("Math","Science")
  }else{
    data_s = data_l
    data_wave = c("C1","C2","C3")
    subjects = c("Math","Reading")
  }
  
  
  for(wave in data_wave){
    for(sub in subjects){
      # Recode subjects
      if(sub == "Math"){
        sub_s = "M"
      }else if(sub == "Reading"){
        sub_s = "R"
      }else{
        sub_s = "S"
      }
      
      holder = 
      assign(paste0(data_s,"_OLS_",wave,"_",sub_s),read.csv(paste0(project_wd,"/data/Final.results_",data_l,".",wave,".",sub,".csv")))
    }
  }
}



# PS as covariate #
for(data_l in data_select){
  
  # Recode data, wave, subject name
  if(data_l == "Prospects"){
    data_s = "Pros"
    data_wave = c("P1","P2","P3","P4","P5","P6","P7")
    subjects_s = c("M","R")
  }else if (data_l == "LSAY"){
    data_s = data_l
    data_wave = c("G8","G9","G10","G11","G12")
    subjects_s = c("M","S")
  }else{
    data_s = data_l
    data_wave = c("C1","C2","C3")
    subjects_s = c("M","R")
  }
  
  for(wave in data_wave){
    for(sub in subjects_s){
      assign(paste0(data_s,"_ps_",wave,"_",sub),read.csv(paste0(project_wd,"/data/",wave,sub,"_asCovariate.csv")))
    }
  }
}



# PS weighting #
for(data_l in data_select){
  
  # Recode data, wave, subject name
  if(data_l == "Prospects"){
    data_s = "Pros"
    data_wave = c("P1","P2","P3","P4","P5","P6","P7")
    subjects_s = c("M","R")
  }else if (data_l == "LSAY"){
    data_s = data_l
    data_wave = c("G8","G9","G10","G11","G12")
    subjects_s = c("M","S")
  }else{
    data_s = data_l
    data_wave = c("C1","C2","C3")
    subjects_s = c("M","R")
  }
  
  for(wave in data_wave){
    for(sub in subjects_s){
      assign(paste0(data_s,"_weight_",wave,"_",sub),read.csv(paste0(project_wd,"/data/",wave,sub,"_WeightedES.csv")))
    }
  }
}


# PS matching #
for(data_l in data_select){
  
  # Recode data, wave, subject name
  if(data_l == "Prospects"){
    data_s = "Pros"
    data_wave = c("P1","P2","P3","P4","P5","P6","P7")
    subjects_s = c("M","R")
  }else if (data_l == "LSAY"){
    data_s = data_l
    data_wave = c("G8","G9","G10","G11","G12")
    subjects_s = c("M","S")
  }else{
    data_s = data_l
    data_wave = c("C1","C2","C3")
    subjects_s = c("M","R")
  }
  
  for(wave in data_wave){
    for(sub in subjects_s){
      assign(paste0(data_s,"_match_",wave,"_",sub),read.csv(paste0(project_wd,"/data/",wave,sub,"_Trim_Matching.csv")))
    }
  }
}



