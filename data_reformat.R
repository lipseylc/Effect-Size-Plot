# For all PS related results 
method_ps = c("ps","weight","match")


data_select = c("ECLS","LSAY","Prospects")


# Propensity score methods #
for(data_l in data_select){
  
  # Recode data, wave, subject name
  if(data_l == "Prospects"){
    data_s = "Pros"
    data_wave = c("P1","P2","P3","P4","P5","P6","P7")
    subjects = c("M","R")
  }else if (data_l == "LSAY"){
    data_s = data_l
    data_wave = c("G8","G9","G10","G11","G12")
    subjects = c("M","S")
  }else{
    data_s = data_l
    data_wave = c("C1","C2","C3")
    subjects = c("M","R")
  }
  
  
  for(wave in data_wave){
    for(method in method_ps){
      for(sub in subjects){
        data = get(paste0(data_s,"_",method,"_",wave,"_",sub))
        holder_05 = t(data[1,2:101])
        holder_10 = t(data[1,102:201])
        holder_15 = t(data[1,202:301])
        holder_20 = t(data[1,302:401])
        holder_25 = t(data[1,402:501])
        holder_30 = t(data[1,502:601])
        holder_40 = t(data[1,602:701])
        holder_50 = t(data[1,702:801])
        data_new = data.frame(cbind(holder_05,holder_10,holder_15,holder_20,holder_25,holder_30,holder_40,holder_50))
        names(data_new) = c("Bias1","Bias2","Bias3","Bias4","Bias5","Bias6","Bias7","Bias8")
        assign(paste0(data_s,"_",method,"_",wave,"_",sub),data_new)
      }
    }
  }
}



                      

# For OLS results
method_ols = c("OLS")

for(data_l in data_select){
  
  # Recode data, wave, subject name
  if(data_l == "Prospects"){
    data_s = "Pros"
    data_wave = c("P1","P2","P3","P4","P5","P6","P7")
    subjects = c("M","R")
  }else if (data_l == "LSAY"){
    data_s = data_l
    data_wave = c("G8","G9","G10","G11","G12")
    subjects = c("M","S")
  }else{
    data_s = data_l
    data_wave = c("C1","C2","C3")
    subjects = c("M","R")
  }
  
  
  for(wave in data_wave){
    for(method in method_ols){
      for(sub in subjects){
        data = get(paste0(data_s,"_",method,"_",wave,"_",sub))
        data = data$Adj.ES_5
        holder_05 = data[1:100]
        holder_10 = data[101:200]
        holder_15 = data[201:300]
        holder_20 = data[301:400]
        holder_25 = data[401:500]
        holder_30 = data[501:600]
        holder_40 = data[601:700]
        holder_50 = data[701:800]
        data_new = data.frame(Bias1 = holder_05,Bias2 = holder_10,
                              Bias3 = holder_15,Bias4 = holder_20,
                              Bias5 = holder_25,Bias6 = holder_30,
                              Bias7 = holder_40,Bias8 = holder_50)
        assign(paste0(data_s,"_",method,"_",wave,"_",sub),data_new)
      }
    }
  }
}







