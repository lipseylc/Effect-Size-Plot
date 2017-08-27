# temp source file

plot_data_m = function(method_list,bias,grade,sub,dataset){
  plot_data = data.frame(c())
  for(method_c in method_list){
    data = get(paste0(dataset,method_c,grade,"_",sub))
    data_holder = data.frame(data[,bias])
    data_holder$Method = method_c
    plot_data = bind_rows(plot_data,data_holder)
  }
  colnames(plot_data) = c("Bias","Group")
  return(plot_data)
}



plot_data_b = function(Bias_list,method,grade,sub,dataset){
  plot_data = data.frame(c())
  for(bias_c in Bias_list){
    data = get(paste0(dataset,method,grade,"_",sub))
    data_holder = data.frame(data[,bias_c])
    data_holder$Bias_Group = bias_c
    plot_data = bind_rows(plot_data,data_holder)
  }
  colnames(plot_data) = c("Bias","Group")
  return(plot_data)
}