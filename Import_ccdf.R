library(readr)
library(dplyr) 
library(skimr)
library(tidyr)

##### To Import CCDF 2022
dir_path <- "X:/DataPublishing/Sandbox/NNham/R/TestCode_TampaFL"
cur <- "2022-all"
ccdf_filename <- "2023-02-15_CCDF_2022_all.csv"
ccdf_file_path <- paste(dir_path, ccdf_filename, sep = "/")
ccdf_cur <- readr::read_csv(
                ccdf_file_path,
                col_name = FALSE,
                col_types = cols(.default = col_character()),
                na = character()
                )  %>% 
        dplyr::rename_with(
                ~ gsub ("X", "F", .x, fixed = TRUE)   
        )
View(ccdf_cur)


##### To Import CCDF 2010-2021
#Import data (need to break down because it took a long time)
ccdf <- list()
for (yr in c(2010:2013)) {
        ccmdf_filename <- paste0("ccdf_", yr, ".csv")
        ccmdf_file_path <- paste("X:/DataPublishing/DataLib/DEATH_MASTER_FILES/CCDF/FINAL/Data Files", ccmdf_filename, sep = "/")
        ccdf[[yr]] <- readr::read_csv(
                ccmdf_file_path,
                col_name = FALSE,
                col_types = cols(.default = col_character()),
                na = character()
                ) %>% 
                dplyr::rename_with(
                        ~ gsub ("X", "F", .x, fixed = TRUE)   
                )
}
for (yr in c(2014:2017)) {
        ccmdf_filename <- paste0("ccmdf_", yr, ".csv")
        ccmdf_file_path <- paste("X:/DataPublishing/DataLib/DEATH_MASTER_FILES/CCMDF/Data Files", ccmdf_filename, sep = "/")
        ccdf[[yr]] <- readr::read_csv(
                ccmdf_file_path,
                col_name = FALSE,
                col_types = cols(.default = col_character()),
                na = character()
                ) %>% 
                dplyr::rename_with(
                        ~ gsub ("X", "F", .x, fixed = TRUE)   
                )
}
View(ccdf[[2017]])
for (yr in c(2018:2021)) {
        ccmdf_filename <- paste0("ccmdf_", yr, ".csv")
        ccmdf_file_path <- paste("X:/DataPublishing/DataLib/DEATH_MASTER_FILES/CCMDF/Data Files", ccmdf_filename, sep = "/")
        ccdf[[yr]] <- readr::read_csv(
                ccmdf_file_path,
                col_name = FALSE,
                col_types = cols(.default = col_character()),
                na = character()
                ) %>% 
                dplyr::rename_with(
                        ~ gsub ("X", "F", .x, fixed = TRUE)   
                )
}

View(ccdf[[2019]])
View(ccdf[[2020]])
View(ccdf[[2021]])

#select columns of interest
df_sl <- list()
for (yr in c(2010:2021)) {
        df_sl[[yr]] <- ccdf[[yr]] %>% 
                dplyr::select(F1, F24, F25, F128, F130,
                              F135, F137, F139, F141, F151,
                ) %>%
                dplyr::filter ("001" <= F128 & F128 <= "115" & F130 == "CA")
        
}
View(df_sl[[2014]])
View(df_sl[[2017]])
View(df_sl[[2021]])