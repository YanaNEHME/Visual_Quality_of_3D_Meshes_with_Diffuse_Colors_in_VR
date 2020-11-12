		Replicate statistical analyzes of the "3D Meshes with Diffuse Colors Database"
***********************************************************************************************************************************

The statistical analyzes concerns our publicly available "3D Meshes with Diffuse Colors Database" (to download this datavase, please refer to the "readme.txt" of the "Dataset" folder). 
These analyses were presented in section 4.3 of our paper entitled "Visual Quality of 3D Meshes with Diffuse Colors in Virtual Reality: Subjective and Objective Evaluation", and 
published in IEEE Transactions on Visualization and Computer Graphics (TVCG, DOI: 10.1109/TVCG.2020.3036153).

The statistical analyzes mainly explore the influence of source models, animations and viewpoints on both the subjetive quality scores and their confidence intervals.

This folder contains:
(1) "All_Stimuli_MOS_and_MLE.csv": The subjective data collected from our subjective experiment:
   -- It provides the Mean Opinion Score (MOS) of each stimulus of our 480 stimuli, as well as their confidence interval (CI).
   -- It also provides the "recovered MOSs" associated with their 95% confidence intervals, computed using the recovery model based on maximum likelihood estimation 
      (MLE) [Li et al. 2017]. This approach recovers subjective quality scores from noisy raw measurements, by jointly estimating the subjective quality of impaired 
      stimuli (true score/recovered MOS), the bias and inconsistency of test subjects, and the ambiguity of the visual content all together. Hence, the MLE model 
      improves classical MOS calculation by removing the uncertainty from subjects and contents. In our case, these recovered MOSs remain close to classical MOSs 
      (0.998 Spearman correlation).

      In this csv file the acronyms for stimuli refer to Source_DistType_DistStrength_Viewpoint_Animation). The width of confidence intervals = 2 * the given CIs.

(2) "Statistical_analysis.R": R script to process these data (All_Stimuli_MOS_and_MLE.csv) and replicate figures 6, 7 and 8, shown in the paper cited above. These figures 
    are provided in the folder named "Results".

(3) "Output_figures": Directory in which the generated figures are saved (when we execute the "Statistical_analysis.R" script).

***********************************************************************************************************************************

The operating System is WINDOWS

To replicate the statistical analyses, please follow the folowing steps:

Language that needs to be installed: R language (+ IDE Rstudio Desktop - optional) 
-----------------------------------------------------------------------------------
1- Download and Install R (R is a freely available language and environment for statistical computing and graphics):
   https://cran.rstudio.com/bin/windows/base/R-4.0.3-win.exe
   The distribution is distributed as an installer R-4.0.3-win.exe. Just run this for a Windows-style installer.
   P.S: REMEMBER THE PATH WHERE DID YOU INSTALL R (default path is: C:\Program Files\R\R-4.0.3)

 - OPTIONAL: Download and Install RStudio Desktop (IDE)
   https://download1.rstudio.org/desktop/windows/RStudio-1.3.1093.exe
   It includes a console, syntax-highlighting editor that supports direct code execution

Run the script R
----------------------
2- Open a window powerShell in "Statistical_Analysis" folder (this folder). This folder contain the 
   "All_Stimuli_MOS_and_MLE.csv": The collected data to be analysed
   "Output_figures": empty folder to save the generated figures
   "Statistical_analysis.R": R script which takes 2 arguments: (1) the path to the collected data and (2) the path to save the output figures

3- Run the "Statistical_analysis.R" script using the following command line:
& 'PATH_where_R_Is_INSTALLED\bin\Rscript.exe' 'PATH_to_theRScript/Statistical_analysis.R' 'First_arg_PATH_to_Collected_data/All_Stimuli_MOS_and_MLE.csv' 'Second_arg_PATH_To_OutputDir'

Example of command, if u opened the terminal in the "Statistical_Analysis" folder:
& 'C:\Program Files\R\R-4.0.3\bin\Rscript.exe' 'Statistical_analysis.R' 'All_Stimuli_MOS_and_MLE.csv' 'Output_figures'

(Note that, Statistical_analysis.R first (automatically) installs the "ggplot2" package, needed to generate figures.)

** OPTIONAL: If you use the IDE, Rstudio desktop: 
- Open RStudio App
- Open "Statistical_analysis.R"
- Go to "Paths to be specified" section, and then comment line 6: # args = commandArgs(trailingOnly=TRUE). 
  Replace args[1] (line 9) and args[2] (line 12) by the corresponding full paths, like the example paths provided in comments.
- Select the lines you want to exectute, then click on ctrl+Enter (or the "run" button on the top right of the window).
- To visualize the figures directly in the plots window, instead of saving them as pdfs, 
  comment the lines starting by pdf(file=......) and invisible(dev.off())


Finally, compare figures generated (in the "Output_figures" folder) and those provided in the "Results" folder.

References
-----------
*[Li et al. 2017] Z. Li and C. G. Bampis, “Recover subjective quality scores from noisy measurements,” in Data Compression Conference (DCC), 2017. IEEE, 2017, pp. 52–61.