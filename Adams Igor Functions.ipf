#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.


Window Adams_Igor_Functions() : Panel
	PauseUpdate; Silent 1		// building window...
	NewPanel /W=(790,54,1577,606) as "Adam's Igor Functions"
	ModifyPanel cbRGB=(61166,61166,61166)
	ShowTools/A
	SetDrawLayer UserBack
	SetDrawEnv fname= "Bahnschrift",fsize= 48,fstyle= 3
	DrawText 3,60,"Adam's Igor Functions"
	TabControl AJD_Tabs,pos={4.00,73.00},size={772.00,677.00},proc=Adams_TabsProc
	TabControl AJD_Tabs,tabLabel(0)="General Functions",tabLabel(1)="SP2 Functions"
	TabControl AJD_Tabs,tabLabel(2)="ACSM Functions",tabLabel(3)="SMPS Functions"
	TabControl AJD_Tabs,tabLabel(4)="FROGSICLE",tabLabel(5)="GOTHAAM",value= 0
	Button Diurnal_Graph_Button,pos={253.00,103.00},size={112.00,26.00},proc=Diurnal_TimeButt,title="Diel Graph (1D)"
	Button Diurnal_Graph_Button,help={"This button will take in a signal and time wave provided by the user in order to generate a diurnal graph. Please ensure you are in the data folder that contains the nessesary waves. "}
	Button Diurnal_TimeButt,pos={137.00,105.00},size={50.00,20.00},disable=1
	Button ACSM_Density_Calc,pos={11.00,103.00},size={206.00,21.00},disable=1,proc=ACSM_Density_CalcButt,title="ACSM Effective Density Calculation"
	Button ACSM_Density_Calc,help={"Requires the Organic, Nitrate, Sulfate, Ammonium, and Chloride waves from the ACSM to create an effective density to be applied to the SMPS Volume Concentration Data."}
	Button ACSM_Density_CalcButt,pos={227.00,103.00},size={50.00,20.00},disable=1
	Button Average_Interp_Button,pos={12.00,136.00},size={162.00,22.00},proc=Avg_InterpButt,title="Average Interpolation (1D)"
	Button Average_Interp_Button,help={"Takes a faster data set (time and signal) and interpolates it to a slower data set by taking an average of the points between the time interval of the slower data set. User needs to provide name of the faster time and signal waves and slower time wave. "}
	Button Quick_Stats_Butt,pos={14.00,163.00},size={89.00,21.00},proc=Quick_Stats_Button,title="Quick Stats"
	Button Quick_Stats_Butt,help={"This button will provide the average and standard deviation as well as the meidan and lower and upper interquartile range for a signal wave over a specific point range provided by the user. "}
	Button SMPS_VConc2MConc,pos={16.00,107.00},size={454.00,22.00},disable=1,proc=SMPS_VConc2MConc_ACSMDensity_Butt,title="SMPS Volume Concentration to Mass Concentration with ACSM provided Density"
	Button SMPS_VConc2MConc,help={"Calculation of a Mass Concentration of SMPS data from the density found from the ACSM combined with the Volume Concentration of the SMPS. User will need to provide all ACSM chemical specation waves as well as the SMPS VConc wave. "}
	Button Dup2NewDF_Butt,pos={8.00,190.00},size={242.00,19.00},proc=Dup2NF_Butt,title="Duplicate Current Data Folder to New One"
	Button Dup2NewDF_Butt,help={"Take the contents of the current data Folder that you are in and create a duplicate of its contents in a new data folder."}
	Button Dup2NF_Range_Button,pos={252.00,189.00},size={392.00,20.00},proc=Dup2NF_Range_Butt,title="Duplicate Current Data Folder to New One with Selected Wave Range"
	Button Dup2NF_Range_Button,help={"Take the contents of the current data Folder that you are in and create a duplicate of its contents in a new data folder, only copying the range provided in the prompt. "}
	Button ACSM_Organize2D_PieWaves_Butt,pos={12.00,128.00},size={310.00,20.00},disable=1,proc=ACSM_Organize2DPieWaves_Butt,title="Organize Chemical Species Waves for Pie Chart Creation"
	Button ACSM_Organize2D_PieWaves_Butt,help={"This will take the chemical speciation waves provided by the ACSM and a corresponding time wave in order to prep % contributions for pie chart creation."}
	Button Avg_PieWaves_Butt,pos={14.00,154.00},size={175.00,20.00},disable=1,proc=ACSM_Average2DPieWaves_Butt,title="Average Generated Pie Waves"
	Button Avg_PieWaves_Butt,help={"Provides an average of the pie waves generated between 2 points, you will need to be in the data folder that hold the waves needed to generate the pie waves, and has the :All_Pie_Waves data folder within it. "}
	Button ACSM_Ionbalance_Butt,pos={14.00,179.00},size={176.00,19.00},disable=1,proc=ACSM_InorganicIonBalance_Butt,title="Perform Inorganic Ion Balance"
	Button ACSM_Ionbalance_Butt,help={"Performs an Ion balance on a given time wave, with assoicated NO3, NH4 and SO4 signals. "}
	Button Flipwave_Butt,pos={107.00,164.00},size={72.00,18.00},proc=FlipWave_Butt,title="Flip Wave"
	Button MSSGraph_Butt,pos={16.00,203.00},size={128.00,18.00},disable=1,proc=ACSM_MSS_Graph_Butt,title="Graph Mass Spectrum"
	Button MSSGraph_Butt,help={"With a wave of the m/z's needed, and the contribution waves from the ACSM (typically gotten directly from the ACSM Part 2 Processing Software)."}
	Button Min_Time_DiffButt,pos={484.00,105.00},size={286.00,21.00},proc=MinTDiff_Butt,title="Find the minimum time difference in a time wave"
	Button Min_Time_DiffButt,help={"With a provided time wave, finds the minimum amount of time difference in the wave."}
	Button OneTooooOneLINNNNE_Butt,pos={183.00,165.00},size={174.00,18.00},proc=one2oneLine_Butt,title="Make 1:1 Line for Scatter Plot"
	Button OneTooooOneLINNNNE_Butt,help={"With provided x and y wave, creates a 1:1 line to append to a graph."}
	Button Pdiff_Butt,pos={360.00,164.00},size={206.00,20.00},proc=PDiff_Butt,title="Percentage Difference (2 Numbers)"
	Button Pdiff_Butt,help={"Given 2 numbers, finds the percentage difference between them."}
	Button Pdiff_wave_butt,pos={574.00,166.00},size={191.00,20.00},proc=PDiff_Wave_Butt,title="Percentage Difference (2 Waves)"
	Button Pdiff_wave_butt,help={"Finds the percentage difference from 2 waves at each point, generates a new wave to hold these values. "}
	Button PMF_pDom,pos={15.00,225.00},size={178.00,22.00},disable=1,proc=PMF_FracDom_Butt,title="PMF Percentage Contribution"
	Button PMF_pDom,help={"With a given number of factors will calcualte % contribution from different PMF factors."}
	Button SumWnans_Butt,pos={472.00,135.00},size={141.00,18.00},proc=SumWNans_Butt,title="Sum a Wave with NaNs"
	Button SumWnans_Butt,help={"Provides the sum of a wave with NaNs."}
	Button Sum2waveswnans_butt,pos={620.00,134.00},size={146.00,19.00},proc=SumWavesNans_Butt,title="Sum 2 Waves with NaNs"
	Button Sum2waveswnans_butt,help={"With the 2 provided waves, Sum both with no resulting NaN value where one of the waves has a NaN."}
	Button MakeTwaveinterval_Butt,pos={13.00,213.00},size={193.00,20.00},proc=IntervalTwave_Button,title="Make Time Wave with an Interval"
	Button MakeTwaveinterval_Butt,help={"Creates a time wave with a user inputted time interval."}
	Button Time_Stats_butt,pos={210.00,214.00},size={122.00,19.00},proc=Time_Stats_Button,title="Time Interval Stats"
	Button Time_Stats_butt,help={"With a given time and signal wave choose an interval to calculate average, standard deviation and median. "}
	Button Excel2Igor_Butt,pos={343.00,214.00},size={193.00,19.00},proc=Excel2Igor,title="Convert Excel Time to Igor Time"
	Button Excel2Igor_Butt,help={"Takes a Wave containing Excel times and converts them into Igor time."}
	Button Igor2Excel_Butt,pos={542.00,213.00},size={185.00,19.00},proc=Igor2Excel,title="Convert Igor Time to Excel Time"
	Button Igor2Excel_Butt,help={"Takes a Wave containing IGor times and converts them into Excel time."}
	Button ExtractLEOButt,pos={12.00,103.00},size={112.00,21.00},disable=1,proc=AJD_Extract_LEO_Waves,title="Extract LEO Waves"
	Button ExtractLEOButt,help={"To be used with the PSI DMT Toolkit. Extract nessesary waves from the LEO folder from the SP2. "}
	Button ExtractLEOButt,fColor=(65535,0,0)
	Button SP2_TimeAvgLEOWaves_Butt,pos={176.00,102.00},size={179.00,40.00},disable=1,proc=AJD_Time_Avg_LEO_Waves,title="Concatenate and Time Average\r LEO Waves"
	Button SP2_TimeAvgLEOWaves_Butt,help={"This button will time average the extracted waves that the 'Extract LEO Waves'"}
	Button Get_Mixing_State_Parameters_Butt,pos={408.00,105.00},size={167.00,19.00},disable=1,proc=AJD_Get_Mixing_State_Parameters,title="Get Mixing State Parameters"
	Button Get_Mixing_State_Parameters_Butt,help={"From Zeng et al. (2024) Get the mixing state parametrs of loaded rBC data."}
	Button Multiply2WaveswNans_Butt,pos={16.00,235.00},size={165.00,17.00},proc=MultiplyWavesNans_Butt,title="Multiply 2 Waves with NaNs"
	Button Multiply2WaveswNans_Butt,help={"From 2 provided Waves, multiply them and discount points with NaNs."}
	Button MultiplyWavesNans_Butt,pos={191.00,235.00},size={50.00,20.00},disable=1
	Button Graphmaker_Butt,pos={15.00,105.00},size={111.00,25.00},proc=AJD_Graph_Maker,title="Make a Graph"
	Button Graphmaker_Butt,help={"Provided the X and Y Waves, make a graph. "}
	Button GraphAppender_Butt,pos={133.00,104.00},size={117.00,26.00},proc=AJD_Graph_Appender,title="Append to a Graph"
	Button GraphAppender_Butt,help={"Append Y trace to a Graph. "}
	Button ExportSP2Waves_Butt,pos={13.00,126.00},size={112.00,20.00},disable=1,proc=AJD_Export_Waves,title="Export SP2 Waves"
	Button ExportSP2Waves_Butt,help={"Export Extracted LEO Waves"}
	Button ExportSP2Waves_Butt,fColor=(0,0,65535)
	Button Human_Lung_Dep_General_Butt,pos={408.00,130.00},size={265.00,19.00},disable=1,proc=AJD_Human_Lung,title="General Human Lung Deposition Calculation"
	Button Human_Lung_Dep_General_Butt,help={"This will run a general human lung deposition calculation provided a diameter Wave. "}
	Button Human_Lung_Dep_Test,pos={555.00,157.00},size={189.00,22.00},disable=1,proc=AJD_Human_Lung_Test,title="Human Lung Deposition Test"
	Button Human_Lung_Dep_Test,help={"This will run a test of the human lung deposition model, and is designed to run with a fake wave of diameters in nm from 1 - 10000 (0.001-10 um)"}
	Button Human_Lung_Dep_Test,fColor=(36873,14755,58982)
	Button HRT_SD_SP2_Butt,pos={16.00,268.00},size={340.00,22.00},disable=1,proc=AJD_SD_Lung_Dep,title="SP2 Size Distribution Human Lung Deposition Calculation"
	Button HRT_SD_SP2_Butt,help={"Runs a size dependent human lung deposition calculation from SP2 data. "}
	Button SMPS_HumanLungPrep_Butt,pos={17.00,134.00},size={347.00,19.00},disable=1,title="Prepare Imported SMPS Waves for Lung Deposition Calculation"
	Button SMPS_HumanLungPrep_Butt,help={"Takes the ICARTT exported SMPS Waves from the Farmer Group SMPS Processor and prepares them for the human respitory tract deposition calculation."}
	Button SMPS_HumanLung_Dep,pos={25.00,161.00},size={240.00,16.00},disable=1,proc=AJD_SMPS_HumanLung,title="SMPS Human Lung Deposition Calculation"
	Button SMPS_HumanLung_Dep,help={"Performs the Size Dependent Human Lung Deposition Calculation for the SMPS data."}
	Button Mixing_State_Diagram_Butt,pos={603.00,103.00},size={165.00,20.00},disable=1,proc=AJD_Mixing_State_Diagram,title="Make Mixing State Diagram"
	Button Mixing_State_Diagram_Butt,help={"Creates a graph to view mixing state calculations"}
	Button PointsinWave2NaN_Butt,pos={186.00,235.00},size={175.00,17.00},proc=PointsinWave2NaN_Butt,title="Point range to NaN in Wave"
	Button PointsinWave2NaN_Butt,help={"Given a wave and point range, set the Wave to NaN in the point range. "}
	Button Get_VED_Butt,pos={368.00,234.00},size={184.00,21.00},proc=GetVED_Butt,title="Get Volume Equivalent Diameter"
	Button Get_VED_Butt,help={"Provided Mass and Density, will assume sphereicity and derive the Volume Equivalent Diameter."}
	Button Restime_Button,pos={14.00,264.00},size={270.00,23.00},proc=Restime_butt,title="Residence Time and Reynolds Number in Tubing"
	Button Restime_Button,help={"Provided prompted variables, calculate the Residence Time and Reynolds Number of the tubing system."}
	Button SP2_Uncert_Button,pos={19.00,293.00},size={156.00,20.00},disable=1,proc=SP2_Uncert_Butt,title="Find SP2 Uncertainty Values"
	Button SP2_Uncert_Button,help={"Provided XXX, finds uncertainty values of YYY. "}
	Button PMF_MatrixNaNButton,pos={525.00,127.00},size={216.00,20.00},disable=1,proc=PMF_NaNMatrixButt,title="PMF Prep: NaN Matrix Waves"
	Button PMF_MatrixNaNButton,help={"This button will NaN values in the matrices needed for PMF for a range given by the user. "}
	Button PMF_AvgMatrix_BUtton,pos={518.00,152.00},size={219.00,25.00},disable=1,proc=PMF_AvgMatrixButt,title="PMF Prep: Average Matrices and Waves"
	Button PMF_AvgMatrix_BUtton,help={"Average the PMF waves to a user chosen time frame."}
	Button PMF_OrganizeWaves_Button,pos={518.00,179.00},size={220.00,23.00},disable=1,proc=PMF_OrganizewavesButt,title="PMF Prep: Organize PMF Waves"
	Button PMF_OrganizeWaves_Button,help={"Create a new data folder containing the previously prepped PMF waves to allow easy saving and exportation. "}
	Button ACSM_Tseries_Basic_Filter_Butt,pos={15.00,251.00},size={179.00,18.00},disable=1,proc=ACSM_Tseries_Basic_Filter_Butt,title="Time Series Basic Filter"
	Button ACSM_Tseries_Basic_Filter_Butt,help={"This button will perfrom the time series basic filter on pOrg,pNO3,pNH4,pSO4, and pChl"}
	Button PET__pmf_button_pop_FactorTser_Diurnal,pos={505.00,251.00},size={236.00,22.00},disable=1,proc=pmf_button_pop_FactTser_Diurnal,title="PET Diurnal Time Series"
	Button PET__pmf_button_pop_FactorTser_Diurnal,help={"Uses PET code to create diurnal time series"}
	Button PET_pmf_button_pop_FactorTser_Fract,pos={506.00,278.00},size={236.00,22.00},disable=1,proc=pmf_button_pop_FactTser_Fract,title="PET Fractional Time Series"
	Button PET_pmf_button_pop_FactorTser_Fract,help={"Uses PET code to create diurnal time series"}
	Button PET_pmf_button_pop_FactorTser_Tseries,pos={506.00,304.00},size={236.00,22.00},disable=1,proc=pmf_button_pop_FactTser_Tseries,title="PET Mass Time Series"
	Button PET_pmf_button_pop_FactorTser_Tseries,help={"Uses PET code to create diurnal time series"}
	Button PET_pmf_button_pop_FactProfileMS,pos={505.00,335.00},size={236.00,22.00},disable=1,proc=pmf_button_pop_FactProfilePlot,title="PET Factor Profile MSS"
	Button PET_pmf_button_pop_FactProfileMS,help={"Uses PET code to create a Factor Profile"}
	Button PET_Prep_Buttons,pos={540.00,215.00},size={182.00,32.00},disable=1,proc=PET_Prep_Button,title="Prep PET Variables and Strings"
	Button PET_Prep_Buttons,help={"Establish all of the variables and strings needed to run PET Toolkit codes."}
	Button PET_updatepval,pos={325.00,220.00},size={172.00,21.00},disable=1,proc=PET_nfactorButt,title="Update Solution to Look At"
	Button PET_updatepval,help={"Update the number of solutions you want to view"}
	Button PET_pmf_button_pop_FactProfilePlot1,pos={504.00,364.00},size={236.00,22.00},disable=1,proc=pmf_button_pop_VarianceFract,title="PET Factor Profile Plot"
	Button PET_pmf_button_pop_FactProfilePlot1,help={"Uses PET code to create a Factor Profile"}
	Slider p_slider,pos={321.00,247.00},size={176.00,56.00},disable=1,proc=pmf_slider_p
	Slider p_slider,limits={0,9,1},value= 3,vert= 0
	Button ImportSP2Waves_Butt,pos={14.00,150.00},size={112.00,20.00},disable=1,proc=AJD_Import_Binary_Waves_butt,title="Import SP2 Waves"
	Button ImportSP2Waves_Butt,help={"Import Extracted SP2 Binary Waves"}
	Button ImportSP2Waves_Butt,fColor=(26205,52428,1)
	Button ConcatImportedSP2Waves_Butt,pos={10.00,209.00},size={142.00,31.00},disable=1,proc=AJD_Concatenate_SP2_Waves,title="Concatenate Imported\rSP2 Waves"
	Button ConcatImportedSP2Waves_Butt,help={"Import Extracted SP2 Binary Waves"}
	Button ConcatImportedSP2Waves_Butt,fColor=(39321,39321,39321)
	Button PMF_Imported_Plot_Diurnal_Butt,pos={15.00,308.00},size={175.00,38.00},disable=1,proc=PMF_Imported_Plot_Diurnal_Button,title="PMF Imported Waves\rPlot Diurnal Graph"
	Button PMF_Imported_Plot_TSeries_Butt,pos={15.00,359.00},size={175.00,38.00},disable=1,proc=PMF_Imported_Plot_TSeries_Button,title="PMF Imported Waves\rPlot Time Series Graph"
	Button PMF_Imported_2D_to_1D_Waves_Butt,pos={15.00,405.00},size={175.00,38.00},disable=1,proc=PMF_Imported_2D_to_1D_Waves_Button,title="PMF Imported Waves\rTranform 2D to 1D waves"
	Button ACSM_Tseries_Basic_Filter_General_Button,pos={14.00,272.00},size={178.00,33.00},disable=1,proc=ACSM_Tseries_Basic_Filter_General_Butt,title="Time Series Basic Filter\rGeneral Purpose"
	Button ACSM_Tseries_Basic_Filter_General_Button,help={"This will prompt the user for a wave to perform the time series filters on. "}
	Button PMF_CorrelationGrapher_Butt,pos={15.00,448.00},size={175.00,38.00},disable=1,proc=PMF_CorrelationGrapher_Button,title="PMF Correlation Grapher"
	Button PMF_ElementalRatios_Butt,pos={204.00,441.00},size={177.00,62.00},disable=1,proc=PMF_ElementalRatios_Button,title="PMF Elemental Ratios\rand\rOxidation State"
	Button PMF_ElementalRatios_Butt,help={"From Canagaratna et al. 2015"}
	Button SP2_Filter_Coatings_Button,pos={20.00,311.00},size={156.00,20.00},disable=1,proc=AJD_FilterCTs,title="Filter SP2 Coatings Button"
	Button SP2_Filter_Coatings_Button,help={"Provided a Coatings, Optical Diameter wave, produces a filtered wave where NaNs are assigned to values outside of the filter range. "}
	Button Value2NaN_Butt,pos={564.00,234.00},size={93.00,20.00},proc=Value2NaN_Butt,title="Value to NaN"
	Button Value2NaN_Butt,help={"Finds a value provided by the user and transforms all of the points in a wave to NaNs where that value is found"}
	Button PMF_dfBuilder_butt,pos={11.00,103.00},size={206.00,21.00},disable=1,proc=PMF_dfBuilder_button,title="Build PMF Data Folder Strucuture"
	Button PMF_dfBuilder_butt,help={"Builds the DF hierarchy for PMF for imported waves (includes 10 factor and -1 to 1 fPeak."}
	Button PMF_CorrelationsButt,pos={11.00,127.00},size={206.00,21.00},disable=1,proc=PMF_Correlations_button,title="Make PMF Correlation Graph"
	Button PMF_CorrelationsButt,help={"Using the PMF DF Hierarchy, makes correlation graphs. "}
	Button KillAllGraphs_Button,pos={292.00,265.00},size={93.00,20.00},proc=Kill_All_Graphs,title="Kill all Graphs"
	Button KillAllGraphs_Button,help={"Kills all Graphs"}
	Button KillAllTables_Button,pos={396.00,265.00},size={93.00,20.00},proc=Kill_All_Tables,title="Kill all Tables"
	Button KillAllTables_Button,help={"Kills all Tables"}
	Button PMF_MSS_Graph_Button,pos={12.00,153.00},size={206.00,21.00},disable=1,proc=PMF_MSS_Graph_Butt,title="Make PMF MSS Graph"
	Button PMF_MSS_Graph_Button,help={"Using the PMF DF Hierarchy, makes MSS Graph."}
	Button PMF_TSeries_Graph_Button,pos={11.00,183.00},size={206.00,21.00},disable=1,proc=PMF_TSeries_button,title="Make PMF TSeries Graph"
	Button PMF_TSeries_Graph_Button,help={"Using the PMF DF Hierarchy, makes TSeriesGraph"}
	Button PMF_Diurnal_Graph_Button,pos={12.00,234.00},size={206.00,21.00},disable=1,proc=PMF_Diurnal_button,title="Make PMF Diurnal Graph"
	Button PMF_Diurnal_Graph_Button,help={"Using the PMF DF Hierarchy, makes Diurnal Graph"}
	Button PMF_TSeriesCorrelation_Graph_Button,pos={11.00,209.00},size={223.00,20.00},disable=1,proc=PMF_TSeriesCorrelation_button,title="Make PMF TSeries Correlation Graph"
	Button PMF_TSeriesCorrelation_Graph_Button,help={"Using the PMF DF Hierarchy, makes TSeriesGraph"}
	Button rBCCT_StatsatLevel_Butt,pos={15.00,261.00},size={204.00,19.00},disable=1,proc=rBCCTStatatLevel_Button,title="rBCCT Stats at Minimum Cutoff "
	Button rBCCT_StatsatLevel_Butt,help={"Provides stats for a wave of coatings at a certain cutoff from another signal wave (example PMF % Contribution)."}
	Button SP2_TimeAvgWave_Butt,pos={185.00,146.00},size={156.00,20.00},disable=1,proc=AJD_TimeAvgWave,title="Time Average Any Wave"
	Button SP2_TimeAvgWave_Butt,help={"Time average a signal wave with its corresponding time wave."}
	Button SP2_ExportBinaryWaveList_Butt,pos={192.00,169.00},size={139.00,32.00},disable=1,proc=AJD_ExportBinaryWaveList_ba,title="Export Wave List as \rBinary Waves"
	Button SP2_ExportBinaryWaveList_Butt,help={"With a certain capturing string, export a wave of lists as binary waves."}
	Button TAandExportPBP_Waves,pos={201.00,203.00},size={117.00,34.00},disable=1,proc=AJD_TAandExportPBP_Waves,title="Time Average and \rExport PBP Waves"
	Button TAandExportPBP_Waves,fColor=(0,0,65535)
	Button ImportandTAPBPWaves_Butt,pos={12.00,171.00},size={118.00,35.00},disable=1,proc=AJD_ImportandTAPBP_Waves,title="Import Time \rAveraged PBP Waves"
	Button ImportandTAPBPWaves_Butt,help={"Import Time Averaged Extracted Binary PBP Waves. This is ESSENTIAL as the PBP waves occupy TOO MUCH SPACE when they are not averaged. Do this AFTER IMPORTING ALL OF THE OTHER WAVES."}
	Button ImportandTAPBPWaves_Butt,fColor=(26205,52428,1)
	Button AJD_SP2HeatMap_Butt,pos={18.00,285.00},size={203.00,24.00},disable=1,proc=AJD_SP2HeatMap_Butt,title="Make SP2 HeatMap"
	Button SP2_TimeAvgFolderWaves_Butt,pos={344.00,149.00},size={152.00,33.00},disable=1,proc=AJD_TimeAvgFolderWaves,title="Time Average all Waves\rin a folder"
	Button SP2_TimeAvgFolderWaves_Butt,help={"Time average a signal wave with its corresponding time wave."}
	Button ImportFolderBinary_Butt,pos={353.00,183.00},size={104.00,34.00},disable=1,proc=AJD_Import_Binary_Folder_butt,title="Import Folder Full\rof Binary Waves"
	Button ImportFolderBinary_Butt,help={"Import Extracted SP2 Binary Waves"}
	Button ImportFolderBinary_Butt,fColor=(26205,52428,1)
	Button ConcatFolders_WavebyWave,pos={501.00,265.00},size={202.00,22.00},proc=Concat2Folders_Butt,title="Concatenate Waves in Two Folders"
	Button ConcatFolders_WavebyWave,help={"Given two folders with similar waves in each of them, concatenate all of the similar waves."}
	Button SP2_CodeFixButton,pos={572.00,191.00},size={159.00,36.00},disable=1,proc=AJD_SP2CodeGlitchFix_Butt,title="Fix Waves affected by SP2\rsave one of glitch"
	Button SP2_CodeFixButton,help={"Uses Imported SP2 waves hierarchy."}
	Button SP2_CodeFixSDBinButton,pos={573.00,236.00},size={159.00,36.00},disable=1,proc=AJD_SP2LastBin2NaN_Butt,title="Last SD to bin to NaN"
	Button SP2_CodeFixSDBinButton,help={"Uses Imported SP2 waves hierarchy."}
	Button Average_Interp2D_Button,pos={177.00,136.00},size={162.00,22.00},proc=Avg_Interp2DButt,title="Average Interpolation (2D)"
	Button Average_Interp2D_Button,help={"Takes a faster data set (time and signal) and interpolates it to a slower data set by taking an average of the points between the time interval of the slower data set. User needs to provide name of the faster time and signal waves and slower time wave. "}
	Button Average_InterpList_Button,pos={341.00,132.00},size={127.00,32.00},proc=Avg_InterpListButt,title="Average Interpolation\rfor a list of waves"
	Button Average_InterpList_Button,help={"Perform either 1D or 2D wavelist"}
	Button SMPS_VConcDistr2MConcDistr,pos={13.00,186.00},size={269.00,21.00},disable=1,proc=SMPS_VConc2MConc_ACSMDensity_Butt,title="SMPS VConc Distr to MConc Distr with Density"
	Button SMPS_VConcDistr2MConcDistr,help={"Calculation of a Mass Concentration of SMPS data from the density found from the ACSM combined with the Volume Concentration of the SMPS. User will need to provide all ACSM chemical specation waves as well as the SMPS VConc wave. "}
	Button StopAllTimers_Button,pos={660.00,237.00},size={93.00,20.00},proc=Stop_All_Timers_butt,title="Stop all Timers"
	Button StopAllTimers_Button,help={"Kills all Tables"}
	Button Make_Bdr_Wave_button,pos={15.00,296.00},size={96.00,22.00},proc=MakeBdrWave_butt,title="Make Bdr Wave"
	Button Make_Bdr_Wave_button,help={"With a provided wave, create a boundry wave off of it. (Used in aerosol size distributions)"}
	Button AJD_2DDiurnal_Button,pos={19.00,318.00},size={122.00,39.00},disable=1,proc=AJD_2DDiurnal_Butt,title="Make 2D Diurnal\r(Intended for SD)"
	Button Diurnal_Graph2D_Button,pos={370.00,102.00},size={114.00,30.00},proc=Diurnal_TimeButt,title="Diel Graph (2D)"
	Button Diurnal_Graph2D_Button,help={"This button will take in a signal and time wave provided by the user in order to generate a diurnal graph. Please ensure you are in the data folder that contains the nessesary waves. "}
	Button Make_Mono_Wave,pos={203.00,328.00},size={194.00,22.00},proc=MakeMonoWave_butt,title="Make Increasing Monotonic Wave"
	Button Make_Mono_Wave,help={"With a provided wave, create an increasing monotonic wave off of it. (Used in HeatMaps)"}
	Button TotalConcFromSD_Butt,pos={243.00,298.00},size={184.00,21.00},proc=CalcTCfromSD_butt,title="Get Total Concentration from SD"
	Button TotalConcFromSD_Butt,help={"Provided a Size Distribution (SD) and a Boundry Diameter wave, generate a wave of the total concentration."}
	Button AJD_StatsFromSD,pos={17.00,363.00},size={106.00,22.00},disable=1,proc=AJD_SDStats_Butt,title="Stats from SD"
	Button AJD_StatsFromSD,help={"From Size Distribution provides: Mean, Geometric Mean, Geometric Standard Deviation, Mode and Total Concentration."}
	Button AJD_MakeBCCoreSD,pos={16.00,392.00},size={172.00,17.00},disable=1,proc=AJD_MakeBCCoreSD,title="Make Avg BC Core Mass SD"
	Button AJD_MakeBCCoreSD,help={"Creates BC Core Mass Size Distribution"}
	Button AJD_SP2_HumanLungCalc,pos={11.00,413.00},size={134.00,35.00},disable=1,proc=AJD_SD_Lung_Dep,title="Distribution Human\rLung Deposition Calc"
	Button AJD_SP2_HumanLungCalc,help={"Uses SP2 data to run the human lung deposition code."}
	Button WaveChange2Dto1D,pos={436.00,298.00},size={136.00,20.00},proc=TwoDto1D_Butt,title="Change 2D wave to 1D"
	Button WaveChange2Dto1D,help={"Change a 2D wave to a 1D wave."}
	Button SP2_rBCContainingParticle_Density,pos={22.00,337.00},size={136.00,33.00},disable=1,proc=AJD_rBCcontParticle_DenistyButt,title="Make rBC Containing \rParticle Density Wave"
	Button SP2_rBCContainingParticle_Density,help={"Provided a Coatings, Optical Diameter wave, produces a wave of assumed density for that specific particle."}
	Button Percentage_UnderOver_Butt,pos={223.00,261.00},size={204.00,19.00},disable=1,proc=pUnderOver_Button,title="Percentage under/over threshold"
	Button Percentage_UnderOver_Butt,help={"Provides % where a signal wave is under and over a threshold"}
	Button AJD_ReBin_Butt,pos={226.00,286.00},size={137.00,22.00},disable=1,proc=AJD_ReBin_SD_Butt,title="Rebin Size Distribution"
	Button AJD_ReBin_Butt,help={"Provided a min and max range, rebin a size distribution."}
	Button rBCDmob2Mass,pos={587.00,290.00},size={118.00,36.00},proc=rBCmobility2Mass_Butt,title="rBC Mobility \rDiameter to Mass"
	Button rBCDmob2Mass,help={"Provided Mass and Density, will assume sphereicity and derive the Volume Equivalent Diameter."}
	Button rBCDmob2massWave,pos={640.00,329.00},size={120.00,50.00},proc=rBCmobility2MassWave_Butt,title="rBC Mobility \rDiameter to Mass \rfor a wave"
	Button rBCDmob2massWave,help={"Provided Mass and Density, will assume sphereicity and derive the Volume Equivalent Diameter."}
	Button ErrorPropWaves_Button,pos={16.00,322.00},size={168.00,33.00},proc=ErrorPropWaves_Butt,title="Error Propogation of Waves"
	Button ErrorPropWaves_Button,help={"With two provided waves (and associated error waves), propogate error based on desired user operation. "}
	Button ACSMLOD_byMinPnt,pos={194.00,273.00},size={115.00,29.00},disable=1,proc=GeneralTS_FilterbyMinPnt_Button,title="ACSM LOD Filter"
	Button ACSMLOD_byMinPnt,help={"With the a provided wave and corresponding LOD cut off the inputted time wave by the LOD"}
	Button Make_Midpoint_Wave_button,pos={113.00,297.00},size={122.00,21.00},proc=MakeMidpointWave_butt,title="Make Midpoint Wave"
	Button Make_Midpoint_Wave_button,help={"With a provided bdr wave, create a midpoint wave off of it. (Used in aerosol size distributions)"}
	Button SP2_PBP_CT_Chop,pos={182.00,310.00},size={111.00,22.00},disable=1,proc=PBP_CT_Chop_Button,title="PBP CT Chopping"
	Button SP2_PBP_CT_Chop,help={"This button will access 2 DT waves that correspond to 2 signal waves (a PMF and PBP CT wave) and then create 2 output waves where CTs are at/above a threshold and below a threshold on a PBP basis. "}
	Button SP2_PBP_CT_ChopList,pos={183.00,335.00},size={109.00,33.00},disable=1,proc=PBP_CT_ChopList_Button,title="PBP CT Chopping\rList"
	Button SP2_PBP_CT_ChopList,help={"This button does the same thing that PBP CT Chopping does but with a wavelist"}
	Button SP2MasterExtract,pos={14.00,243.00},size={119.00,23.00},disable=1,proc=SP2MasterExtract_Button,title="Master Extraction"
	Button SP2MasterExtract,help={"This button will extract all important waves from all of the folders generated by the SP2 toolkit and store them in desired folders."}
	Button SP2MasterExtract,font="MS UI Gothic",fColor=(26411,1,52428)
	Button ExcelTextDT2IgorDTWave_Butt,pos={403.00,329.00},size={224.00,36.00},proc=ExcelTextWave2IgorDT_Butt,title="Change Excel DT read as a text wave\rinto an Igor numerical DT wave"
	Button ExcelTextDT2IgorDTWave_Butt,help={"Currently this is set up to handle 'YYYY-MM-DD.HH:SS' excel stored DT format, but can be adjusted (see function for comments that provide more details.\""}
	Button SortTop5PercentPMF_Button,pos={196.00,178.00},size={234.00,18.00},disable=1,proc=PMF5Percent_Butt,title="Sort Top 5% to find extreme contribution"
	Button SortTop5PercentPMF_Button,help={"Provided a time wave, organic signal wave, and PMF waves, sort and isolate the percent contribution at the top 5% of organic signal. "}
	Button HistogramTimeAvg,pos={367.00,286.00},size={112.00,35.00},disable=1,proc=TimeAvgHistMatrix_Butt,title="Generate Time\rInterval Histogram"
	Button HistogramTimeAvg,help={"Provided a time and signal wave, create a matrix of histograms that correspond to an averaging time provided (meant to be used with SP2 PBP CT data)."}
	Button IntegratedSignal,pos={17.00,362.00},size={109.00,19.00},proc=Integrated_Signal_Button,title="Integrated Signal"
	Button IntegratedSignal,help={"Provided a wavelist identifier, determine the % contribution of each of the waves through an integrated signal method. "}
	Button LoadAllFilesInFolder,pos={136.00,362.00},size={94.00,34.00},proc=LoadInAllDelimitedTextinFolder_Button,title="Load all Files\rin folder"
	Button VEDtoDaero,pos={23.00,388.00},size={198.00,33.00},disable=1,proc=VED2DAero_Button,title="Volume/Mass equivalent Diameter\rto Aerodynamic Diameter"
	Button SP2_FOM_Accuracy,pos={29.00,425.00},size={116.00,37.00},disable=1,proc=SP2_CalibrationAccuracy_Butt,title="SP2 Figure of Merit:\rAccuracy"
	Button SP2_FOM_Accuracy,help={"Provided Fit Peak Heights (amplitude) and Standard Deviations (and corresponding Dmob; all from calibration data) for all incandescent detectors, determine detector and overall SP2 accuracy"}
	Button SP2_AppliedAccuracy,pos={147.00,425.00},size={125.00,22.00},disable=1,proc=SP2_ApplyAccuracy_Butt,title="SP2 Apply Accuracy"
	Button SP2_AppliedAccuracy,help={"Provided the overall SP2 accuracy from 'SP2 Figure of Merit: Accuracy' apply it to diameter or mass waves to generate a lower and upper wave."}
	Button FlowV2FlowS,pos={267.00,363.00},size={111.00,32.00},proc=VFlow2StdFlow_Button,title="Volumetric Flow to\rStandard Flow"
	Button PearsonsR,pos={380.00,367.00},size={84.00,36.00},proc=PearsonsR_butt,title="Pearson's R \r(2 waves)"
	Button PearsonsR,help={"Provides 2 waves ensures there are no NaNs or Inf and then performs Pearson's R. Ensure your waves are synched up in some meaningful way."}
	Button GraphMaxMinPnts,pos={471.00,367.00},size={103.00,33.00},proc=GraphMaxMinPnts_butt,title="Find trace\rmax/min points"
	Button GraphMaxMinPnts,help={"Given trace on graph (top window) find max and min pnts on it and mark them"}
	Button DmobtoDaero,pos={223.00,387.00},size={159.00,35.00},disable=1,proc=DMob2DAero_Button,title="Electrical Mobility Diameter\rto Aerodynamic Diameter"
	Button SplitWaveIntoParts,pos={391.00,388.00},size={160.00,24.00},disable=1,proc=SplitWaveintoParts_Button,title="Split Wave Into Equal Parts"
	Button SplitWaveIntoParts,help={"This is designed for PBP data where the length of waves becomes an issue. Take a wave and duplicate it x times into equal parts."}
	Button MakeICARTT_Table,pos={14.00,385.00},size={121.00,18.00},proc=MakeICARTT_Table_Button,title="Make ICARTT Table"
	Button MakeICARTT_Table,help={"Provided an ICARTT Folder, with appropriatly named waves, and create a table in ICARTT format."}
	Button SeperateForICARTT,pos={15.00,405.00},size={89.00,32.00},proc=SeperateForICARTT_Button,title="Seperate SD\rfor ICARTT"
	Button SeperateForICARTT,help={"Provided a SD and a Midpoint diameter wave, take the MD and split it into a bunch of 1D waves with the midpoint diameter names. "}
	Button GOTHAAM_BC_ICARTT,pos={586.00,326.00},size={130.00,24.00},disable=1,proc=SP2_ICARTT_GOTHAAM_Button,title="GOTHAAM BC ICARTT"
	Button GOTHAAM_BC_ICARTT,help={"This button will move preselected waves in the PSI SP2 toolkit into a ICARTT Folder and then create an ICARTT table with them."}
	Button GOTHAAM_BC_ICARTT,fColor=(17476,17476,17476)
	Button FlightTrack,pos={14.00,99.00},size={94.00,36.00},disable=1,proc=FlightTrack_Button,title="Flight Track \rand Animation"
	Button VertConc,pos={14.00,142.00},size={137.00,21.00},disable=1,proc=VertConc_Button,title="Vertical Concentration"
	Button AltConc,pos={15.00,168.00},size={137.00,21.00},disable=1,proc=AltConc_Button,title="Altitude Concentration"
	Button DoBasicGOTHAAMPlots,pos={666.00,99.00},size={101.00,37.00},disable=1,proc=DoBasicGOTHAAMPlots_Button,title="Do basic\rGOTHAAM Plots"
	Button LagTimevsCoatingThickness,pos={15.00,198.00},size={115.00,52.00},disable=1,proc=LagvsCT_Button,title="Lag Time\rvs\rCoating Thickness"
	Button GOTHAAM_SP2_STP_WaveFix,pos={664.00,143.00},size={101.00,39.00},disable=1,proc=GOTHAAM_SP2_STPWaveFix_Button,title="GOTHAAM SP2 \rSTP WaveFix"
	Button BCMD_Outlier,pos={619.00,187.00},size={148.00,19.00},disable=1,proc=BCSDOutlier_Button,title="BCSD remove outlier"
	Button SD_Hist_Slider,pos={598.00,502.00},size={171.00,34.00},disable=1,proc=SD_Hist_Slider_Button,title="Histogram/Size Distribution\rSlider (in dev)"
	Button SD_Hist_Slider,help={"Currently in development; idea is to create a slider to look at a time series of histograms (similar to PSI SP2 TSer dist sliders)."}
	Button AvgInterpWList,pos={641.00,211.00},size={122.00,20.00},disable=1,proc=AvgInterpWList_Button,title="Avg Interp Wave List"
	Button LoadNetCDF4File,pos={14.00,259.00},size={120.00,21.00},disable=1,proc=LoadNetCDF4_Button,title="Load NetCDF4 File"
	Button LoadNetCDF4File,help={"Load Net CDF 4 File; Note that this is NOT MY CODE; this is just a button format to execute Kyle Zarzana (UCAR as of 2025) NetCDF loader. "}
	Button P2P_Stats_Hist,pos={600.00,464.00},size={114.00,34.00},disable=1,proc=P2P_Stats_Hist_Button,title="Point to Point Stats\r(Histogram)"
	Button P2P_Stats_Hist,help={"Provided there is a graph (histogram), determine stats between cursor points"}
EndMacro

//////////////////////////////////////////////////
////////////All Tab Control Functions/////////////
//////////////////////////////////////////////////
//////////////////AJD 9/17/2024///////////////////
//////////////////////////////////////////////////

//Inspired from the PSI SP2 code as this is my first time doing this

Function Adams_TabsProc(ctrlName, tabNumb) : TabControl
	String ctrlName
	Variable tabNumb
	
	//Preparations
	string savedDF=getdatafolder(1) //remember current data folder
	//Access global variables/strings
	if(datafolderexists("root:AdamToolkit")==0)	//If it does not exist
		newdatafolder/S root:AdamToolkit
		DFREF DD_DF = getdatafolderDFR()
	elseif(datafolderexists("root:AdamToolkit")==1)	//If it does exist
		setdatafolder root:AdamToolkit
		DD_DF = GetdatafolderDFR()
	endif
	
	setdatafolder root:AdamToolkit
	Variable/G AssumedBCDensity = 1800 //kg/m^3
	Make/O/D/n=19 Gysel_dEff_Diameter
	Note/K Gysel_dEff_Diameter, "Diameter (nm) from Gysel et al. (2011) Supplimental Information (doi:https://doi.org/10.5194/amt-4-2851-2011). Fullerene Soot; Stock: 40971; lot: FS12S011; Investigator PSI; Method: APM+SP2."
	Make/O/D/n=19 Gysel_dEff_Mass
	Note/K Gysel_dEff_Mass, "Mass (fg) from Gysel et al. (2011) Supplimental Information (doi:https://doi.org/10.5194/amt-4-2851-2011). Fullerene Soot; Stock: 40971; lot: FS12S011; Investigator PSI; Method: APM+SP2."
	Make/O/D/n=19 Gysel_dEff_Density 
	Note/K Gysel_dEff_Density, "Density (kg/m3) from Gysel et al. (2011) Supplimental Information (doi:https://doi.org/10.5194/amt-4-2851-2011). Fullerene Soot; Stock: 40971; lot: FS12S011; Investigator PSI; Method: APM+SP2."
	
	//Set up lists and append to waves
	String GyselDiam_List = "71.1285;91.4084;111.66;131.899;152.121;172.324;192.511;222.766;252.991;283.209;313.381;343.567;373.721;403.856;433.999;464.135;514.357;551;824"
	String GyselMass_List = "0.198142;0.357066;0.593051;0.912032;1.32261;1.85652;2.5131;3.7405;5.42143;7.47129;9.91608;12.636;15.7408;19.1574;22.9764;26.9435;34.9723;42.14;97.0941"
	String GyselDensity_List = "1051.59;892.878;813.581;759.079;717.572;692.888;672.735;646.226;639.44;628.168;615.352;595.084;575.952;555.468;536.806;514.662	;490.83;481.106;331.446;"

	Variable i
	for(i=0;i<numpnts(Gysel_dEff_Diameter);i++)
		Gysel_dEff_Diameter[i] = str2num(stringfromlist(i,GyselDiam_List,";"))
		Gysel_dEff_Mass[i] = str2num(stringfromlist(i,GyselMass_List,";"))
		Gysel_dEff_Density[i] = str2num(stringfromlist(i,GyselDensity_List,";"))
	Endfor
	
	//Setup some ICARTT wave names	
	String/G ICARTT_wNames_Time = "Time_Start;Time_Stop;Time_Mid;Time_Start_Local;Time_Stop_Local;Time_Mid_Local;"
	String/G ICARTT_wNames_BC = "BC;BCCoatThick;BCMassSizeDist;"
	String/G ICARTT_wNames_ACSM = "Organic;OrganicAerosol_LLOD;Organic_Median;Organic_StdDev;Nitrate;Nitrate_LLOD;Nitrate_Median;Nitrate_StdDev;Ammonium;Ammonium_LLOD;Ammonium_Median;Ammonium_StdDev;Sulfate;Sulfate_LLOD;Sulfate_Median;Sulfate_StdDev;Chloride;Chloride_LLOD;Chloride_Median;Chloride_StdDev;Organic_Uncert;Nitrate_Uncert;Ammonium_Uncert;Sulfate_Uncert;Chloride_Uncert;"
	String/G ICARTT_wNames_SMPS = "TotalNumbConc;GeoMean;GeoStdDev;"
	String/G ICARTT_Notes_LII = "Refractory Black Carbon from LII (Laser-induced incandescence) size is the refractory black carbon size derived from mass measurement and assumptions of void free density (1.8 g/cc) and spherical shape. Refractory black carbon mass is determined from incandescent light intensity at vaporization temperature."
 
 	//Setup some latitude and longitude stuff for the flightmap
// 	Variable/G Lat1
// 	Variable/G Lat2
// 	Variable/G Long1
// 	Variable/G Long2
 	
 	//User Choice variable for any number of functions
 	Variable/G UserChoice = -9999
 	string/G UserWave0 = ""
 	string/G UserWave1 = ""
 	
	
	setdatafolder savedDF
	//Set Tab
	TabControl AJD_Tabs value=tabNumb
	
	//Variables assigning tabNumbs
	variable tabNumGeneral = 0
	variable tabNumSP2		= 1
	variable tabNumACSM 	= 2
	variable tabNumSMPS 	= 3
	variable tabNumFROGSICLE = 4
	variable tabNumGOTHAAM = 5
	
	
	//First Tab (General)
	if(tabNumb == 0)
	DrawAction delete
		//Enable Controls on the General Tab
		
		//General Functions
		Button Diurnal_Graph_Button, disable=0
		Button Average_Interp_Button, disable=0
		Button Quick_Stats_Butt, disable=0
		Button Dup2NewDF_Butt, disable=0
		Button Dup2NF_Range_Button, disable=0
		button Flipwave_Butt, disable=0
		Button Min_Time_DiffButt, disable=0
		Button OneTooooOneLINNNNE_Butt, disable=0
		Button Pdiff_Butt, disable=0
		Button Pdiff_wave_butt, disable=0
		Button SumWnans_Butt, disable=0
		Button Sum2waveswnans_butt, disable=0
		Button MakeTwaveinterval_Butt, disable=0
		Button Time_Stats_butt, disable=0
		Button Excel2Igor_Butt, disable=0
		Button Igor2Excel_Butt, disable=0
		Button Multiply2WaveswNans_Butt, disable=0
		Button Graphmaker_Butt, disable=0
		Button GraphAppender_Butt, disable=0
		Button PointsinWave2NaN_Butt, disable=0
		Button Get_VED_Butt, disable=0
		Button Restime_Button, disable=0
		Button Value2NaN_Butt, disable=0
		Button KillAllGraphs_Button, disable=0
		Button KillAllTables_Button, disable=0
		Button ConcatFolders_WavebyWave, disable=0
		Button Average_Interp2D_Button, disable=0
		Button Average_InterpList_Button, disable=0
		Button StopAllTimers_Button, disable=0
		Button Make_Bdr_Wave_button, disable=0
		Button Diurnal_Graph2D_Button, disable=0
		Button Make_Mono_Wave, disable=0
		Button TotalConcFromSD_Butt, disable=0
		BUtton WaveChange2Dto1D, disable=0
		Button rBCDmob2Mass, disable=0
		Button rBCDmob2MassWave, disable=0
		Button ErrorPropWaves_Button, disable=0
		Button Make_Midpoint_Wave_button, disable=0
		Button ExcelTextDT2IgorDTWave_Butt, disable=0
		Button LoadAllFilesInFolder, disable=0
		Button IntegratedSignal, disable=0
		Button FlowV2FlowS, disable=0
		Button PearsonsR, disable=0
		Button GraphMaxMinPnts, disable=0
		Button MakeICARTT_Table, disable=0
		Button SeperateForICARTT, disable=0
		
		//Other Stuff
		
		 
	else
		//Hide Controls on General Functions Tab
		Button Diurnal_Graph_Button, disable=1
		Button Average_Interp_Button, disable=1
		Button Quick_Stats_Butt, disable=1
		Button Dup2NewDF_Butt, disable=1
		Button Dup2NF_Range_Button, disable=1
		Button Flipwave_Butt, disable=1
		Button Min_Time_DiffButt, disable=1
		Button OneTooooOneLINNNNE_Butt, disable=1
		Button Pdiff_Butt, disable=1
		Button Pdiff_wave_butt, disable=1
		Button SumWnans_Butt, disable=1
		BUtton Sum2waveswnans_butt, disable=1
		Button MakeTwaveinterval_Butt, disable=1
		Button Time_Stats_butt, disable=1
		Button Excel2Igor_Butt, disable=1
		Button Igor2Excel_Butt, disable=1
		Button Multiply2WaveswNans_Butt, disable=1
		Button Graphmaker_Butt, disable=1
		Button GraphAppender_Butt, disable=1
		Button PointsinWave2NaN_Butt, disable=1
		Button Get_VED_Butt, disable=1
		Button Restime_Button, disable=1
		Button Value2NaN_Butt, disable=1
		Button KillAllGraphs_Button, disable=1
		Button KillAllTables_Button, disable=1
		Button ConcatFolders_WavebyWave, disable=1
		Button Average_Interp2D_Button, disable=1
		Button Average_InterpList_Button, disable=1
		Button StopAllTimers_Button, disable=1
		Button Make_Bdr_Wave_button, disable=1
		Button Diurnal_Graph2D_Button, disable=1
		Button Make_Mono_Wave, disable=1
		Button TotalConcFromSD_Butt, disable=1
		Button WaveChange2Dto1D, disable=1
		Button rBCDmob2Mass, disable=1
		Button rBCDmob2MassWave, disable=1
		Button ErrorPropWaves_Button, disable=1
		Button Make_Midpoint_Wave_button, disable=1
		Button ExcelTextDT2IgorDTWave_Butt, disable=1
		Button LoadAllFilesInFolder, disable=1
		Button IntegratedSignal, disable=1
		Button FlowV2FlowS, disable=1
		Button PearsonsR, disable=1
		Button GraphMaxMinPnts, disable=1
		Button MakeICARTT_Table, disable=1
		Button SeperateForICARTT, disable=1
		
		
		//Other Stuff
	
	
	endif
	
	//Second Tab (SP2 Functions)
	if(tabNumb == 1)
		DrawAction delete
		//Enable Controls on the SP2 Tab
		
		//General Functions
		Button ExtractLEOButt, disable=0
		Button Get_Mixing_State_Parameters_Butt, disable=2
//		Button SP2_TimeAvgExtractedWaves_Butt, disable=2
		Button SP2_TimeAvgLEOWaves_Butt, disable=0
		Button HRT_SD_SP2_Butt, disable=2
		Button ExportSP2Waves_Butt, disable=0
		Button Human_Lung_Dep_Test, disable=2
		Button Human_Lung_Dep_General_Butt, disable=2
		Button Mixing_State_Diagram_Butt, disable=2
		Button SP2_Uncert_Button, disable=2
		Button ImportSP2Waves_Butt,disable=0
		Button ConcatImportedSP2Waves_Butt,disable=0
//		Button AJD_Time_Avg_LEO_Waves, disable=0
		Button SP2_Filter_Coatings_Button, disable=0
		Button SP2_TimeAvgWave_Butt, disable=0
		Button SP2_ExportBinaryWaveList_Butt, disable=0
		Button TAandExportPBP_Waves, disable=0
		Button ImportandTAPBPWaves_Butt, disable=2
		Button ImportFolderBinary_Butt, disable=0
		Button SP2_TimeAvgFolderWaves_Butt, disable=0
		Button SP2_CodeFixButton, disable=0
		Button SP2_CodeFixSDBinButton, disable=0
		Button SP2_rBCContainingParticle_Density, disable=0
		Button SP2_PBP_CT_Chop, disable=0
		Button SP2_PBP_CT_ChopList, disable=0
		Button SP2MasterExtract, disable=0
		Button VEDtoDaero, disable=0
		Button SP2_FOM_Accuracy, disable=0
		Button SP2_AppliedAccuracy, disable=0
		Button DmobtoDaero, disable=0
		Button SplitWaveIntoParts, disable=0
		Button GOTHAAM_BC_ICARTT, disable=0
				
		//Other things
		SetDrawEnv linethick= 4.00,arrow= 1,arrowfat= 2.00
		DrawLine 127,113,172,113
		SetDrawEnv linethick= 4.00,arrow= 1,arrowfat= 2.00
		DrawLine 357,113,402,113
		SetDrawEnv linethick= 4.00,arrow= 1,arrowfat= 2.00
		DrawLine 350,123.859259133821,402,139
		SetDrawEnv linethick=4.00, arrow= 1, arrowfat= 2.00
		DrawLine 576,113,601,113
		
	else
		//Hide Controls on SP2 Functions Tab
		Button ExtractLEOButt, disable=1
		Button Get_Mixing_State_Parameters_Butt, disable=1
//		Button SP2_TimeAvgExtractedWaves_Butt, disable=1
		Button SP2_TimeAvgLEOWaves_Butt, disable=1
		Button HRT_SD_SP2_Butt, disable=1
		Button ExportSP2Waves_Butt, disable=1
		Button Human_Lung_Dep_Test, disable=1
		Button Human_Lung_Dep_General_Butt, disable=1
		Button Mixing_State_Diagram_Butt, disable=1
		Button SP2_Uncert_Button, disable=1
		Button ImportSP2Waves_Butt,disable=1
		Button ConcatImportedSP2Waves_Butt,disable=1
//		Button AJD_Time_Avg_LEO_Waves, disable=1
		Button SP2_Filter_Coatings_Button, disable=1
		Button SP2_TimeAvgWave_Butt, disable=1
		Button SP2_ExportBinaryWaveList_Butt, disable=1
		Button TAandExportPBP_Waves, disable=1
		Button ImportandTAPBPWaves_Butt, disable=1
		Button ImportFolderBinary_Butt, disable=1
		Button SP2_TimeAvgFolderWaves_Butt, disable=1
		Button SP2_CodeFixButton, disable=1
		Button SP2_CodeFixSDBinButton, disable=1
		Button SP2_rBCContainingParticle_Density, disable=1
		Button SP2_PBP_CT_Chop, disable=1
		Button SP2_PBP_CT_ChopList, disable=1
		Button SP2MasterExtract, Disable=1
		Button VEDtoDaero, disable=1
		Button SP2_FOM_Accuracy, disable=1
		Button SP2_AppliedAccuracy, disable=1
		Button DmobtoDaero, disable=1
		Button SplitWaveIntoParts, disable=1
		Button GOTHAAM_BC_ICARTT, disable=1
		
		
		
		//Other things
		DrawAction delete
		
	
	endif
	
	//Third Tab (ACSM Functions)
	if(tabNumb == 2)
	DrawAction delete
		//Enable Controls on the ACSM Tab
		
		//General Functions
		Button ACSM_Density_Calc, disable=0
		Button ACSM_Organize2D_PieWaves_Butt, disable=0
		Button Avg_PieWaves_Butt, disable=0
		Button ACSM_Ionbalance_Butt, disable=0
		Button MSSGraph_Butt, disable=0
		Button PMF_pDom, disable=0
		Button PMF_MatrixNaNButton, disable=2
		BUtton PMF_OrganizeWaves_Button, disable=2
		Button PMF_AvgMatrix_Button, disable=2
		Button ACSM_Tseries_Basic_Filter_Butt, disable=0
		Button PET_Prep_Buttons, disable=2
		Button PET__pmf_button_pop_FactorTser_Diurnal, disable=2
		Button PET_pmf_button_pop_FactorTser_Fract, disable=2
		Button PET_pmf_button_pop_FactorTser_Tseries, disable=2
		Button PET_pmf_button_pop_FactProfileMS, disable=2
		Button PET_pmf_button_pop_FactProfilePlot1, disable=2
		Button PET_updatepval, disable=2
		Slider p_slider, disable=2
		Button PMF_Imported_Plot_Diurnal_Butt, disable=0
		Button PMF_Imported_Plot_TSeries_Butt, disable=0
		Button PMF_Imported_2D_to_1D_Waves_Butt, disable=0
		Button ACSM_Tseries_Basic_Filter_General_Button, disable=0
		Button PMF_CorrelationGrapher_Butt, disable = 0 
		Button PMF_ElementalRatios_Butt, disable=0
		Button ACSMLOD_byMinPnt, disable=0
		Button SortTop5PercentPMF_Button, disable=0
		
		//Other things
		SetDrawEnv fstyle=3,fsize=18, fname= "Bahnschrift"
		Drawtext 625,113, "PMF Functions"
		DrawText 297,216,"Currently Does not work; numbers are a bit off and some graphs are weird."
	else
		//Hide Controls on ACSM Functions Tab
		Button ACSM_Density_Calc, disable=1
		Button ACSM_Organize2D_PieWaves_Butt, disable=1
		Button Avg_PieWaves_Butt, disable=1
		Button ACSM_Ionbalance_Butt, disable=1
		Button MSSGraph_Butt, disable=1
		Button PMF_pDom, disable=1
		Button PMF_MatrixNaNButton, disable=1
		Button PMF_OrganizeWaves_Button, disable=1
		Button PMF_AvgMatrix_Button, disable=1
		Button ACSM_Tseries_Basic_Filter_Butt, disable=1
		Button PET_Prep_Buttons, disable=1
		Button PET__pmf_button_pop_FactorTser_Diurnal, disable=1
		Button PET_pmf_button_pop_FactorTser_Fract, disable=1
		Button PET_pmf_button_pop_FactorTser_Tseries, disable=1
		Button PET_pmf_button_pop_FactProfileMS, disable=1
		Button PET_pmf_button_pop_FactProfilePlot1, disable=1
		Button PET_updatepval, disable=1
		Slider p_slider, disable=1
		Button PMF_Imported_Plot_Diurnal_Butt, disable=1
		Button PMF_Imported_Plot_TSeries_Butt, disable=1
		Button PMF_Imported_2D_to_1D_Waves_Butt, disable=1
		Button ACSM_Tseries_Basic_Filter_General_Button, disable=1
		Button PMF_CorrelationGrapher_Butt, disable=1
		Button PMF_ElementalRatios_Butt, disable=1
		Button ACSMLOD_byMinPnt, disable=1
		Button SortTop5PercentPMF_Button, disable=1
		
		//Other Things
		
	endif

	//Fourth Tab (SMPS Functions)
	if(tabNumb == 3)
	DrawAction delete
		//Enable Controls on the SMPS Tab
		
		//General Functions
		Button SMPS_VConc2MConc, disable=0
		Button SMPS_HumanLungPrep_Butt, disable=0
		Button SMPS_HumanLung_Dep, disable=0
		Button SMPS_VConcDistr2MConcDistr, disable=0
		
	else
		//Hide Controls on SMPS Functions Tab
		Button SMPS_VConc2MConc, disable=1
		Button SMPS_HumanLungPrep_Butt, disable=1
		Button SMPS_HumanLung_Dep, disable=1
		Button SMPS_VConcDistr2MConcDistr, disable=1
		
	
	endif
	
	//5th tab (FROGSICLE Analysis Specific Code)
	if(tabNumb==4)
	DrawAction delete
		//Enable Controls on the FROGSICLE Tab
		Button PMF_dfBuilder_butt, disable=0
		Button PMF_CorrelationsButt, disable=0 
		Button PMF_Diurnal_Graph_Button, disable=0
		Button PMF_TSeries_Graph_Button, disable=0
		Button PMF_MSS_Graph_Button, disable=0
		Button PMF_TSeriesCorrelation_Graph_Button, disable=0
		Button rBCCT_StatsatLevel_Butt, disable=0
		Button AJD_SP2HeatMap_Butt, disable=0
		Button AJD_2DDiurnal_Button, disable=0
		Button AJD_StatsFromSD, disable=0
		Button AJD_MakeBCCoreSD, disable=0
		Button AJD_SP2_HumanLungCalc, disable=0
		Button Percentage_UnderOver_Butt, disable=0
		Button AJD_ReBin_Butt, disable=0
		Button HistogramTimeAvg, disable=0
		
		
	
	else
		Button PMF_dfBuilder_butt, disable=1
		Button PMF_CorrelationsButt, disable=1
		Button PMF_Diurnal_Graph_Button, disable=1
		Button PMF_TSeries_Graph_Button, disable=1
		Button PMF_MSS_Graph_Button, disable=1
		Button PMF_TSeriesCorrelation_Graph_Button, disable=1
		Button rBCCT_StatsatLevel_Butt, disable=1
		Button AJD_SP2HeatMap_Butt, disable=1
		Button AJD_2DDiurnal_Button, disable=1
		Button AJD_StatsFromSD, disable=1
		Button AJD_MakeBCCoreSD, disable=1
		Button AJD_SP2_HumanLungCalc, disable=1
		Button Percentage_UnderOver_Butt, disable=1
		Button AJD_ReBin_Butt, disable=1
		Button HistogramTimeAvg, disable=1		
	
	
	endif
	
	if(tabNumb==5)
	DrawAction delete
		//Enable Controls on the GOTHAAM Tab
		Button FlightTrack, disable=0
		Button VertConc, disable=0
		Button AltConc, disable=0
		Button DoBasicGOTHAAMPlots, disable=0
		Button LagTimevsCoatingThickness, disable=0
		Button GOTHAAM_SP2_STP_WaveFix, disable=0
		Button BCMD_Outlier, disable=0
		Button SD_Hist_Slider, disable=0
		Button AvgInterpWList, disable=0
		Button LoadNetCDF4File, disable=0
		Button P2P_Stats_Hist, disable=0
	else
		Button FlightTrack, disable=1
		Button VertConc, disable=1
		Button AltConc, disable=1
		Button DoBasicGOTHAAMPlots, disable=1
		Button LagTimevsCoatingThickness, disable=1
		Button GOTHAAM_SP2_STP_WaveFix, disable=1
		Button BCMD_Outlier, disable=1
		Button SD_Hist_Slider, disable=1
		Button AvgInterpWList, disable=1
		Button LoadNetCDF4File, disable=1
		Button P2P_Stats_Hist, disable=1
	endif
	
	
	//Always keep certain things drawn on the GUI
	SetDrawEnv fstyle= 3,fsize= 48,fname= "Bahnschrift";DelayUpdate
	DrawText 3,60,"Adam's Igor Functions"
	


End


/////////////////////////////////////////////////////////////////////
///////All Button Control Functions and their acessed Functions//////
/////////////////////////////////////////////////////////////////////
////////////////////////////AJD 9/17/2024////////////////////////////
/////////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////////
/////////////////////Diurnal Time and Graph//////////////////////////
/////////////////////////////////////////////////////////////////////


//Button function for the diurnal graphing code
Function Diurnal_TimeButt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
		
			//Inital Check: Is the user in a good Data Folder?
			doalert/T="Initial Check" 2, "Are you in the Data folder that holds the waves to be used?"
			if(V_Flag ==1)
			elseif(V_Flag==2)
				abort "User is not in a good Data Folder to run the code. Aborting."
			elseif(V_Flag==3)
				abort "User is not in a good Data Folder to run the code. Aborting."
			else
				abort "Unknown Input. Aborting."
			endif
		
		
			string twave_str = ""
			string sigwave_str = ""
			prompt twave_str, "Please enter the time wave to be used."
			prompt sigwave_str, "Please enter the signal wave to be used."
			doprompt "Please Enter the following infomation.", twave_str, sigwave_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave twave = $twave_str
			wave sigwave = $sigwave_str
			wave Hour_Wave = diurnal_time(twave, sigwave)	//Get the waves in to a diurnal time format
			diurnal_graph(twave, sigwave, Hour_Wave)	//Run the formatted waves through a graphing function
		case 2:
			break
		endswitch
end

//The purpose of this diurnal time function is to create a diurnal waves of the time and signal wave provided by the user. It is one of the two functions ran by the diurnal_timebutt function. 
Function/Wave diurnal_time(twave, sigwave)	//Creates Diurnal Time Graph of the time wave (twave) and signal wave (sigwave) provided
	wave twave //time wave
	wave sigwave //signal wave
	
	
	try
		
		variable V_Flag
		setScale d 0,0,"dat",twave		//Change to dat scale if not in that scale already
		
		String err_str = GetErrMessage(V_Flag,2)	
		
		variable nrows = dimsize(twave,0)
	
		make/o/n=(nrows) Hourwave //Wave to keep track of the hour of each point in the time wave
		wave Hour_Wave = Hourwave
	
		variable i //for loop indexing
		string hourstr //String for finding the hour with the secs2Time() function
	
		for(i=0;i<nrows;i++)
			hourstr = Secs2Time(twave[i], 3) 
			Hourwave[i] = str2num(hourstr)
	
		Endfor
	
		catch
			
			variable Catcherror = GetRTError(1)
			if(V_AbortCode == -4)
			Abort "Abort triggered by AbortOnRTE."
			elseif(V_AbortCode == -3)
			Abort "Abort triggered by abort operation."
			elseif(V_AbortCode == -2)
			Abort "Abort triggered by stack overflow."
			elseif(V_AbortCode == -1)
			Abort "Abort triggered by user."
			elseif(V_AbortCode >=1)
			Abort "Abort triggered by AbortOnValue."
			endif
		endtry
		
		return Hour_Wave
End

function diurnal_graph(twave, sigwave, Hour_Wave)

	wave twave, sigwave //time wave, signal wave
	wave Hour_Wave //Wave containing the hour markings of the time wave found by the Diurnal_Time function
	
	
	variable nrows = dimsize(twave,0)
	variable j //Indexing variable

	//Make free waves to track things
	make/Free/o/n=24 Diurnal_X = p //Create xwave and use this in the graph to mark out hours 0-23
	make/Free/o/n=24 Diurnal_Y_Avg = NaN //Average Wave
	make/Free/o/n=24 Diurnal_Y_stdev = NaN // Standard Deviation Wave
	make/Free/o/n=24 Diurnal_Y_median = NaN // median wave
	make/Free/o/n=24 Diurnal_Y_UIQR = NaN // Upper IQR wave
	make/Free/o/n=24 Diurnal_Y_LIQR = NaN // Lower IQR wave
	
	
	variable i //Indexing variable
	
	for(i=0;i<numpnts(Diurnal_X);i++)	//For Hour_X (make the wave)
		string currwavename = "Hour_"+ num2str(i)
		make/o/n=(nrows) $currwavename = NaN 
		wave tempwave = $currwavename	//Define the string name as a wave name
		for(j=0; j<nrows; j++)	//Cycle through all of sigwave and Hour_Wave
			if(Hour_Wave[j] == i)
				tempwave[j] = sigwave[j]
			else
			endif
		EndFor
		wavetransform zapnans tempwave
			
	//Impliment stats
	duplicate/o tempwave, tempwave_avg
	duplicate/o tempwave, tempwave_median
	duplicate/o tempwave, tempwave_stdev
	duplicate/o tempwave, tempwave_UIQR
	duplicate/o tempwave, tempwave_LIQR
	
	//Avg and Std Dev
	WaveStats/Q tempwave
	tempwave_avg = V_Avg
	tempwave_stdev = v_SDev
	
	//Median and IQR
	StatsQuantiles/Q tempwave
	tempwave_median = v_Median
	tempwave_UIQR = v_Q75
	tempwave_LIQR = v_Q25
	
	//Append the important data to the y_diurnal wave
	Diurnal_Y_avg[i] = tempwave_avg[0]
	Diurnal_Y_Median[i] = tempwave_Median[0]
	Diurnal_Y_stdev[i] = tempwave_stdev[0]
	Diurnal_Y_UIQR[i] = tempwave_UIQR[0]
	Diurnal_Y_LIQR[i] = tempwave_LIQR[0]
	
	killwaves/Z tempwave, tempwave_avg, tempwave_median, tempwave_stdev, tempwave_UIQR, tempwave_LIQR
		
	Endfor
	//Move away from /Free Waves
	
	string Diurnal_Hour_name = "Diurnal_Hour_"+nameofwave(sigwave)
	string Diurnal_Average_name = "Diurnal_Average_" + nameofwave(sigwave)
	string Diurnal_Median_name = "Diurnal_Median_" +  nameofwave(sigwave)
	string Diurnal_StDev_name = "Diurnal_StdDev_" + nameofwave(sigwave)
	string Diurnal_UIQR_name = "Diurnal_UIQR_" + nameofwave(sigwave)
	string Diurnal_LIQR_name = "Diurnal_LIQR_"+ nameofwave(sigwave)
	
	duplicate/o Diurnal_X, $Diurnal_Hour_name
	duplicate/o Diurnal_Y_Avg, $Diurnal_Average_name
	duplicate/o Diurnal_Y_Median, $Diurnal_Median_name
	duplicate/o Diurnal_Y_stdev, $Diurnal_StDev_name
	duplicate/o Diurnal_Y_UIQR, $Diurnal_UIQR_name
	duplicate/o Diurnal_Y_LIQR, $Diurnal_LIQR_name
	
	//Make and send waves to the shadow realm (a new data folder)
	DFREF CurrDF = getdatafolderDFR()
	string newdfname = "Diurnal_"+nameofwave(sigwave)
	newdatafolder/O/S $newdfname
	DFREF DDF = getdatafolderDFR()
	setdataFolder CurrDF
	
	string DiurnalWave_List = ""
	DiurnalWave_List += wavelist("*Diurnal*",";","CMPLX:0")
	variable nDiurnal_Waves = itemsinlist(DiurnalWave_List,";")
	for(i=0;i<nDiurnal_Waves;i++)
		string wname_str = stringfromlist(i,DiurnalWave_List,";")
		wave wname = $wname_str
		duplicate/O wname, DDF:$wname_str
	Endfor
	
	
	//Get rid of unnesseary wave(s)
	killwaves Hour_Wave
	for(i=0;i<nDiurnal_Waves;i++)
		wname_str = stringfromlist(i,DiurnalWave_List,";")
		killwaves $wname_str
	Endfor
	
	
	//Impliment Graphing
	setdatafolder DDF
	string GraphName = "Diurnal_Graph_"+nameofwave(sigwave)
	Killwindow/Z $GraphName
	display/N=$GraphName //Bring up a graph and name it 'diurnal graph#'
	
	appendtograph $Diurnal_Average_name vs $Diurnal_Hour_name
	appendtograph $Diurnal_Median_name vs $Diurnal_Hour_name
	Legend/C/N=text0/J/A=LT "Diurnal Trend\r\\s("+Diurnal_Average_name+") Diurnal_Average\r\\s("+Diurnal_Median_name+") Diurnal_Median\rShaded region represented by standard deviation"
	//impliment stats
	ErrorBars $Diurnal_Average_name SHADE= {0,0,(0,0,0,0),(0,0,0,0)},wave=($Diurnal_StDev_name,$Diurnal_StDev_name)
	ErrorBars $Diurnal_Median_name SHADE={0,0,(0,0,0,0),(0,0,0,0)},wave=($Diurnal_UIQR_name,$Diurnal_LIQR_name)
	ModifyGraph rgb($Diurnal_Median_name)=(0,0,0)
	//Impliment style changes
	Label left nameofwave(Sigwave) + " (Units)";DelayUpdate
	Label bottom "Hour of the day";DelayUpdate
	ModifyGraph minor(bottom)=1;DelayUpdate
	ModifyGraph minor(left)=1
	
	setdatafolder CurrDF
End



Function AJD_2DDiurnal_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			string WaveMatch_Str = ""
			string BdrMatch_Str = "" 
			String TimeMatch_Str = ""
			prompt WaveMatch_Str, "Please enter the identifying string for the 2D wave (i.e. BHBL_MassDistr, BBLG_NumbDistr)."
			prompt BdrMatch_Str, "Please enter the identifying string for the DiamBdr (i.e. BHBL_DiamBdr, BBLG_NumbDistr)."
			prompt TimeMatch_Str, "Please enter the identifying string for the Time Wave."
			doprompt "Please Enter the following infomation.", WaveMatch_Str, BdrMatch_Str, TimeMatch_str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			AJD_2DDiurnal(WaveMatch_Str, BdrMatch_Str, TimeMatch_Str)
		case 2:
			break
		endswitch
end


function AJD_2DDiurnal(WaveMatch_Str, BdrMatch_Str, TimeMatch_Str)

	//Establish Function Parameters
	String WaveMatch_Str, BdrMatch_Str, TimeMatch_Str

	//Find the waves the user wants
	string WaveMatch_help_Str = "*"+WaveMatch_Str+"*"
	string BdrMatch_help_Str = "*"+BdrMatch_Str+"*"
	string TimeMatch_help_Str = "*"+TimeMatch_Str+"*"
	
	string identifyWave = wavelist(WaveMatch_help_Str, ";", "TEXT:0")
	string identifyTime = wavelist(TimeMatch_help_Str, ";", "TEXT:0")
	string identifyBdr = wavelist(BdrMatch_help_Str,";","TEXT:0")
	wave TwoDWave = $stringfromlist(0,identifyWave,";")
	wave TimeWave = $stringfromlist(0,identifyTime,";")
	wave BdrWave = $stringfromlist(0,identifyBdr,";")
	
	
	//Establish critical variables and strings
	Variable nrows = dimsize(TwoDWave,0)
	variable ncolumns = dimsize(TwoDWave,1)
	variable i, j, z, f
	Variable CurrHour
	
	string Avg_Diurnal_Name = "Diurnal_Avg_"+NameofWave(TwoDWave)
	string SDev_Diurnal_Name = "Diurnal_StdDev_"+nameofwave(TwoDWave)
	string Median_Diurnal_Name = "Diurnal_Median_"+nameofwave(TwoDWave)
	string LIQR_Diurnal_Name = "Diurnal_LIQR_"+nameofwave(TwoDWave)
	string UIQR_Diurnal_Name = "Diurnal_UIQR_"+nameofwave(TWoDWave)
	
	//Do some pre-organization
	DFREF StartDF = getDataFolderDFR()
	//Create a new DF
	string newdfname = "Diurnal_HeatMap_"+nameofwave(TwoDWave)
	NewDatafolder/O/S $newdfname
	DFREF DiurnalDF = getDataFolderDFR()
	setdatafolder StartDF
	
	//Create waves to hold different data
	Make/O/D/N=(25,ncolumns) $Avg_Diurnal_Name
	wave AvgDiurnal = $Avg_Diurnal_Name
	Make/O/D/N=(25,ncolumns) $SDev_Diurnal_Name
	wave SDevDiurnal = $SDev_Diurnal_Name
	Make/O/D/N=(25,ncolumns) $Median_Diurnal_Name
	wave MedianDiurnal = $Median_Diurnal_Name
	Make/O/D/N=(25,ncolumns) $LIQR_Diurnal_Name
	wave LIQRDiurnal = $LIQR_Diurnal_Name
	Make/O/D/N=(25,ncolumns) $UIQR_Diurnal_Name
	wave UIQRDiurnal = $UIQR_Diurnal_Name
	Make/O/D/N=(25) Diurnal_Hour = p-0.01
	Diurnal_Hour[0] = 0
	wave Hour_Wave = diurnal_time(TimeWave, TwoDWave)	//Get the waves in to a diurnal time format
	
	//Run through the loops
	
		//First; set a loop to go through the 24 Hours collected/organized by the 'diurnal_time' function
		//Second; go through all of the rows and collect all of the columns for a matching row
		//This is important as we want to take the entire row (entire SD) and move that to the correct wave that
		//corresponds with the hour it is in.	
	for(i=0;i<numpnts(Diurnal_Hour);i++)	//For Hour_X (make the wave)
		string currwavename = "Hour_"+ num2str(i)
		make/o/n=(nrows,ncolumns) $currwavename = NaN 
		wave tempwave = $currwavename	//Define the string name as a wave name
		for(j=0; j<nrows; j++)	//Cycle through all of sigwave and Hour_Wave
			if(Hour_Wave[j] == i)	//If we get to a point where we align the Hour_Wave with the time we are seeking
				for(z=0;z<ncolumns;z++)
					tempwave[j][z] = TwoDWave[j][z]
				endfor
			else
				//Do nothing
			endif
	EndFor
	//Check to make sure we are not in the '24th' hour
	if(i ==24)
	//Fix the Hour_24 Wave (needed for the Bdr)
		wave Hour_23, Hour_24
		Duplicate/O Hour_23, Hour_24
		Hour_24 = 0 
	endif
	
		zapNaNRows(tempwave)
		//Now perform Averaging
		MatrixOp/O TempCol = averageCols(tempwave)
		wave Temp_StatsQuantilesWave = buildQuantiles(TempWave)	//Generates Temp_StatsQuantilesWave
		WaveStats/PCST TempWave
		wave M_WaveStats
		wave Temp_StatsQuantilesWave
		for(f=0;f<ncolumns;f++)
			AvgDiurnal[i][f] = M_WaveStats[3][f] 
			SDevDiurnal[i][f] = M_WaveStats[4][f]
			MedianDiurnal[i][f] = Temp_StatsQuantilesWave[2][f]
			LIQRDiurnal[i][f] = Temp_StatsQuantilesWave[3][f]
			UIQRDiurnal[i][f] = Temp_StatsQuantilesWave[4][f]
		endfor
		KillWaves/Z M_WaveStats
		KillWaves/Z Temp_StatsQuantilesWave
	endfor
		
	//Kill unnessesary data
	String HourList = Wavelist("*Hour_*",";","TEXT:0")
	variable ListItems = itemsinList(HourList,";")
	for(i=0;i<ListItems;i++)
		KillWaves/Z $stringfromlist(i,HourList,";")
	endfor
	KillWaves/Z HourWave
	
	//Fix up some waves
	DeletePoints/M=0 24, ncolumns, AvgDiurnal
	DeletePoints/M=0 24, ncolumns, SDevDiurnal
	DeletePoints/M=0 24, ncolumns, MedianDiurnal
	DeletePoints/M=0 24, ncolumns, LIQRDiurnal
	DeletePoints/M=0 24, ncolumns, UIQRDiurnal
	Diurnal_Hour = p
	
	//Move waves to new DF
	String Diurnal_Identifier = "*Diurnal*"
	string Diurnal_List = Wavelist(Diurnal_Identifier, ";", "TEXT:0")
	Variable nDiurnalWaves = itemsinlist(Diurnal_List,";")
	for(i=0;i<nDiurnalWaves;i++)
		Wave TempWave = $stringfromlist(i,Diurnal_List,";")
		Movewave TempWave, DiurnalDF:$nameofwave(tempwave)
	endfor
	
	
	//Graph
	//too few points error; fricking pissing me off
	string GraphName = "Diurnal_HeatMap_"+nameofwave(TwoDWave)
	Killwindow/Z $GraphName
	Display/N=$GraphName
	AppendImage/W=$GraphName AvgDiurnal vs {Diurnal_Hour,BdrWave}
	ModifyImage $nameofwave(AvgDiurnal) ctab= {*,*,Geo,0}
	Label left "Diameter (nm)"
	Label bottom "Hour of the Day\r\\Z06Due to the nature of HeatMaps there will be a 24th hour"
	ColorScale/C/N=text0/A=RC image=$nameofwave(AvgDiurnal)
	ColorScale/C/N=text0 "dMdlogDp\\Bc\\M (µg/m\\S3\\M)"
	Modifygraph log(left)=1

	
	//Do some post-organization
	KillWaves/Z TempCol
	KillWaves/Z W_QuantileValues
	KillWaves/Z W_StatsQuantiles
	
	
end

function/Wave zapNanRows(wave in)
    variable i
 	 variable nrows = dimsize(in,0)
 	 variable ncolumns = dimsize(in,1)
    for (i=DimSize(in,0)-1; i>-1; i--)
        Duplicate/Free/RMD=[i][] in, isNan
        Redimension/N=(numpnts(isNan),0) isNan
        WaveTransform zapNans, isNan
        if (numpnts(isNan) == 0)
            DeletePoints/M=0 i,1,in
        endif
//        //Save the wave as a tempwave
//        string Tempwave_Name = "TempWave_"+num2str(i)
//        Duplicate/O isNaN, $TempWave_Name
    endfor
//    
//    string WaveList1D = wavelist("*TempWave*",";","TEXT:0")
//    Concatenate/O/DL WaveList1D, ReconWave
//   return ReconWave
end















/////////////////////////////////////////////////////////////////////
/////////////////////Effective Density Calc//////////////////////////
/////////////////////////////////////////////////////////////////////

Function ACSM_Density_CalcButt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string pOrg_str = ""
			string pNO3_str = ""
			string pSO4_str = ""
			string pNH4_str = ""
			string pChl_str = ""
			string rBC_str = "" 
			
			prompt pOrg_str, "Please enter the organic signal wave to be used."
			prompt pNO3_str, "Please enter the nitrate signal wave to be used."
			prompt pSO4_str, "Please enter the sulfate signal wave to be used."
			prompt pNH4_str, "Please enter the ammonium signal wave to be used."
			prompt pChl_str, "Please enter the chloride signal wave to be used."
			prompt rBC_str, "Please enter the rBC signal wave to be used."
			doprompt "Please Enter the following infomation.", pOrg_str, pNO3_str, pSO4_str, pNH4_str, pChl_str, rBC_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave pOrg = $pOrg_str
			wave pNo3 = $pNO3_str
			wave PSO4 = $pSO4_str
			wave PNH4 = $pNH4_str
			wave pChl = $pChl_str
			wave rBC = $rBC_str
			ACSM_p2p_Density(pOrg,pNo3,pSo4,pNh4,pChl,rBC)
			
		case 2:
			break
		endswitch
end

Function ACSM_p2p_Density(pOrg,pNo3,pSo4,pNh4,pChl,rBC)
	wave pOrg,pNo3,pSo4,pNh4,pChl, rBC
	variable i, npnts
	npnts = dimsize(pOrg,0)
	
	DFREF CurrDF = getdataFolderDFR()
//	if(datafolderexists("Day_Density")==0)	//If it does not exist
//		newdatafolder/S Day_Density
//		DFREF DD_DF = getdatafolderDFR()
//	elseif(datafolderexists("Day_Density")==1)	//If it does exist
//		setdatafolder :Day_Density
//		DD_DF = GetdatafolderDFR()
//	endif
	
	setdatafolder CurrDF
	
	//Create a new wave that holds all of the effective density calculations performed from the inputted waves
	make/o/d/n=(npnts) ACSM_Effective_Density_plusrBC
	make/o/d/n=(6) Tempwave	//Temporary wave that will allow summing
	
	variable Numerator, Denominator, Inorg, cl, org, rBC_var, Rho_m
	
	for(i=0;i<npnts;i++)
		if(numtype(pOrg[i])==0)
			Tempwave[0] = pOrg[i]
		endif
		if(numtype(pNO3[i])==0)
			Tempwave[1] = pNO3[i]
		endif
		if(numtype(pSO4[i])==0)
			Tempwave[2] = pSO4[i]
		endif
		if(numtype(pNH4[i])==0)
			Tempwave[3] = pNH4[i]
		endif
		if(numtype(pChl[i])==0)
			Tempwave[4] = pChl[i]
		endif
		if(numtype(rBC[i])==0)
			Tempwave[5] = rBC[i]
		endif
		
		//check to make sure we have all of the data in all of the waves
		if(numtype(tempwave[0])==2) //If containing a NaN
			tempwave = NaN //set entire wave 2 NaN
		endif
		if(numtype(tempwave[1])==2) //If containing a NaN
			tempwave = NaN //set entire wave 2 NaN
		endif
		if(numtype(tempwave[2])==2) //If containing a NaN
			tempwave = NaN //set entire wave 2 NaN
		endif
		if(numtype(tempwave[3])==2) //If containing a NaN
			tempwave = NaN //set entire wave 2 NaN
		endif
		if(numtype(tempwave[4])==2) //If containing a NaN
			tempwave = NaN //set entire wave 2 NaN
		endif
		//rBC doesn't effect density a whole lot so if we go without it its not that big of a deal, we will still probably get to a decent point
//		if(numtype(tempwave[5])==2) //If containing a NaN
//			tempwave = NaN //set entire wave 2 NaN
//		endif
//		
	//Now do the eff density calc according to:
	//	//Effective Density Calculation
//	//Calcualtion done according to Matson and Delphine Chapter of Handbook of Indoor Air Quality
//	
//	//Calc breakdown: in non-organic dominated environments (assume this for all ACSM data as we do not have C to H ratios for ACSM)
//	// particle material density (Rho,m) = [No3-] + [So4-2] + [NH4+] + [Cl-] + [Org] + [rBC]
//	//													----------------------------------------
//	//													[No3-] + [So4-2] + [NH4+] + [Cl-] + [Org]		  [rBC]
//	//													------------------------		-----   ------ + --------
//	//																1.75					1.52		1.2			1.8
//	 
	
//	Numerator = Sum(Tempwave,0,5)
	Numerator = SumNaNs(TempWave)
	Inorg = (Tempwave[1]+Tempwave[2]+Tempwave[3])/1.75
	Cl = (Tempwave[4])/1.52
	org = (Tempwave[0])/1.2
	rBC_var =   (Tempwave[5])/1.8
	if(numtype(rBC_var)==2) //if rBC_var is a NaN
		Denominator = Inorg+Cl+org
	elseif(numtype(rBC_var)==0) //if rBC is a number
		Denominator = Inorg+Cl+org+rBC_var
	endif
	
	Rho_m = Numerator/Denominator
	
	ACSM_Effective_Density_plusrBC[i] = Rho_m
	
	//reset to not propogate areas where no ACSM/SP2 Data is avalible 
	Numerator = nan
	Inorg = nan
	Cl = nan
	org = nan
	rBC_var =   nan
	Denominator = nan
	
	Rho_m = nan
	
	tempwave = NaN
	
	
	
	Endfor
	
	Killwaves/Z Tempwave
	
End 

/////////////////////////////////////////////////////////////////////
/////////////////////Average Interp Function/////////////////////////
/////////////////////////////////////////////////////////////////////

//Button that runs the average interpolation code
Function Avg_InterpButt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			//Inital Check: Is the user in a good Data Folder?
			doalert/T="Initial Check" 2, "Are you in the Data folder that holds the waves to be used?"
			if(V_Flag ==1)
			elseif(V_Flag==2)
				abort "User is not in a good Data Folder to run the code. Aborting."
			elseif(V_Flag==3)
				abort "User is not in a good Data Folder to run the code. Aborting."
			else
				abort "Unknown Input. Aborting."
			endif
		
			
			string x1_str = ""
			string x2_str = ""
			string y1_str = ""
		
			prompt x1_str, "Please enter the faster/more frequent time wave to be used."
			prompt x2_str, "Please enter the slower/less frequent time wave to be used."
			prompt y1_str, "Please enter the faster/more frequent signal wave to be used."
			doprompt "Please Enter the following infomation. A new wave will be created for the interpolated slower signal data.", x1_str, x2_str, y1_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave x1 = $x1_str
			wave x2 = $x2_str
			wave y1 = $y1_str
			Avg_Interp(x1,y1,x2)
			
		case 2:
			break
		endswitch
end





//Interpolate faster data set to slower data set using the average 
//Code thought process: 
//Given 1st set of waves (fast data x and y values) and 2nd set of waves (slow data x and new data wave y)
//Find start time of x2 and x1 and the next x point (x time) of the slow data set
//Find all of the points of the fast data set (y1) within the timestep from x2[p] and x2[p+1] and average them
//Append this averaged wave to y2
//Repeat this
//Result is a averaged, interpolated y2 wave of y1,x1 data that can be put in time series to x2
Function Avg_Interp(x1,y1,x2)
	wave x1,y1	//Fast data x (time) and y (signal)
	wave x2	//Slow data x (time) and y (new interpolated y1 values)
//	
//	variable Timer
//	
//	variable timeindex 
//	for(timeindex=0;timeindex<9;timeindex++)
//		Timer = stopMSTimer(timeindex)
//	endfor
//	
//	Timer = startMSTimer
	
	//Get dimension of inputed waves
	Variable nrows_slowdata = dimsize(x2,0)
	variable nrows_fastdata = dimsize(x1,0)
	
	//Make midpoint wave to better hold data
	duplicate/O x2, $nameofwave(x2)+"_Midpnt"
	duplicate/O x2, tempx2
	wave x2midpnt = $nameofwave(x2)+"_Midpnt"
	variable dX = x2midpnt[1]-x2midpnt[0]	//for offseting midpnt wave
	tempx2-=dX
	MakeMidpointWave(tempx2,x2midpnt)
	killwaves/Z tempx2
	
	string y2name = nameofwave(y1) + "_AvgInterp"
	string y2name_stdDev = Y2name + "_StdDev"
	string y2name_median = Y2name + "_median"
	string y2name_UIQR = Y2name + "_UpperIQR"
	string y2name_LIQR = Y2name + "_LowerIQR"
	//Create and redimension waves
	make/Free/O/D/n=(1E6) Average_Holding = NaN //Wave to hold x1 values for averaging. Make NaN for avg calculations later; AJD 2/4/25 adjusted to 1E6 pnts for large 'fast' waves
	Make/O/N=(nrows_slowdata) $Y2name //Redimension Y2 in case the user does not provide a wave with the same rows as x2 and get rid of any values it comes in with
	make/O/N=(nrows_slowdata) $y2name_stdDev
	make/O/N=(nrows_slowdata) $y2name_median
	make/O/N=(nrows_slowdata) $y2name_UIQR
	make/O/N=(nrows_slowdata) $y2name_LIQR
	
	wave statswave = $y2name_stdDev
	wave medianwave = $y2name_median
	wave UIQRWave = $y2name_UIQR
	wave LIQRWave = $y2name_LIQR
	wave y2 = $y2name
	Y2 = NaN
	

	
	
	//Find the beginning times of the x1 and x2 waves
	variable slowdata_time_first, slowdata_time_next	//first means the first point of the time, and will always represent the time that takes place before the 'next' time 
				//It is important to note that while these are described for the slow data, they will help inform our fast data start and stop points
	
	//Establish variables to use in loop(s)
	variable i, j, k,z, Curr_Avg
	j = 0
	k = 0
	
	//Set up loop
	for(i=0;i<(nrows_slowdata);i++)	//This first loop allows the tracking of p and p+1 time points in the slow data
//		slowdata_time_first = x2midpnt[i] //Find the value of the time at x2 data (slow data) at index i
//		slowdata_time_next = x2midpnt[i+1] //Find the value of the time at x2 data (slow data) at the index past i (i+1)
		variable pStart = binarysearch(x2, x2[i])	//point value at time i
		//If we hit the end of the wave
		if(i==nrows_slowdata-1)
			variable pUpperRange = binarysearch(x1,x1[inf])	
		else
		variable pEnd = binarysearch(x2, x2[i+1])	//point value at time i+1
		Variable PStart_tVal = x2[pStart]
		variable pEnd_tVal = x2[pEnd]
		variable pLowerRange = binarysearch(x1,pStart_tVal)
		pUpperRange = binarysearch(x1,pEnd_tVal)
		endif
		
		if(pLowerRange==-1) //Value is before first point in wave
			pLowerRange=0
		endif
		
		if(pUpperRange==-2)//Value is after last point in wave
			pUpperRange=x1[inf]
		endif
		
		//Calc stats based on ranges ::: Large SDev; Dive into this after. 
		WaveStats/Q/R=[pLowerRange,pUpperRange] Y1
		Y2[i] = V_Avg
		Statswave[i] = V_SDev
		Duplicate/Free/R=[pLowerRange,pUpperRange] Y1, TempY1
		Wavetransform zapNaNs TempY1
		statsquantiles/Z/Q TempY1
		medianwave[i] = V_Median 
		UIQRWave[i] = V_Q75
		LIQRWave[i] = V_Q25
	Endfor
		
//		
//		for(j=k;j<nrows_fastdata;j++) //This second loop allows the tracking of the values of the fast data between i and i+1 (slowdata_time_first and slowdata_time_next)
//			if(x1[j] >= slowdata_time_first && x1[j] <= slowdata_time_next) //CONDITION 1: If our current fast data value at index j is between our slow data timestep
//				//check to see if j = 1E6
//				if(z==999999)
//					redimension/n=(nrows_fastdata) Average_Holding	//if z == 999999 (one less than 1E6) then redimension the wave
//					Average_Holding[999999,nrows_fastdata-1] = NaN
//				endif
//				Average_Holding[z] = y1[j] //Take the signal (y1) value found at x1[j] and append it to our average holding wave, then move on in the loop
//				z++
//			elseif(x1[j] > slowdata_time_next)	// CONDITION 2: If we are past our slow data time interval; then stop and calculate the average
//				//Get rid of the NaN values in our average holding wave, find the average, and put that average in our new y2 interpolated wave
//				Wavetransform zapNaNs Average_Holding 
//				Curr_Avg = Mean(Average_Holding)
//				statswave[i] = sqrt(variance(Average_Holding))
//				Y2[i] = Curr_Avg
//				statsquantiles/Z/Q Average_Holding
//				medianwave[i] = V_Median 
//				UIQRWave[i] = V_Q75
//				LIQRWave[i] = V_Q25
//				//Set the Average_Holding back to normal, clear out the Curr_Avg value
//				Redimension/n=(1E6) Average_Holding	//2/4/2025 AJD change to minimize runtime 
//				Average_Holding = NaN
//				Curr_Avg = NaN
//				//Ensure that j will not reset to zero when we pass through the loop again during the next timeframe
//				j = k  
//				//set z to zero
//				z = 0
//				//Break out of this loop
//				Break		
//			
//			Endif
//		Endfor	
//	
//	Endfor
	
//	//Final Cleanups of the y2 data depending on time stops
//	
//	//If fast data goes longer than slow data
//	if(wavemax(x1)>wavemax(x2))
//		Wavetransform zapNaNs Average_Holding 
//		Curr_Avg = Mean(Average_Holding)
//		Y2[i] = Curr_Avg
//		statswave[i] = sqrt(variance(Average_Holding))
//		statsquantiles/Z/Q Average_Holding
//		medianwave[i] = V_Median 
//		UIQRWave[i] = V_Q75
//		LIQRWave[i] = V_Q25
//	//If fast data goes shorter than slow data
//	elseif(wavemax(x1)<wavemax(x2))
//		Wavetransform zapNaNs Average_Holding 
//		Curr_Avg = Mean(Average_Holding)
//		Y2[i] = Curr_Avg
//		statswave[i-1] = sqrt(variance(Average_Holding))
//		statsquantiles/Z/Q Average_Holding
//		medianwave[i] = V_Median 
//		UIQRWave[i] = V_Q75
//		LIQRWave[i] = V_Q25
//	elseif(wavemax(x1) == wavemax(x2))
//		Wavetransform zapNaNs Average_Holding 
//		Curr_Avg = Mean(Average_Holding)
//		Y2[i] = Curr_Avg
//		statswave[i] = sqrt(variance(Average_Holding))
//		statsquantiles/Z/Q Average_Holding
//		medianwave[i] = V_Median 
//		UIQRWave[i] = V_Q75
//		LIQRWave[i] = V_Q25
//	Endif
	
	//Clean up waves
	medianwave = medianwave[p] == 0 ? NaN : medianwave[p]
	UIQRWave = UIQRWave[p] == 0 ? NaN : UIQRWave[p]
	LIQRWave = LIQRWave[p] == 0 ? NaN : LIQRWave[p]
	
	Killwaves/Z 
	
	Redimension/N=(nrows_slowdata-1) Y2
	Redimension/N=(nrows_slowdata-1) Statswave
	Redimension/N=(nrows_slowdata-1) medianwave 
	Redimension/N=(nrows_slowdata-1) UIQRWave
	Redimension/N=(nrows_slowdata-1) LIQRWave
	
	
//	variable finalpnts = dimsize(y2,0)
//	duplicate/O Y2, $nameofwave(y2)+"_Midpnt"
//	wave midpntsig = $nameofwave(y2)+"_Midpnt"
//	redimension/N=(finalpnts-1) midpntsig
	
	
	//Simple Graphing setup
//
//	string GraphName = "AJD_Interp_Graph"
//	Display/N=$GraphName
//	appendtograph $nameofwave(y1) vs $nameofwave(X1)
//	appendtograph y2 vs x2
//	Modifygraph rgb($nameofwave(y1))=(0,0,0)
//	Legend
////	wave tempwave = $nameofwave(y1)
////	string temp = traceNameList("", ";",4)
////	ReorderTraces/W=AJD_Interp_Graph $nameofwave(Y2), {tempwave}
//
//	Timer = StopMSTimer(0)
//	variable ElapsedTime = Timer/1E6/60
//	doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."

	killwaves/Z W_StatsQuantiles
	killwaves/Z Midpntsig
	killwaves/Z x2midpnt

End



//Button that runs the average interpolation code
Function Avg_Interp2DButt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			//Inital Check: Is the user in a good Data Folder?
			doalert/T="Initial Check" 2, "Are you in the Data folder that holds the waves to be used?"
			if(V_Flag ==1)
			elseif(V_Flag==2)
				abort "User is not in a good Data Folder to run the code. Aborting."
			elseif(V_Flag==3)
				abort "User is not in a good Data Folder to run the code. Aborting."
			else
				abort "Unknown Input. Aborting."
			endif
		
			
			string x1_str = ""
			string x2_str = ""
			string y1_str = ""
		
			prompt x1_str, "Please enter the faster/more frequent time wave to be used."
			prompt x2_str, "Please enter the slower/less frequent time wave to be used."
			prompt y1_str, "Please enter the faster/more frequent signal wave to be used."
			doprompt "Please Enter the following infomation. A new wave will be created for the interpolated slower signal data.", x1_str, x2_str, y1_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave x1 = $x1_str
			wave x2 = $x2_str
			wave y1 = $y1_str
			Avg_Interp2D(x1,y1,x2)
			
		case 2:
			break
		endswitch
end

//Interpolate faster data set to slower data set using the average 
//Code thought process: 
//Given 1st set of waves (fast data x and y values) and 2nd set of waves (slow data x and new data wave y)
//Find start time of x2 and x1 and the next x point (x time) of the slow data set
//Find all of the points of the fast data set (y1) within the timestep from x2[p] and x2[p+1] and average them
//Append this averaged wave to y2
//Repeat this
//Result is a averaged, interpolated y2 wave of y1,x1 data that can be put in time series to x2
Function Avg_Interp2D(x1,y1,x2)
	wave x1,y1	//Fast data x (time) and y (signal)
	wave x2	//Slow data x (time) and y (new interpolated y1 values)
	
	variable Timer
	
	variable timeindex 
	for(timeindex=0;timeindex<9;timeindex++)
		Timer = stopMSTimer(timeindex)
	endfor
	
	Timer = startMSTimer
	
	//Get dimension of inputed waves
	Variable nrows_slowdata = dimsize(x2,0)
	variable nrows_fastdata = dimsize(x1,0)
	variable nrows_slowsignal = dimsize(y1,0)
	variable ncolumns_slowsignal = dimsize(y1,1)
	
	string y2name = nameofwave(y1) + "_AvgInterp"
	string y2name_stdDev = Y2name + "_StdDev"
	string y2name_median = Y2name + "_median"
	string y2name_UIQR = Y2name + "_UpperIQR"
	string y2name_LIQR = Y2name + "_LowerIQR"
	
	//Create and redimension waves (ensure they are 2D waves)
	make/Free/O/D/n=(1E6, ncolumns_slowsignal) Average_Holding = NaN //Wave to hold y1 values for averaging. Make NaN for avg calculations later; AJD 2/4/25 Adjusted to 1E6 instead of nrows_fastdata
	Make/O/N=(nrows_slowdata, ncolumns_slowsignal) $Y2name //Redimension Y2 in case the user does not provide a wave with the same rows as x2 and get rid of any values it comes in with
	make/O/N=(nrows_slowdata, ncolumns_slowsignal) $y2name_stdDev
	make/O/N=(nrows_slowdata, ncolumns_slowsignal) $y2name_median
	make/O/N=(nrows_slowdata, ncolumns_slowsignal) $y2name_UIQR
	make/O/N=(nrows_slowdata, ncolumns_slowsignal) $y2name_LIQR
	
	wave statswave = $y2name_stdDev
	wave medianwave = $y2name_median
	wave UIQRWave = $y2name_UIQR
	wave LIQRWave = $y2name_LIQR
	wave y2 = $y2name
	wave W_StatsQuantiles
	Y2 = NaN
	

	
	
	//Find the beginning times of the x1 and x2 waves
	variable slowdata_time_first, slowdata_time_next	//first means the first point of the time, and will always represent the time that takes place before the 'next' time 
				//It is important to note that while these are described for the slow data, they will help inform our fast data start and stop points
	
	//Establish variables to use in loop(s)
	variable i, j, k,z, Curr_Avg
	variable Hold_Start = -9999
	j = 0
	k = 0
	
	//Set up loop
	for(i=0;i<(nrows_slowdata-1);i++)	//This first loop allows the tracking of p and p+1 time points in the slow data
		slowdata_time_first = x2[i] //Find the value of the time at x2 data (slow data) at index i
		slowdata_time_next = x2[i+1] //Find the value of the time at x2 data (slow data) at the index past i (i+1)
		for(j=k;j<nrows_fastdata;j++) //This second loop allows the tracking of the values of the fast data between i and i+1 (slowdata_time_first and slowdata_time_next)
			if(x1[j] >= slowdata_time_first && x1[j] <= slowdata_time_next) //CONDITION 1: If our current fast data value at index j is between our slow data timestep
				if(Hold_Start == -9999)
					Hold_Start = j
				endif
				for(z=0;z<ncolumns_slowsignal;z++)
					Average_Holding[j][z] = y1[j][z] //Take the signal (y1) value found at x1[j] and append it to our average holding wave, then move on in the loop
				endfor
			elseif(x1[j] > slowdata_time_next)	// CONDITION 2: If we are past our slow data time interval; then stop and calculate the average
				//Get rid of the NaN values in our average holding wave, find the average, and put that average in our new y2 interpolated wave
				//Changed this to account for 2D waves
				Duplicate/O/R=[Hold_Start,j-1][] Average_Holding, Isolated_Holding
				WaveStats/Q/PCST Isolated_Holding
				wave M_WaveStats
				wave Temp_StatsQuantilesWave = buildQuantiles(Isolated_Holding)	//Generates Temp_StatsQuantilesWave
				for(z=0;z<ncolumns_slowsignal;z++)
					statswave[i][z] = M_WaveStats[4][z]
					Y2[i][z] = M_WaveStats[3][z]
					medianwave[i][z] = Temp_StatsQuantilesWave[2][z]
					UIQRWave[i][z] = Temp_StatsQuantilesWave[3][z]
					LIQRWave[i][z] = Temp_StatsQuantilesWave[4][z]
				endfor
				KillWaves M_WaveStats
				KillWaves W_StatsQuantiles
				KillWaves Temp_StatsQuantilesWave
					//Set the Average_Holding back to normal, clear out the Curr_Avg value
					Redimension/n=(1E6,ncolumns_slowsignal) Average_Holding		//2/4/2025 AJD change to minimize runtime
					Average_Holding = NaN
				//Ensure that j will not reset to zero when we pass through the loop again during the next timeframe
				j = k  
				//Reset Hold Start
				Hold_Start = -9999
				//Break out of this loop
				Break		
			Endif
		Endfor	
	
	Endfor
	
	//Final Cleanups of the y2 data depending on time stops
	
	//If fast data goes longer than slow data
	if(wavemax(x1)>wavemax(x2))
		//Changed this to account for 2D waves
		Duplicate/O/R=[Hold_Start,j-1][] Average_Holding, Isolated_Holding
		WaveStats/Q/PCST Isolated_Holding
		wave M_WaveStats
		wave Temp_StatsQuantilesWave = buildQuantiles(Isolated_Holding)	//Generates Temp_StatsQuantilesWave
		for(z=0;z<ncolumns_slowsignal;z++)
			statswave[i][z] = M_WaveStats[4][z]
			Y2[i][z] = M_WaveStats[3][z]
			medianwave[i][z] = Temp_StatsQuantilesWave[2][z]
			UIQRWave[i][z] = Temp_StatsQuantilesWave[3][z]
			LIQRWave[i][z] = Temp_StatsQuantilesWave[4][z]
		endfor
		KillWaves M_WaveStats
		KillWaves W_StatsQuantiles
		KillWaves Temp_StatsQuantilesWave
		KillWaves Temp_StatsQuantilesWave
	//If fast data goes shorter than slow data
	elseif(wavemax(x1)<wavemax(x2))
		//Changed this to account for 2D waves
		Duplicate/O/R=[Hold_Start,j-1][] Average_Holding, Isolated_Holding
		WaveStats/Q/PCST Isolated_Holding
		wave M_WaveStats
		wave Temp_StatsQuantilesWave = buildQuantiles(Isolated_Holding)	//Generates Temp_StatsQuantilesWave
		for(z=0;z<ncolumns_slowsignal;z++)
			statswave[i][z] = M_WaveStats[4][z]
			Y2[i][z] = M_WaveStats[3][z]
			medianwave[i][z] = Temp_StatsQuantilesWave[2][z]
			UIQRWave[i][z] = Temp_StatsQuantilesWave[3][z]
			LIQRWave[i][z] = Temp_StatsQuantilesWave[4][z]
		endfor
		KillWaves M_WaveStats
		KillWaves W_StatsQuantiles
		KillWaves Temp_StatsQuantilesWave
	elseif(wavemax(x1) == wavemax(x2))
		//Changed this to account for 2D waves
		Duplicate/O/R=[Hold_Start,j-1][] Average_Holding, Isolated_Holding
		WaveStats/Q/PCST Isolated_Holding
		wave M_WaveStats
		wave Temp_StatsQuantilesWave = buildQuantiles(Isolated_Holding)	//Generates Temp_StatsQuantilesWave
		for(z=0;z<ncolumns_slowsignal;z++)
			statswave[i][z] = M_WaveStats[4][z]
			Y2[i][z] = M_WaveStats[3][z]
			medianwave[i][z] = Temp_StatsQuantilesWave[2][z]
			UIQRWave[i][z] = Temp_StatsQuantilesWave[3][z]
			LIQRWave[i][z] = Temp_StatsQuantilesWave[4][z]
		endfor
		KillWaves M_WaveStats
		KillWaves W_StatsQuantiles
		KillWaves Temp_StatsQuantilesWave
	Endif
	
	//Clean up waves
	medianwave = medianwave[p][q] == 0 ? NaN : medianwave[p][q]
	UIQRWave = UIQRWave[p][q] == 0 ? NaN : UIQRWave[p][q]
	LIQRWave = LIQRWave[p][q] == 0 ? NaN : LIQRWave[p][q]
	
	
//	
//	//Simple Graphing setup
//
//	string GraphName = "AJD_Interp_Graph"
//	Display/N=$GraphName
//	appendtograph $nameofwave(y1) vs $nameofwave(X1)
//	appendtograph y2 vs X2
//	Modifygraph rgb($nameofwave(y1))=(0,0,0)
//	Legend
////	wave tempwave = $nameofwave(y1)
////	string temp = traceNameList("", ";",4)
////	ReorderTraces/W=AJD_Interp_Graph $nameofwave(Y2), {tempwave}

	Timer = StopMSTimer(0)
	variable ElapsedTime = Timer/1E6/60
	doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
	
	killwaves/Z Isolated_Holding
	Killwaves/Z W_StatsQuantiles
//	Killwaves/Z 
	
End

Function/Wave buildQuantiles(inputwave)
    Wave inputwave
    Wave W_StatsQuantiles
    Variable numofRows, numofColumns//, numofLayers
    numofRows = dimSize(inputwave,0)
    numofColumns = dimSize(inputwave,1)
    
    //Failsafe if number of rows is 2 or less
    if(numofRows<=2)
    	Make/O/N=(10,numofColumns) Temp_StatsQuantilesWave = -9999
    	
    	return Temp_StatsQuantilesWave
    endif
//    numofLayers = dimSize(inputwave,2)
    Variable i, j
    Make/O/N=(10,numofColumns) Temp_StatsQuantilesWave
   
//    for(j=0; j<=numofLayers; j+=1)
        for(i=0; i<=numofColumns-1; i +=1)
            String w_name = "temp_" + num2str(i)
            MAKE/D/N=(numofRows) $(w_name)/Wave=w
//           w = inputwave[p][i][j]
				w = inputwave[p][i]
                if(dimSize(w,0) ==0)
                    break
                endif
            StatsQuantiles/Q/BOX/QW w
            wave W_StatsQuantiles
//           Make/O/N=(10,numofColumns,numofLayers) perctWave
//				Make/O/N=(10,numofColumns) perctWave
//           perctWave[][i][j] = W_StatsQuantiles[p]
           	Temp_StatsQuantilesWave[][i] = W_StatsQuantiles[p]
            // Kill temporary waves so we can use them again
            KillWaves w
        endfor
//    endfor
	return Temp_StatsQuantilesWave
End




//Button that runs the average interpolation code
Function Avg_InterpListButt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			//Inital Check: Is the user in a good Data Folder?
			doalert/T="Initial Check" 2, "Are you in the Data folder that holds the waves to be used?"
			if(V_Flag ==1)
			elseif(V_Flag==2)
				abort "User is not in a good Data Folder to run the code. Aborting."
			elseif(V_Flag==3)
				abort "User is not in a good Data Folder to run the code. Aborting."
			else
				abort "Unknown Input. Aborting."
			endif
		
			
			string x1_str = ""
			string x2_str = ""
			string ListStr = ""
			Variable WaveD 
		
			prompt x1_str, "Please enter the faster/more frequent time wave to be used."
			prompt x2_str, "Please enter the slower/less frequent time wave to be used."
			prompt ListStr, "Please enter the identification that all diesired waves share (i.e. AJD or Distr)."
			prompt WaveD, "Enter 1 for 1D waves and 2 for 2D Waves."
			doprompt "Please Enter the following infomation. A new wave will be created for the interpolated slower signal data.", x1_str, x2_str, ListStr, WaveD
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave tfast = $x1_str
			wave tslow = $x2_str
			Avg_InterpList(ListStr,tslow,tfast, WaveD)
			
		case 2:
			break
		endswitch
end


Function Avg_InterpList(ListStr,tslow,tfast, WaveD)

	//Establish Function Parameters
	String ListStr
	wave tslow, tfast
	Variable WaveD
	
	//Establish Failsafes
	if(WaveD ==1)
		//We are good
	elseif(WaveD ==2)
		//We are good
	else
		abort "Inputted Wave Dimension not Valid. Aborting."
	endif
	
	//Do some datafolder stuff	
	DFREF StartDF = getdatafolderDFR()
	
	NewDatafolder/O/S Avg_Interp_Waves
	DFREF InterpDF = getdatafolderDFR()
	setdataFolder StartDF
	NewDataFolder/O/S Avg_Interp_Waves_Stats
	DFREF StatsDF = getdatafolderDFR()
	setdatafolder StartDF
	
	//Establish Function Variables
	string ListStr_Help = "*"+ListStr+"*"
	string InterpWaveList = wavelist(ListStr_Help,";","TEXT:0")
	Variable nwaves = itemsinlist(InterpWaveList, ";")
	Variable i, j
	
	//Communicate the length of this code
	DoAlert/T="Attention!" 0, "This code will run after the user hits the 'OK' button. The code will take a while (substantially longer for 2D waves). Ensure you are prepared for a ~20 min wait for 1D waves and a ~12 hr wait for 2D waves (assuming ~20 waves are to be interpolated)."
	variable Timer
	
	variable timeindex 
	for(timeindex=0;timeindex<9;timeindex++)
		Timer = stopMSTimer(timeindex)
	endfor
	
	Timer = startMSTimer
	
	//Establish Loops (1D and 2D)
	if(WaveD == 1)
		for(i=0;i<nwaves;i++)
			wave TempWave = $Stringfromlist(i,InterpWaveList,";")
			Avg_Interp(tfast,TempWave,tslow)		
		endfor
	elseif(WaveD == 2)
		for(i=0;i<nwaves;i++)
			wave TempWave = $Stringfromlist(i,InterpWaveList,";")
			Avg_Interp2D(tfast,TempWave,tslow)
		endfor	
	endif
	
	//Now that the loop is completed do some organization
	string avgList = WaveList("*AvgInterp",";","TEXT:0")
	string stdList = WaveList("*StdDev*",";","TEXT:0")
	string medianList = WaveList("*AvgInterp_Median*",";","TEXT:0")
	string LQList = WaveList("*LowerIQR*",";","TEXT:0")
	string UQList = WaveList("*UpperIQR*",";","TEXT:0")
//	string ProductList = "avgList;stdList;medianList;LQList;UQList;"
//	variable nstrings = itemsinlist(ProductList,";")
	
	for(i=0;i<5;i++)
		variable nwaves_avg = itemsInList(avgList,";")
		variable nwaves_std = itemsInList(stdList,";")
		variable nwaves_median = itemsInList(medianList,";")
		variable nwaves_LQList = itemsInList(LQList,";")
		variable nwaves_UQList = itemsInList(UQList,";")
		for(j=0;j<nwaves_avg-1;j++)
			wave TempWave0 = $stringfromlist(j,avgList,";")
			wave Tempwave1 = $stringfromlist(j,stdList,";")
			wave TempWave2 = $stringfromlist(j,medianList,";")
			wave Tempwave3 = $stringfromlist(j,LQList,";")
			wave TempWave4 = $stringfromlist(j,UQList,";")			
			string TempWaveName0 = nameofwave(TempWave0)
			string TempWaveName1 = nameofwave(TempWave1)
			string TempWaveName2 = nameofwave(TempWave2)
			string TempWaveName3 = nameofwave(TempWave3)
			string TempWaveName4 = nameofwave(TempWave4)
			MoveWave TempWave0, InterpDF:$TempWaveName0
			MoveWave TempWave1, StatsDF:$TempWaveName1
			MoveWave TempWave2, StatsDF:$TempWaveName2
			MoveWave TempWave3, StatsDF:$TempWaveName3
			MoveWave TempWave4, StatsDF:$TempWaveName4
		endfor
	endfor
	
	Timer = StopMSTimer(0)
	variable ElapsedTime = Timer/1E6/60
	doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
	setdatafolder StartDF
	
end


/////////////////////////////////////////////////////////////////////
//////////////////////Quick Stats Function///////////////////////////
/////////////////////////////////////////////////////////////////////

//Button that runs the quick stats command
Function Quick_Stats_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			//Inital Check: Is the user in a good Data Folder?
			doalert/T="Initial Check" 2, "Are you in the Data folder that holds the waves to be used?"
			if(V_Flag ==1)
			elseif(V_Flag==2)
				abort "User is not in a good Data Folder to run the code. Aborting."
			elseif(V_Flag==3)
				abort "User is not in a good Data Folder to run the code. Aborting."
			else
				abort "Unknown Input. Aborting."
			endif
		
			string sigwave_str = ""
			variable p1
			variable p2
		
			prompt sigwave_str, "Please enter name of the signal wave to be used."
			prompt p1, "Please enter the starting point of the wave to be used."
			prompt p2, "Please enter the ending point of the wave to be used."
			doprompt "Please Enter the following infomation.", sigwave_str, p1, p2
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave sigwave = $sigwave_str
			Quick_Stats(sigwave,p1,p2)
			
		case 2:
			break
		endswitch
end

//This function will run some quick statisitcs on wave between points inputted by the user.
//The stats determined are Average, Standard Deviation, Median and both upper and lower Quartiles.
//These Stats printed out in the command line as well as being stored in the waves M_WaveStats and W_StatsQuantiles
Function Quick_Stats(sigwave,p1,p2)

	wave sigwave
	variable p1, p2
	
	wavestats/W/Q/R=[P1,P2] sigwave
	duplicate/FREE/R=[P1,P2] sigwave, tempwave
	Statsquantiles/iNaN/Q sigwave
	
	print "Average:" , V_avg , " and Standard Deviation:" , V_sdev
	print "Median:", V_Median, " Lower Quartile:", V_Q25, " and Upper Quartile:", V_Q75



End


/////////////////////////////////////////////////////////////////////
//////////////////////Vconc 2 Mconc with ACSM Density////////////////
/////////////////////////////////////////////////////////////////////

Function SMPS_VConc2MConc_ACSMDensity_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string VConc_Distr = ""
			string Density_Wave = ""
		
			prompt Density_Wave, "Please enter the density wave to be used."
			prompt VConc_Distr, "Please enter the SMPS VConc signal wave to be used."
			doprompt "Please Enter the following infomation.", VConc_Distr, Density_Wave
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave VCD = $VConc_Distr
			wave DWave = $Density_Wave
			SMPS_VConc2MConc(VCD,DWave)
		case 2:
			break
		endswitch
end

Function SMPS_VConc2MConc(VCD,DWave)
	//Establish Parameters
	wave VCD, DWave
	variable i, num_rows, Numerator, Denominator, Inorg, cl, org, Rho_m
	num_rows = dimsize(VCD,0)
	String MConc_Str = "MConc_density_from_"+nameofwave(DWave)
	duplicate/O VCD, $MConc_str
	wave tempwave = $MConc_Str
	note tempwave, "SMPS Mass Concentration (µg/m3). Calculated from non-refractory components determined by the ACSM and refractory components from SP2."
	
	do
		tempwave[i][]*=Dwave[i]
		i++
	while (i<num_rows)

End



Function SMPS_VConcDistr2MConcDistr_Density_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string pOrg_str = ""
			string pNO3_str = ""
			string pSO4_str = ""
			string pNH4_str = ""
			string pChl_str = ""
			string SMPS_VConc_Str = ""
			
			prompt pOrg_str, "Please enter the organic signal wave to be used."
			prompt pNO3_str, "Please enter the nitrate signal wave to be used."
			prompt pSO4_str, "Please enter the sulfate signal wave to be used."
			prompt pNH4_str, "Please enter the ammonium signal wave to be used."
			prompt pChl_str, "Please enter the chloride signal wave to be used."
			prompt SMPS_VConc_Str, "Please enter the SMPS VConc signal wave to be used."
			doprompt "Please Enter the following infomation.", pOrg_str, pNO3_str, pSO4_str, pNH4_str, pChl_str, SMPS_VConc_Str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave pOrg = $pOrg_str
			wave pNo3 = $pNO3_str
			wave PSO4 = $pSO4_str
			wave PNH4 = $pNH4_str
			wave pChl = $pChl_str
			wave SMPS_VConc = $SMPS_VConc_Str
			SMPS_VConcDistr2MConcDistr_Density(pOrg,pNo3,pSo4,pNh4,pChl, SMPS_VConc)
			
		case 2:
			break
		endswitch
end

Function SMPS_VConcDistr2MConcDistr_Density(pOrg,pNo3,pSo4,pNh4,pChl, SMPS_VConc)
	//Establish Parameters
	wave pOrg,pNo3,pSo4,pNh4,pChl, SMPS_VConc
	variable i, num_rows, Numerator, Denominator, Inorg, cl, org, Rho_m
	num_rows = dimsize(SMPS_VConc,0)
	duplicate SMPS_VConc, SMPS_MConc
	note SMPS_MConc, "SMPS Mass Concentration (µg/m3). Calculated from non-refractory components determined by the ACSM."
	make/FREE/d/o/n=(num_rows) Density_Calc_p2p
	
	do
		Numerator = porg[i] + pno3[i] + pso4[i] + pnh4[i] + pchl[i]
		Inorg = ((pno3[i] + pso4[i] + pnh4[i])/1.75)
		cl = (pchl[i]/1.52)
		Org = porg[i]/1.2
		Denominator = Inorg + Org + cl
		
		Rho_m = Numerator/Denominator
		
		Density_Calc_p2p[i] = Rho_m
		
		SMPS_MConc[i] = SMPS_VConc[i]*rho_m
		
		
		
		i++
	while (i<num_rows)

End

//3/10/25 AJD Make Midpoint Wave
//Used to take a given boundry wave and create a midpoint diameter wave off of it
Function MakeMidpointWave_butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Doalert/T="Data Folder Check" 2, "Are you in the datafolder with the desired wave?"
			if(V_flag == 2 || V_Flag == 3) //If no or cancel clicked
				Abort "User Aborted."
			else
				//Do nothing
			endif
			V_Flag=0
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			string w_str
			prompt w_str, "What is the identifying string to find the bdr wave?"
			doprompt "Please enter the following.", w_str
			string w_help = "*"+w_str+"*"
			string w_list = wavelist(w_help,";", "TEXT:0")
			wave w = $stringfromlist(0,w_list,";")
			string dupname = nameofwave(w)+"_Midpnt"
			Duplicate/O $stringfromlist(0,w_list,";"), $dupname
			Wave Midpnt_Wave = $dupname
			MakeMidpointWave(w,Midpnt_Wave)
		case 2:
			break
		endswitch
end

Function MakeMidpointWave(edgesWave,centers)
	Wave centers // Output wave
	Wave edgesWave // Input wave
	
	Variable N=numpnts(edgesWave)-1
	
	Redimension/N=(N) centers
	centers[0]=edgesWave[0]+0.5*(edgesWave[1]-edgesWave[0])	//For the first point take the bdr wave at 0 and 1 and find the midpoint of it
	centers[1,N-1] = edgesWave[p]+0.5*(abs(EdgesWave[p+1]-edgesWave[p]))//Last and middle pnts

//	centers[1,N-1]=edgesWave[p]+0.5*(abs(edgesWave[N-2]-edgesWave[N-1]))	//Last and middle pnts; old
	
//	Redimension/N=(N+1) edgesWave
//	edgesWave[0]=centers[0]-0.5*(centers[1]-centers[0])
//	edgesWave[N]=centers[N-1]+0.5*(centers[N-1]-centers[N-2])
//	edgesWave[1,N-1]=centers[p]-0.5*(centers[p]-centers[p-1])

	
End



//12/15/24 AJD Make Bdr Wave
//Used to take a given wave and create a boundry diameter wave off of it
Function MakeBdrWave_butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Doalert/T="Data Folder Check" 2, "Are you in the datafolder with the desired wave?"
			if(V_flag == 2 || V_Flag == 3) //If no or cancel clicked
				Abort "User Aborted."
			else
				//Do nothing
			endif
			V_Flag=0
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			string w_str
			prompt w_str, "What is the identifying string to find the wave?"
			doprompt "Please enter the following.", w_str
			string w_help = "*"+w_str+"*"
			string w_list = wavelist(w_help,";", "TEXT:0")
			wave w = $stringfromlist(0,w_list,";")
			string dupname = nameofwave(w)+"_Bdr"
			Duplicate/O $stringfromlist(0,w_list,";"), $dupname
			Wave Bdr_Wave = $dupname
			MakeEdgesWave(w,Bdr_Wave)
		case 2:
			break
		endswitch
end


//1/8/25 AJD calculate total conc from SD
//Used to calculate the total concentration from a size distribution and bdr wave
Function CalcTCfromSD_butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Doalert/T="Data Folder Check" 2, "Are you in the datafolder with the desired waves?"
			if(V_flag == 2 || V_Flag == 3) //If no or cancel clicked
				Abort "User Aborted."
			else
				//Do nothing
			endif
			V_Flag=0
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			string SD_str, Bdr_str, Midpnt_Str
			prompt SD_Str, "What is the identifying string to find the SD wave?"
			Prompt Bdr_Str, "What is the identifying string to find the Bdr wave?"
//			Prompt Midpnt_Str, "What is the identifying string to find the Midpnt wave?"
			doprompt "Please enter the following.", SD_str, Bdr_str//, Midpnt_str
			if(V_Flag==1)
				Abort "User Aborted."
			endif
			
			string w_help_SD= "*"+SD_str+"*"
			string w_help_Bdr= "*"+Bdr_Str+"*"
//			string w_help_Midpnt = "*"+Midpnt_Str+"*"
			string w_list_SD = wavelist(w_help_SD,";", "TEXT:0")
			string w_list_Bdr = wavelist(w_help_bdr, ";", "TEXT:0")
//			string w_list_Midpnt = wavelist(w_help_Midpnt, ";", "TEXT:0")
			wave w = $stringfromlist(0,w_list_SD,";")
			Wave Bdr_Wave = $stringfromlist(0,w_list_Bdr,";")
			Wave SD_Wave = $stringfromlist(0,w_list_SD,";")
//			Wave Midpnt_Wave = $stringfromlist(0,w_list_Midpnt,";")
			TCfromSD(SD_Wave,Bdr_Wave)
		case 2:
			break
		endswitch
end

function TCfromSD(SD_Wave,Bdr_Wave)

	//Establish Function Parameters
	wave SD_Wave, Bdr_Wave
	
	//Establish Function Variables, strings, and waves
	variable i, k
	variable npnts_Bdr = Dimsize(Bdr_wave,0)
	variable nrows_SD = Dimsize(SD_Wave,0)
	variable ncolumns_SD = Dimsize(SD_wave,1)
	Make/O/D/N=(nrows_SD) $nameofwave(SD_Wave)+"_TotalConc"
	Wave TC = $nameofwave(SD_Wave)+"_TotalConc"
	Make/O/D/N=(ncolumns_SD)/Free HoldValues = NaN
	
	//Create the temporary dlogDp Wave
	Duplicate/Free/O Bdr_Wave, Bdr_dlogDp
	Redimension/N=(npnts_Bdr-1) Bdr_dlogDp
	Bdr_dlogDp = nan
	for(i=0;i<npnts_Bdr-1;i++)
		Bdr_dlogDp[i] = Log(bdr_wave[i+1])-Log(Bdr_Wave[i])
	endfor
	
	
	//Go through the SD with a for loop
	for(i=0;i<nrows_SD;i++) //for every single row of the inputted SD
		for(k=0;k<ncolumns_SD;k++)//go through every column of that row
			if(numtype(SD_Wave[i][k]) == 0)//If it is a normal number
				HoldValues[k]= SD_Wave[i][k]*Bdr_dlogDp[k]
			else
				HoldValues[k]= 0 //Have it be zero so we don't calculate out a NaN
			endif
		endfor
		//At the end of the column loop find out the total conc
		TC[i] = sum(HoldValues)
		HoldValues = NaN	
	endfor
	TC = TC == 0 ? NaN : TC
	

end

//AJD 5/1/25: Take Volumetric flow and convert to standard flow
Function VFlow2StdFlow_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Doalert/T="Data Folder Check" 2, "Are you in the datafolder with the desired wave?"
			if(V_flag == 2 || V_Flag == 3) //If no or cancel clicked
				Abort "User Aborted."
			else
				//Do nothing
			endif
			V_Flag=0
			if(V_Flag==0)
			elseif(V_flag==1||V_Flag==2)
				Abort "User Aborted."
			endif
			Variable FlowV, TemperatureC,PressuremBar
			prompt FlowV, "What is the volumetric flow? Can be in whatever units you want, the generated standard flow will be in the same units."
			prompt TemperatureC, "What is the temperature in C"
			prompt PressuremBar,"What is the pressure in mBar?" 
			doprompt "Please enter the following.", FlowV, TemperatureC,PressuremBar
			if(V_Flag==1)
				Abort "User Aborted."
			endif
			
			V2SFlow(FlowV, TemperatureC,PressuremBar)
		case 2:
			break
		endswitch
end

Function/D V2SFlow(FlowV, TemperatureC,PressuremBar)

	//Establish Function Parameters
	Variable FLowV, TemperatureC, PressuremBar
	
	//Establish Local Parameters
	Variable PressureStd_mBar = 1013.25, Temperature_StandardC=0
	Variable FlowS
	
	//Logic from TSI's Standard Flow Rate vs Volumetric Flow Rate:
	//Volumetric Flow = Standard Flow rate * (Absolute temperature of gas in flow tube/Standard temperature) *(Absolute pressure in flow tube/Absolute presure of gas in flow tube)
	//e.g. Volumetric flow = (100 std LPM)*(273.15+15C/273.15+21.11C)(101.3kPa/117.0kPa) = 84.78 LPM
	
	//We need to do the opposite
	//Std Flow = Flow V *(Tstd/Tv)*(Pv/Pstd)
	
	FlowS = FlowV*(((Temperature_StandardC+273.15)/(TemperatureC+273.15))*(PressuremBar/PressureStd_mBar))
	print FlowS
	return FlowS
	
End


//1/6/25 AJD Make increasing monotonic wave
//Used to take a given wave and create an increasing monotonic wave wave off of it
Function LoadAllFilesinFolder_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Doalert/T="Data Folder Check" 2, "Are you in the datafolder with the desired wave?"
			if(V_flag == 2 || V_Flag == 3) //If no or cancel clicked
				Abort "User Aborted."
			else
				//Do nothing
			endif
			V_Flag=0
			if(V_Flag==0)
			elseif(V_flag==1||V_Flag==2)
				Abort "User Aborted."
			endif
			variable LoadType
			prompt LoadType, "ner '0' for CSVs and '1' for ICARTT."
			doprompt "Please enter the following.", LoadType
			if(V_Flag==1)
				Abort "User Aborted."
			endif
//			string w_help = "*"+w_str+"*"
//			string w_list = wavelist(w_help,";", "TEXT:0")
//			wave w = $stringfromlist(0,w_list,";")
//			string dupname = nameofwave(w)+"_Mono"
//			Duplicate/O $stringfromlist(0,w_list,";"), $dupname
//			Wave Bdr_Wave = $dupname
			ImportAlldelimtedCSVs_inFolder(LoadType)
		case 2:
			break
		endswitch
end


//AJD: 5/22/25
//Find max pnts on trace and graph
Function GraphMaxMinPnts_butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Doalert/T="Data Folder Check" 2, "Are you in the datafolder with the desired wave?"
			if(V_flag == 2 || V_Flag == 3) //If no or cancel clicked
				Abort "User Aborted."
			else
				//Do nothing
			endif
			V_Flag=0
			if(V_Flag==0)
			elseif(V_flag==1||V_Flag==2)
				Abort "User Aborted."
			endif
			variable nmaxpnts
			prompt nmaxpnts, "What is amount of points to find?"
			doprompt "Please enter the following.", nmaxpnts
			if(V_Flag==1)
				Abort "User Aborted."
			endif
			GraphMaxMinPoints(nmaxpnts)
		case 2:
			break
		endswitch
end



function GraphMaxMinPoints(nmaxpnts)
	//Estabish function parameters
	Variable nmaxpnts
		
	//Find traces in graph
	string tracelist = traceNameList("", ";", 1)
	
	//Determine number of traces and loop through them to find max and min pnts
	variable ntraces = itemsinlist(tracelist, ";")
	variable i,j 
	
	for(i=0;i<ntraces;i++)
		wave temptracewave = $stringfromList(i, tracelist, ";")
		string MaxwName = nameofwave(temptracewave)+"_MaxPnts"
		string MinwName = nameofwave(temptracewave)+"_MinPnts"
		string MaxPntLocname = nameofwave(temptracewave)+"_MaxPntLoc"
		string MinPntLocname = nameofwave(temptracewave)+"_MinPntLoc"
		make/o/d/n=(nmaxpnts) $MaxwName
		make/o/d/n=(nmaxpnts) $MinwName
		Make/o/d/n=(nmaxpnts) $MaxPntLocname
		Make/o/d/n=(nmaxpnts) $MinPntLocname
		wave MaxWave = $MaxwName
		wave MinWave = $MinwName
		wave MaxWaveLoc = $MaxPntLocname
		wave MinWaveLoc = $MinPntLocname
		Duplicate/o/Free/d temptracewave, SortH2L
		Duplicate/o/Free/d temptracewave, SortL2H
		wavetransform zapnans SortH2L
		wavetransform zapnans SortL2H
		Sort/R SortH2L, SortH2L
		Sort SortL2H, SortL2H
		for(j=0;j<nmaxpnts;j++)
			MaxWave[j] = SortH2L[j]
			MinWave[j] = SortL2H[j]
			Findvalue/V=(MaxWave[j]) temptraceWave
			MaxWaveLoc[j] = V_Row
			Findvalue/V=(MinWave[j]) temptraceWave
			MinWaveLoc[j] = V_Row
		endfor
	Endfor
	
	string generatedList = wavelist("*MaxPnts*", ";", "TEXT:0")
	generatedList += wavelist("*MinPnts*", ";", "TEXT:0")
	string generatedListPointLoc = wavelist("*MaxPntLoc*", ";", "TEXT:0")
	generatedListPointLoc+= wavelist("*MinPntLoc*", ";", "TEXT:0")
	variable ngenwaves = itemsInList(generatedList, ";")
	variable ngenwavesloc = itemsinlist(generatedListPointLoc, ";")
	Edit/N=MaxMinPntsinGraph
	for(i=0;i<ngenwaves;i++)
		wave tempwave0 = $stringfromlist(i,generatedList,";")
		wave tempwave1 = $stringfromlist(i,generatedListPointloc,";")
		Appendtotable tempwave0, tempwave1
	endfor
	

end






// AJD: 5-20-25
//Do a Pearson's R on 2 waves (need to adjust waves for NaNs and Infs)
Function PearsonsR_butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Doalert/T="Data Folder Check" 2, "Are you in the datafolder with the desired wave?"
			if(V_flag == 2 || V_Flag == 3) //If no or cancel clicked
				Abort "User Aborted."
			else
				//Do nothing
			endif
			V_Flag=0
			if(V_Flag==0)
			elseif(V_flag==1||V_Flag==2)
				Abort "User Aborted."
			endif
			string w1_str, w2_str
			prompt w1_str, "What is the first wave?"
			prompt w2_str, "What is the second wave?"
			doprompt "Please enter the following.", w1_str, w2_str
			if(V_Flag==1)
				Abort "User Aborted."
			endif
			wave w1 = $w1_Str
			wave w2 = $w2_str
			PearsonsR(w1, w2)
		case 2:
			break
		endswitch
end


Function PearsonsR(w1,w2)

	//Establish Function Parameters
	wave w1, w2
	
	//Establish Datafolder structure
	DFREF StartDF = getdatafolderDFR()
	String newdfname= nameofwave(w1)+"_Pearsons_R_with_"+nameofwave(w2)
	Newdatafolder/O/S $newdfname
	DFREF NewDF = getdatafolderDFR()
	setdatafolder StartDF
	
	//Establish Local Parameters
	variable npnts = dimsize(w1,0)
	variable npnts0 = dimsize(w2,0)
	if(npnts!=npnts0)
		Abort "Waves are not equal in length. Aborting"
	endif
	variable i 
	
	//Duplicate waves to preserve initial waves
	String dName1 = Nameofwave(w1)+"_PearsonsR_Prepped"
	String dName2 = Nameofwave(w2)+"_PearsonsR_Prepped"
	Duplicate/O w1, NewDF:$dName1
	Duplicate/O w2, NewDF:$dName2
	setdatafolder NewDF
	wave TW1 = $dName1
	wave TW2 = $dName2
	
	//Test for NaNs and Infs (assuming waves are on same time series/synched up in some meaningful way)
	for(i=0;i<npnts;i++)
		if(numtype(TW1[i])==1||numtype(TW2[i])==1)//if w1 or w2 contains an inf then NaN this point
			TW1[i] = NaN
			TW2[i] = NaN
		elseif(numtype(TW1[i])==2||numtype(TW2[i])==2)//if w1 or w2 contains a NaN then NaN this point
			TW1[i] = NaN
			TW2[i] = NaN
		elseif(numtype(TW1[i])==0&&numtype(TW2[i])==0)//if w1 and w2 contains a normal number, proceed
		else
			Abort "Issue at point "+num2str(i)+". Aborting."
		endif
	endfor
	
	//No NaNs or INFs allowed. Since we have NaNed all of those points we can zap nans
	wavetransform zapnans TW1
	wavetransform zapnans TW2

	//Perform Pearson's R correlation test (in Igor this is StatslinearCorrelationTest
	StatsLinearCorrelationTest/T=0/ALPH=0.05/CI/Q TW1,TW2
	
	//Perform basic analysis with information
	wave W_StatsLinearCorrelationTest
	//get r and standard error
	variable r = W_StatsLinearCorrelationTest[1]
	variable r_stderr = W_StatsLinearCorrelationTest[2]
	//Spearman's R null hypothesis (H0) is that the correlation coefficent is zero, which makes t and F statistics
	//t test - used to compare means of two groups and determine if they are significantly different
	//F test - used to compare variances of 2+ grounds and assess if they are significantly different 
	
	//Get the critical values for r at each tail
	variable rCrit_1 = W_StatsLinearCorrelationTest[3]
	variable rCrit_2 = W_StatsLinearCorrelationTest[4]
	
	//Get pvalues at each tail
	variable p1 = W_StatsLinearCorrelationTest[6]
	variable p2 = W_StatsLinearCorrelationTest[7]
	
	//Determine if significant
//	if(r>0)
		if(p2<0.05)
			DoAlert/T="Pearson's R Analysis" 0, "Pearson'r r = "+num2str(r)+"±"+num2str(r_Stderr)+".\rCritical r values: Tail 1 and 2 = "+num2str(rCrit_1)+","+num2str(rCrit_2)+", respectively.\rThis correlation is significant because p<0.05."
		elseif(p2>0.05)
			DoAlert/T="Pearson's R Analysis" 0, "Pearson'r r = "+num2str(r)+"±"+num2str(r_Stderr)+".\rCritical r values: Tail 1 and 2 = "+num2str(rCrit_1)+","+num2str(rCrit_2)+", respectively.\rThis correlation is not significant because p>0.05."
		endif
//	elseif(r<0)
//		if(p1<0.05)
//			DoAlert/T="Pearson's R Analysis" 0, "Pearson'r r = "+num2str(r)+"±"+num2str(r_Stderr)+".\rCritical r values: Tail 1 and 2 = "+num2str(rCrit_1)+","+num2str(rCrit_2)+", respectively.\rThis correlation is significant because p<0.05."
//		elseif(p1>0.05)
//			DoAlert/T="Pearson's R Analysis" 0, "Pearson'r r = "+num2str(r)+"±"+num2str(r_Stderr)+".\rCritical r values: Tail 1 and 2 = "+num2str(rCrit_1)+","+num2str(rCrit_2)+", respectively.\rThis correlation is not significant because p>0.05."
//		endif
//	endif
	setdatafolder StartDF

End
























//4/11/2025
//Idea: Given a folder, import all of the delimted CSVs in that folder
Function ImportAlldelimtedCSVs_inFolder(LoadType)

	Variable LoadType

	//Remember StartingDF to set back to at end of code
	DFREF StartDF = GetdatafolderDFR()
	
	//Access the folder that contains all of the delimted CSVs
	string DelimtedlFolderPath = "DelimtedlFolderPath"
	DelimtedlFolderPath = AJD_SavePath(DelimtedlFolderPath)
	Pathinfo $DelimtedlFolderPath
	String CurrPathStart = s_path
	
	//I have noticed this takes a while so let's time it for fun
	StopAllTimers()
	variable Timer = startMSTimer
	
	if(LoadType==0) //If CSVs
	
		//Load the csvs into the current data folder
		string WaveFolderFiles, filename, fullpath2file, DFList; variable nwaves
		WaveFolderFiles = IndexedFile($DelimtedlFolderPath, -1, "TEXT")	//Create a list of Files in the wavefolder
		nwaves = ItemsinList(WaveFolderFiles,";")	//Get many waves are in the subfolder
	
		//Loop through and collect all files, create new data folders for each of the files
		variable i
		for(i=0;i<nwaves;i++)
			filename = stringfromlist(i,WaveFolderFiles,";")
			newdatafolder/O/S $filename
			fullpath2file = s_path+filename	//Take the full path and attatch the wave name on it
			Loadwave/O/A/Q/H/W/J fullpath2file
			setdatafolder StartDF
		endfor	
		
		//Return to the inital DF
		setdatafolder StartDF
		//Concatenate all waves in all of the DFs
		ConcatenateAllWavesinMultipleDFs(StartDF)
		
		//Report the total time it took
		Timer = StopMSTimer(0)
		variable ElapsedTime = Timer/1E6/60
		doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
		
	elseif(LoadType==1) //If ICARTT
	
	//Load the csvs into the current data folder
//		WaveFolderFiles
//		filename
//		fullpath2file
//		DFList
//		nwaves
		WaveFolderFiles = IndexedFile($DelimtedlFolderPath, -1, ".ICT")	//Create a list of Files in the wavefolder
		nwaves = ItemsinList(WaveFolderFiles,";")	//Get many waves are in the subfolder
	
	NVAR numHeaderLinesVar = root:ICARTTFileFormat:numHeaderLinesVar
	SVAR VariableNamesList= root:ICARTTFileFormat:VariableNamesList
	SVAR IndependentVariableNameStr= root:ICARTTFileFormat:IndependentVariableNameStr
		
		for(i=0;i<nwaves;i++)
			filename = stringfromlist(i,WaveFolderFiles,";")
			newdatafolder/O/S $filename
			fullpath2file = s_path+filename	//Take the full path and attatch the wave name on it
//			Loadwave/O/A/Q/H/W/J fullpath2file
			LoadWave/D/A/J/W/K=0/V={","," $",0,1}/L={numHeaderLinesVar-1,numHeaderLinesVar,0,0,0}/O fullpath2file
			setdatafolder StartDF
		endfor	
		
		//Return to the inital DF
		setdatafolder StartDF
		//Concatenate all waves in all of the DFs
		ConcatenateAllWavesinMultipleDFs(StartDF)
		
		//Report the total time it took
		Timer = StopMSTimer(0)
		ElapsedTime = Timer/1E6/60
		doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
	
	else
		abort "Type of File not recognized"
		
	Endif
	
End


//4/13/25 AJD: This is designed as a supporting function for ImportAlldelimtedCSVs_inFolder()
//It will look through all DFs in a starting DF and concatenate all of the waves in all of the folders. 
//It will generate a 2D matrix as well as 1D waves
Function ConcatenateAllWavesinMultipleDFs(StartDF)

	//Establish Function Parameters
	DFREF StartDF
	
	//Establish Local Parameters
	variable i, j
	variable nDFs = countobjectsDFR(StartDF,4) //Determine how many folders (corresponding to files loaded in) we have; this might cause me some problems if there are other DF in the folder. 
	String LoadedFileDFList = ""
	//Loop to get a list of all the datafolders that we will want to go through
	for(i=0;i<nDFs;i++)
		LoadedFileDFList += getindexedObjNameDFR(StartDF, 4, i)+";"
	Endfor
	//Find the first data folder to use as a reference for all of the waves we will concatenate
	DFREF FirstDF = $stringfromlist(0, LoadedFileDFList, ";")
	
	//Make the wavelist
	Setdatafolder FirstDF
	String ReferenceWaveList = wavelist("*", ";", "TEXT:0")
	Variable nReferenceWaves = itemsinlist(ReferenceWaveList,";")
	//Go back to the starting DF
	Setdatafolder StartDF
	
	//Setup the wavelist that will hold the full path to all of the waves in a single iteration of the loop
	String FullPath2Waves = ""
	
	//Start double loop
	//First loop (i loop) responsibility: Get the wave to concatenate
	//Second loop (j loop) responsibility: Get the full path to the wave in each of the datafolders
	For(i=0;i<nReferenceWaves;i++)
		//Find the current wave we will be concatenating
		String CurrWave = stringfromlist(i,ReferenceWaveList,";")
		//Now that we have our current wave go through all of the folders and find the fullpath to the wave to prepare for concatenation
		for(j=0;j<nDFs;j++)
			DFREF CurrDF = $stringfromlist(j,LoadedFileDFList,";")	//Use the Datafolder list created above to loop through all of the datafolders
			Setdatafolder CurrDF
			String CurrDFfullpath = getdataFolder(1, CurrDF)
			//Now that we are in the current datafolder get the full path to the wave at index i
			FullPath2Waves += CurrDFfullpath+getindexedObjNameDFR(CurrDF, 1, i)+";"		
			Setdatafolder StartDF
		Endfor
		//Perform Concatenation and reset nessesary strings
		Setdatafolder StartDF
		String ConcatName = nameofwave($stringfromlist(0,Fullpath2waves,";"))+"_Concat"
		Concatenate/O FullPath2Waves, $ConcatName
		FullPath2Waves = ""
	Endfor
	
	//Now we have all of the nessesary concatenated waves in a 1D format, let's go ahead and create a matrix of all of these waves
	Setdatafolder StartDF
	String ConcatWaveList = wavelist("*",";","TEXT:0")
	String TwoDConcatName = "LoadedFileMatrix_Concat"
	Concatenate/O ConcatWaveList, $TwoDConcatName


End

Function SP2_ICARTT_GOTHAAM_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Doalert/T="Data Processor Checker" 2, "Has the SP2 Data (including coatings) been processed and post processed?"
			if(V_flag == 2 || V_Flag == 3) //If no or cancel clicked
				Abort "User Aborted."
			else
				//Do nothing
			endif
			SP2_ICARTT_GOTHAAM()
		case 2:
			break
		endswitch
end


//AJD 7/5/2025: Take SP2 waves from Processed data (PSI SP2 toolkit), move them to a folder and then create an ICARTT Table
Function SP2_ICARTT_GOTHAAM()

	//Establish DF Hierarchy
	DFREF StartDF = GetDataFolderDFR() //Remember starting DF
	Setdatafolder root: //Change DF to root
	DFREF RootDF = GetDataFolderDFR()
	NewdataFolder/O/S GOTHAAM_ICARTT
	DFREF ICARTTDF = GetDataFolderDFR()
	setdatafolder RootDF
	
	//Find all of the DFs with data that we want to extract
	String DFSeeker_Raw ="*_SP2"; String DFSeeker_INI = "INI"; String DFSeeker_PBP = "*_SP2_PBP"
	String DFSeeker_ConcTser = "ConcTser";	String DFSeeker_LEOBase = "LEO"; String DFSeeker_LEOMain = "Main"
	String DFSeeker_LEOTrace = "TraceFit"; String DFSeeker_SDTSer = "SizeDistTser";	String List_DFREF = ""
	List_DFREF = SP2FindImportantDFs()
	
	//Establish Wavelists of Relevent Waves to Create ICARTT;; Edit these after the talk with Delphine 7/9/25
	String WL_Raw = "SampleFlowRate;TimeDate"
	//String WL_INI = "OneofEveryLoaded;OneofEverySaved"
//	String WL_PBP = "BHBL_BCdiam;BHBL_BClogdiam;BHBL_BCmass;BHBL_BCmassdistr;BHBL_BCmassdistr_err;BHBL_BCtotalmass;BHBL_BCtotalmassconc;BHBL_LogNormFitDiamMidpt;BHBL_LogNormFitMassBCconc;BHBL_logNormfitMassCoef;BHBL_LogNormFitMassDistr;BHBL_LogNormFitNumbBCconc;BHBL_LogNormFitNumbCoef;BHBL_LogNormFitNumbDistr;BHBL_saturated"
	String WL_ConcTSer = "SHSL_NumbConc;BHBL_MassConc;BHBL_NumbConc;TimeCtr;TimeBdr"
	String WL_SDTSer = "BHBL_DiamMidpt;BHBL_MassDistr;BHBL_NumbDistr;SHSL_DiamMidpt;SHSL_NumbDistr"
	String WL_LEOMain = "SCLG_BCcoatingThickness;"
	String WL_LEOTrace = "SCLG_OptDiamAll;"
	
	//Move Waves to ICARTT Folder
	setdatafolder RootDF
		//Raw/INI
	Setdatafolder stringfromList(0,List_DFREF,";")
		DFREF CurrDF = GetDataFolderDFR()
		MoveWaveList2NewDF(WL_Raw,CurrDF,ICARTTDF)
		//ConcTSer
	Setdatafolder stringfromList(3,List_DFREF,";")
		DFREF CurrDF = GetDataFolderDFR()
		MoveWaveList2NewDF(WL_ConcTSer,CurrDF,ICARTTDF)
	Setdatafolder stringfromList(4,List_DFREF,";")
		DFREF CurrDF = GetDataFolderDFR()
		MoveWaveList2NewDF(WL_SDTSer,CurrDF,ICARTTDF)
		//LEO
	Setdatafolder stringfromList(6,List_DFREF,";")
		DFREF CurrDF = GetDataFolderDFR()
		MoveWaveList2NewDF(WL_LEOMain,CurrDF,ICARTTDF)
	Setdatafolder stringfromList(7,List_DFREF,";")
		DFREF CurrDF = GetDataFolderDFR()
		MoveWaveList2NewDF(WL_LEOTrace,CurrDF,ICARTTDF)
		
//		Make name and time adjustments
		setdatafolder ICARTTDF
		wave SampleFlowRate, TimeCtr
		setdatafolder StringfromList(0,List_DFREF,";")
		Wave TimeDate
		variable npnts_TimeCtr = dimsize(TimeCtr,0)
		setdatafolder ICARTTDF
		Interpolate2/T=1/N=(npnts_TimeCtr)/Y=SampleFlowRate_L/X=TimeCtr TimeDate, SampleFlowRate
		
		
		string RevisionNumber
		string FlightNumber
		variable DataFrequency
		Prompt RevisionNumber, "What revision is this?"
		Prompt FlightNumber, "What research flight number is this?"
		prompt DataFrequency, "What time frequency is the data in (seconds)?"
		Doprompt "Enter the following", RevisionNumber, FlightNumber, DataFrequency
		
		
		wave TimeCtr
		TimeCtr[0]= round(TimeCtr[0])
		TimeCtr = TimeCtr[0]+(p*DataFrequency)
		Duplicate TimeCtr, Time_Start
		//UTC is 4 hrs ahead of NY (EDT)
//		Time_Start+=(4*3600)	//No need SP2 is already in UTC time
		setscale d,0,0,"dat", Time_Start
		note Time_Start, "Time_Start; seconds_past_midnight;"
//		rename BHBL_MassConc, AerComp_Soot_InSitu_RHa_LII_Accu_STP //This is before I looked at SP2 WE-CAN ICARTT Data
		rename BHBL_MassConc, AerComp_Soot_InSitu_RHa_LII_Accu_MassSTP
		rename BHBL_NumbConc, AerComp_Soot_InSitu_RHa_LII_Accu_STP
		rename SHSL_NumbConc, AerMP_NumConc_InSitu_RHa_Optical_Acc_STP
		rename SampleFlowRate_L, Qs_SP2
		rename BHBL_MassDistr, AerComp_BCMassSizeDist_RHa_LII_Accu_MassSTP
		rename BHBL_NumbDistr,AerComp_BCNumSizeDist_RHa_LII_Accu_STP
		rename SHSL_NumbDistr, AerMP_NumSizeDist_InSitu_RHa_Optical_Accu_STP
		
		wave AerComp_Soot_InSitu_RHa_LII_Accu_MassSTP, AerComp_Soot_InSitu_RHa_LII_Accu_STP, AerMP_NumConc_InSitu_RHa_Optical_Acc_STP, Qs_SP2,AerMP_NumSizeDist_InSitu_RHa_Optical_Accu_STP,AerComp_BCMassSizeDist_RHa_LII_Accu_MassSTP,AerComp_BCNumSizeDist_RHa_LII_Accu_STP
		//Set NaNs to -9999
		AerComp_Soot_InSitu_RHa_LII_Accu_MassSTP = Numtype(AerComp_Soot_InSitu_RHa_LII_Accu_MassSTP[p]) == 2 ? -9999 : AerComp_Soot_InSitu_RHa_LII_Accu_MassSTP[p]
		AerComp_Soot_InSitu_RHa_LII_Accu_STP = NumType(AerComp_Soot_InSitu_RHa_LII_Accu_STP[p]) == 2 ? -9999 : AerComp_Soot_InSitu_RHa_LII_Accu_STP[p]
		AerMP_NumConc_InSitu_RHa_Optical_Acc_STP = NumType(AerMP_NumConc_InSitu_RHa_Optical_Acc_STP[p]) == 2 ? -9999 : AerMP_NumConc_InSitu_RHa_Optical_Acc_STP[p]
		Qs_SP2 = NumType(Qs_SP2[p]) == 2 ? -9999 : Qs_SP2[p]
		ICARTTNaN2DWave(AerComp_BCMassSizeDist_RHa_LII_Accu_MassSTP)
		ICARTTNaN2DWave(AerComp_BCNumSizeDist_RHa_LII_Accu_STP)
		ICARTTNaN2DWave(AerMP_NumSizeDist_InSitu_RHa_Optical_Accu_STP)
			
		//Make good notes under the waves
		string Y,M,D
		string YMD = secs2Date(TimeCtr[0],-2,",")
		string expr="([[:digit:]]+),([[:digit:]]+),([[:digit:]]+)"
		SplitString/E=(expr) secs2Date(TimeCtr[0],-2,","), Y,M,D
//		string RevisionNumber
//		string FlightNumber
//		variable DataFrequency
//		Prompt RevisionNumber, "What revision is this?"
//		Prompt FlightNumber, "What research flight number is this?"
//		prompt DataFrequency, "What tiem frequency is the data in (seconds)?"
//		Doprompt "Enter the following", RevisionNumber, FlightNumber, DataFrequency
		string ICARTTWList_M = "AerComp_Soot_InSitu_RHa_LII_Accu_MassSTP;AerComp_BCMassSizeDist_RHa_LII_Accu_MassSTP"
		string ICARTTWList_N = "AerComp_Soot_InSitu_RHa_LII_Accu_STP;AerMP_NumConc_InSitu_RHa_Optical_Acc_STP;AerComp_BCNumSizeDist_RHa_LII_Accu_STP;AerMP_NumSizeDist_InSitu_RHa_Optical_Accu_STP;"
		String ICARTTWList_Q = waveList("Q*",";","TEXT:0")
		variable ICARTTWNumb_M = itemsinlist(ICARTTWList_M,";")
		variable ICARTTWNumb_N = itemsinlist(ICARTTWList_N,";")
		variable ICARTTWNumb_Q = itemsinlist(ICARTTWList_Q,";")
		variable i
		for(i=0;i<ICARTTWNumb_M;i++)
			Wave Tempwave = $stringfromlist(i,ICARTTWList_M,";")
			note/K Tempwave, "ug std m-3;"
			note Tempwave, "LLOD:N/A ug std m-3;"
			note Tempwave, "ULOD:N/A ug std m-3;"
			note TempWave, "AerComp_Soot_InSitu_RHa_LII_Accu_MassSTP"
			note Tempwave, "GOTHAAM, 2025;"
			note Tempwave, Y+","+M+","+D+";"+RevisionNumber
			note Tempwave, RevisionNumber+": Includes data submitted as of "+M+"/"+D+"/"+Y+"."
			note Tempwave, "Delphine Farmer; CSU-SP2; GOTHAAM 2025; Research Flight "+FlightNumber+", on the C130 Platform."+" Data is merged to "+num2str(DataFrequency)+" seconds."
			setscale d,0,0,"ug sm-3",TempWave
		endfor
		for(i=0;i<ICARTTWNumb_N;i++)
			Wave Tempwave = $stringfromlist(i,ICARTTWList_N,";")
			note/K Tempwave, "# std cm-3;"
			note Tempwave, "LLOD:N/A # std cm-3;"
			note Tempwave, "ULOD:N/A # std cm-3;"
			if(stringmatch(stringfromlist(i,ICARTTWList_N,";"),"AerMP_NumConc_InSitu_RHa_Optical_Acc_STP")==1 || stringmatch(stringfromlist(i,ICARTTWList_N,";"),"AerMP_NumSizeDist_InSitu_RHa_Optical_Accu_STP")==1 )//If scattering number concentration
				note Tempwave,"AerMP_NumConc_InSitu_RHa_Optical_Acc_STP"
			else
				note Tempwave, "AerComp_Soot_InSitu_RHa_LII_Accu_STP"
			endif
			note Tempwave, "GOTHAAM, 2025;"
			note Tempwave, Y+","+M+","+D+";"+RevisionNumber
			note Tempwave, RevisionNumber+": Includes data submitted as of "+M+"/"+D+"/"+Y+"."
			note Tempwave, "Delphine Farmer; CSU-SP2; GOTHAAM 2025; Research Flight "+FlightNumber+", on the C130 Platform."+" Data is merged to "+num2str(DataFrequency)+" seconds."
			setscale d,0,0,"# scm-3",TempWave
		endfor
		for(i=0;i<ICARTTWNumb_Q;i++)
			Wave Tempwave = $stringfromlist(i,ICARTTWList_Q,";")
			note/K Tempwave, "cm3 min-1;"
			note Tempwave, "LLOD:N/A cm3 min-1;"
			note Tempwave, "ULOD:N/A cm3 min-1;"
			note Tempwave, "AerMP_NumConc_InSitu_RHa_LII_Accu_STP"
			note Tempwave, "GOTHAAM, 2025;"
			note Tempwave, Y+","+M+","+D+";"+RevisionNumber
			note Tempwave, RevisionNumber+": Includes data submitted as of "+M+"/"+D+"/"+Y+"."
			note Tempwave, "Delphine Farmer; CSU-SP2; GOTHAAM 2025; Research Flight "+FlightNumber+", on the C130 Platform."+" Data is merged to "+num2str(DataFrequency)+" seconds."
			setscale d,0,0,"cm3 min-1",TempWave
		endfor
	
		//Partition 2D waves into 1D waves with appropriate midpoints
		wave AerComp_BCMassSizeDist_RHa_LII_Accu_MassSTP
		wave AerComp_BCNumSizeDist_RHa_LII_Accu_STP
		wave AerMP_NumSizeDist_InSitu_RHa_Optical_Accu_STP
		Wave BHBL_DiamMidpt, SHSL_DiamMidpt
		SeparateforICARTT(AerComp_BCMassSizeDist_RHa_LII_Accu_MassSTP,BHBL_DiamMidpt)
		SeparateforICARTT(AerComp_BCNumSizeDist_RHa_LII_Accu_STP,BHBL_DiamMidpt)
		SeparateforICARTT(AerMP_NumSizeDist_InSitu_RHa_Optical_Accu_STP,SHSL_DiamMidpt)
		
		Wave SCLG_BCcoatingThickness 
		
		//Need to average out coatings due to PBP nature of how the SP2 reports coating thickness
		wave TimeBdr
		Duplicate SCLG_BCcoatingThickness, BCCoatThick_CTZero2NaN
		BCCoatThick_CTZero2NaN = BCCoatThick_CTZero2NaN[p] < 0 ? NaN : BCCoatThick_CTZero2NaN[p]
		Avg_Interp(TimeDate,BCCoatThick_CTZero2NaN,TimeBdr)
		Rename BCCoatThick_CTZero2NaN_AvgInterp, AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP
		wave AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP
		AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP = NumType(AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP[p]) == 2 ? -9999 : AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP[p]
		
//		Duplicate SCLG_BCcoatingThickness, BCCoatThick
		note/K AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP, "nm;"
		note AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP, "LLOD:N/A nm;"
		note AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP, "ULOD:N/A nm;"
		note AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP, "AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP"
		note AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP, "GOTHAAM, 2025;"
		note AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP, Y+","+M+","+D+";"+RevisionNumber
		note AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP, RevisionNumber+": Includes data submitted as of "+M+"/"+D+"/"+Y+"."
		note AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP, "Adam De Groodt; CSU-SP2; GOTHAAM 2025; Research Flight "+FlightNumber+", on the C130 Platform."+" Data is merged to "+num2str(DataFrequency)+" seconds."
		note AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP, "Averaged coatings reported are unrestricted by BC Core Size or Optical Diamter. Pre-Averaged Coatings below zero are considered noise and set as NaNs."
		setscale d,0,0,"nm",AerMP_BCCoatThick_InSitu_RHa_Optical_Acc_STP
		
		//Make the ICARTT Table
		MakeICARTT_Table("SP2")
		AppendToTable Time_Start, AerComp_Soot_InSitu_RHa_LII_Accu_MassSTP, AerComp_Soot_InSitu_RHa_LII_Accu_STP, AerMP_NumConc_InSitu_RHa_Optical_Acc_STP, Qs_SP2//,AerComp_BCMassSizeDist_RHa_LII_Accu_MassSTP,AerComp_BCNumSizeDist_RHa_LII_Accu_STP,AerMP_NumSizeDist_InSitu_RHa_Optical_Accu_STP
//		string BCMDWList = wavelist("*AerComp_BCMassSizeDist_RHa_LII_Accu_MassSTP_M*",";","TEXT:0")
//		string BCNDWList = wavelist("*AerComp_BCNumSizeDist_RHa_LII_Accu_STP_M*",";","TEXT:0")
//		string SNDWList = wavelist("*AerMP_NumSizeDist_InSitu_RHa_Optical_Accu_STP_M*",";","TEXT:0")
//		AppendWaves2Table(BCMDWList,"SP2_ICARTT")
//		AppendWaves2Table(BCNDWList,"SP2_ICARTT")
//		AppendWaves2Table(SNDWList,"SP2_ICARTT")
		modifytable digits(Time_Start)=2, format(Time_Start)=8, format[2,inf]=3, digits[2]=4,digits[3,inf]=1
		variable nwavesICARTTTable = ICARTTwNumb_M+ICARTTWNumb_N+ICARTTWNumb_Q+1-3//one for time minus 3 for the SD which I can add later
		
		//Make Standard Names Document
		NewNotebook/F=0/ENCG=1/N=SP2_Standard_Names
		NoteBook SP2_Standard_Names text ="Atmospheric Composition Variable Standard Name = MeasurementCategory_CoreName_AcquisitionMethod_DescriptiveAttributes\r\r"
		NoteBook SP2_Standard_Names text = "Black Carbon Mass Concentration:AerComp_Soot_InSitu_RHa_LII_Acc_MassSTP\r" 
		NoteBook SP2_Standard_Names text ="Black Carbon Number Concentration: AerComp_Soot_InSitu_RHa_LII_Acc_STP\r" 
		NoteBook SP2_Standard_Names text ="Scattering Number Concentration: AerMP_NumConc_InSitu_RHa_LII_Acc_STP\r"
		NoteBook SP2_Standard_Names text ="AerComp_BCMassSizeDist_RHa_LII_Accu_MassSTP\r"
		NoteBook SP2_Standard_Names text ="AerComp_BCNumSizeDist_RHa_LII_Accu_STP\r"
		NoteBook SP2_Standard_Names text ="AerMP_NumSizeDist_InSitu_RHa_Optical_Accu_STP\r"
	//	NoteBook SP2_Standard_Names text = "Black Carbon Coating Thickness: AerMP_BCCoatThick_InSitu_RHa_LII_Acc_STP\r"
		
		
		
		setdatafolder StartDF
		
		//SelectICARTT Table	
		DoICARTTTableButton()
		
		//See if I can automate some ICARTT Stuff (using ICARTT Code)
		DoWindow/F IcarttFormattingTable
		IF(V_flag==0)
			Edit/N=IcarttFormattingTable/K=1 root:IcarttFileFormat:WaveListTextWaveMatrix.ld as "IcarttFormattingTable"		//KJZ 2022.11.04 Added /K=1 flag		2022.12.06 added .ld to include the dimension labels
		ENDIF
		
		//Make my own formats to the table
		wave/T ICARTTTextWave = root:ICARTTFileFormat:WaveListTextWaveMatrix
		string StandardNameText = "Time_Start;AerComp_Soot_InSitu_RHa_LII_Acc_MassSTP;AerMP_NumConc_InSitu_RHa_LII_Acc_STP;AerMP_NumConc_InSitu_RHa_LII_Acc_STP;;"//;AerComp_BCMassSizeDist_RHa_LII_Accu_MassSTP;AerComp_BCNumSizeDist_RHa_LII_Accu_STP;AerMP_NumSizeDist_InSitu_RHa_Optical_Accu_STP;"
		string OptionalLongDescriptionText = "Time (UTC);Mass concentration (STP) of Black Carbon particles; Number concentration (STP) of black carbon particles; Number concentration (STP) of purely scattering particles;SP2 volumetric flow rate (vccm);"//Black carbon mass distribution;Black carbon number distribution;Scattering particle number distribution;"
		
		TextWaveRowLabel(ICARTTTextWave,nwavesICARTTTable,6,StandardNameText)
		TextWaveRowLabel(ICARTTTextWave,nwavesICARTTTable,7,OptionalLongDescriptionText)
		
		//Fix this so Glen is happy
		ICARTTTextWave[1,][3]="-XXXXX"



End

Function AppendWaves2Table(wList,TableName)

	String wList, TableName
	
	variable nitems = itemsinList(wList,";")
	variable i
	
	for(i=0;i<nitems;i++)
		wave tempwave = $stringfromlist(i,wList,";")
		Appendtotable/W=$TableName tempwave
	
	endfor


End

Function ICARTTNaN2DWave(SD)

	Wave SD
	
	Variable nrows = dimsize(SD,0)
	variable ncols = dimsize(SD,1)
	variable i,j
	
	for(i=0;i<nrows;i++)
		for(j=0;j<ncols;j++)
		if(Numtype(SD[i][j])==2)
			SD[i][j] = -9999
		endif
		Endfor	
	endfor


End

Function TextWaveRowLabel(w,nrows,col,text)
	
	wave/T w
	variable nrows, col
	string text
	
	variable i
	for(i=0;i<nrows;i++)
		w[i][col] = stringfromlist(i,text,";")
	
	endfor


end

Function DoICARTTTableButton()

	WAVE/T WaveListTextWaveMatrix= root:ICARTTFileFormat:WaveListTextWaveMatrix		// 2 dimensional beast appearing on tab0
			WAVE SelWaveMatrix= root:ICARTTFileFormat:SelWaveMatrix		// 2 dimensional beast to allow editing
				
			SVAR TableNameStr = root:ICARTTFileFormat:TableNameStr
			SVAR IndependentVariableNameStr= root:ICARTTFileFormat:IndependentVariableNameStr
			SVAR IndependentVariableFormatStr= root:ICARTTFileFormat:IndependentVariableFormatStr
			SVAR VariableNamesList = root:ICARTTFileFormat:VariableNamesList
			NVAR UTCDataStartVar = root:ICARTTFileFormat:UTCDataStartVar
			SVAR UTCDataStartStr = root:ICARTTFileFormat:UTCDataStartStr
			NVAR NumVariablesVar = root:ICARTTFileFormat:NumVariablesVar
			NVAR DataIntervalVar = root:ICARTTFileFormat:DataIntervalVar
			
			NVAR ICARTTVersionNumberVar=root:ICARTTFileFormat:ICARTTVersionNumberVar
			
			string myWaveStr, myWaveInfo, myColInfo, formatStr, digitsStr, UnitsStr, formatList	
			string colNameStr, tableInfoStr, combinedFormatStr
			variable myIndex, myNum, numCols, numRows, iColDex, numWaves, waveNumCol, i2D_ColDex, OldFormatPos   	// 2018.02 DTS OldFormatPos
			
			//AJD Edit
			Variable kVDebug_Mode, kvMax_Num_Parameters,kvNum_List_Box_Cols,kvMax_Time_Precision,kvEnforce_Time_Names
			kvMax_Num_Parameters=10 //Setting this to 10 for now
			kvMax_Time_Precision=2//This is two in ICARTT Code
			kvNum_List_Box_Cols=8//This is 8 in ICARTT Code
			
			
			Make/O/T/N=(0,3) root:ICARTTFileFormat:ErrorLog/WAVE=ErrorLog
			String strError_Message=""
			
			TableNameStr = WinName(0,2)		// top table
			IF(strlen(TableNameStr)==0)
				IF(kvDebug_Mode)			//2025.03.31 KJZ: Fatal error, can't proceed if there isn't a top table
					DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
				ENDIF
				Abort "There is no top table.  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."
			ENDIF
			
			ModifyTable/W=$TableNameStr/Z entryMode=1		//Makes sure whatever the user entered into the table gets accepted
					
			tableInfoStr = TableInfo(TableNameStr, -2)		// get info about entire table
			numCols=numberByKey("COLUMNS", tableInfoStr)-1
			IF(numCols==0)
				// so far as I understand we always have a point column and it is column number -1
				IF(kvDebug_Mode)		//2025.03.31 KJZ: Fatal error, can't proceed if there aren't any waves in the top table
					DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
				ENDIF
				Abort "The top most table named "+TableNameStr+" does not appear to have any waves in it.  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."
			ENDIF
			
			IF(numCols>=kvMax_Num_Parameters)			//2022.11.29 KJZ use a constant in case this changes
				IF(kvDebug_Mode)			//2025.03.31 KJZ: Going to call this a fatal error
					DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
				ENDIF
				Abort "More than "+num2istr(kvMax_Num_Parameters)+" parameters were selected; this is too much.  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."			//2022.12.05 KJZ replaced num2str with num2istr
			ENDIF
		
			// 2018.02 DTS mods for Pedro
			Duplicate/T/FREE WaveListTextWaveMatrix OLDWaveListTextWaveMatrix
//			make/t/free/n=(dimsize(WaveListTextWaveMatrix,0)) oldWaveName = WaveListTextWaveMatrix[p][1]	// KA 20220304  Bug if n=0 which it is when making new file not from existing header.
			if (dimsize(WaveListTextWaveMatrix,0) != 0)
				Make/T/FREE/N=(dimsize(WaveListTextWaveMatrix,0)) oldWaveName = WaveListTextWaveMatrix[p][1]
			else
				Make/T/FREE/N=(numCols) oldWaveName = ""
			endif
			Redimension/N=(numCols, kvNum_List_Box_Cols) WaveListTextWaveMatrix, SelWaveMatrix		// make sure it is big enough.  We don't include independent parameter
			
			// goal of this for loop is to 
			// get format values, wave names and put into WaveListTextWaveMatrix
			// prep data by breaking up 2D waves and prepping data
			formatList=""
			VariableNamesList=""
			numRows=0
			
			Variable vVariable_ShortName_Max_Length		//KJZ 2023.05.23 Removed kvVariable_ShortName_Max_Length from the constants and doing this instead
			IF(IgorVersion() >= 8.00) 							//This way the user shouldn't have to change the constants.
				vVariable_ShortName_Max_Length=255
			ELSE
				vVariable_ShortName_Max_Length=31
			ENDIF
			
			Make/O/U/B/FREE/N=1 wTime_Wave_Index=0
			
			NewDataFolder/o root:ICARTTFileFormat:Data
			
			FOR(iColDex=0;iColDex<numCols;iColDex+=1)		// number of columns in the table... could equal the number of dependent parameters
				
				tableInfoStr = TableInfo(TableNameStr, iColDex)		// get info about column iColDex
			 	myWaveStr=StringByKey("WAVE", tableInfoStr)		// can be in different data folders... string has the full path
				formatStr = StringByKey("FORMAT", tableInfoStr)
				DigitsStr = StringByKey("DIGITS", tableInfoStr)
		
			 	Wave/Z Data_Wave = $myWaveStr  // can be in different data folders... string has the full path 	KJZ 2022.11.29 Renamed this from wav to Data_Wave due to Igor's autocompletion
			 	IF(!WaveExists(Data_Wave))		// should never happen
					strError_Message="Wave "+myWaveStr+" doesn't seem to exist."
					IF(kvDebug_Mode)
						DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
						Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."
					ELSE
						ICARTT_Error_Logger(strError_Message)
					ENDIF
					
			  	ELSE
					UnitsStr = StringByKey("DUNITS", WaveInfo(Data_Wave,0))	
					formatStr = SelectString (stringmatch(UnitsStr, "dat") , formatStr, "t") 	
			  	ENDIF
			  	
			  	IF(strlen(NameOfWave(Data_Wave))>vVariable_ShortName_Max_Length)		//KJZ 2022.11.14 ICARTT requires that short names be less than 31 characters.  Igor versions less than 8 will also have issues with names longer than 31 characters
			  		strError_Message=NameOfWave(Data_Wave)+" is too long!  Wave names must be "+num2str(vVariable_ShortName_Max_Length)+" characters or less!"
			  		IF(kvDebug_Mode)
						DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
			  			Abort strError_Message+" Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."
			  		ELSE
			  			ICARTT_Error_Logger(strError_Message)
			  		ENDIF
			  	
			  	ENDIF
				
				// do not allow 'general' format cuz we won't know the number of digits of precision
				Variable vGeneral_Format_Flag=stringmatch(formatStr, "0")
				IF(vGeneral_Format_Flag)
					strError_Message="Column "+num2str(iColDex)+", "+myWaveStr+", is using a 'general' format.  Please select a different format so that the number of decimal places or significant digits is clear."
					IF(kvDebug_Mode)
						DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
						Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"." 
					ELSE
						ICARTT_Error_Logger(strError_Message)
					ENDIF
				ENDIF
				
				//2022.11.29 KJZ	Instead of forcing the number of digits to 0, ask the user what they want to do.
				IF(cmpstr(formatStr, "t")==0 || cmpstr(formatStr, "8")==0)
					IF(str2num(DigitsStr)>kvMax_Time_Precision)
						DoAlert 1, "The number of digits on "+NameOfWave(Data_Wave)+" ("+DigitsStr+") is greater than the maximum allowed ("+num2str(kvMax_Time_Precision)+")!  Do you want to use the max (YES) or set the digits to 0 (NO)?"
						IF(V_Flag==1)
							DigitsStr=num2str(kvMax_Time_Precision)
						ELSEIF(V_Flag==2)
							DigitsStr="0"
						ENDIF
					ENDIF
				ENDIF
				
				combinedFormatStr = ICARTT_FormatStr(formatStr, DigitsStr)	
		
				// 2018.02 DTS mods for Pedro
				FindValue/text=(NameofWave(Data_Wave))/TXOP=4 oldWaveName
				OldFormatPos=V_value
				// check for defects in the first column, the time wave, the independent variable.
				IF(iColDex==0)
					IF(NumberByKey("NUMTYPE",  WaveInfo(Data_Wave,0))!=4)		// must be double precision
						strError_Message="The first column, which should be the time wave, is not double precision."
						IF(kvDebug_Mode)
							DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
							Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."
						ELSE
							ICARTT_Error_Logger(strError_Message)
						ENDIF	
					ENDIF
					
					IF(dimsize(Data_Wave,1)>0 || dimsize(Data_Wave,0)==0)
						strError_Message="The time wave must not be 2 dimensional and must have more than one point."
						IF(kvDebug_Mode)
							DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
							Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."
						ELSE
							ICARTT_Error_Logger(strError_Message)
						ENDIF
					ENDIF
						
					UTCDataStartVar = Data_Wave[0] - mod(Data_Wave[0], 86400)		// could get weird for leap year seconds?
					numRows = Dimsize(Data_Wave,0)
					Duplicate/O/FREE Data_Wave wavDiff
					wavDiff[1,] = Data_Wave[p] - Data_Wave[p-1]		//v2.20 3/15 2017
					wavDiff[0] =wavDiff[1]
					WaveStats/Q/M=1 wavDiff
					if (v_min<=0 || V_npnts!=numRows || V_numNans>0)		// we have duplicate times or we have nans in time
						WaveStats/Q/M=1 wavDiff
						strError_Message="There is a problem of nonmonoticity with the time wave at point number "+num2istr(V_minLoc) +" or at another point."
						
						IF(kvDebug_Mode)
							DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
							Print Secs2Time(DateTime, 3)+" "+strError_Message+"  Aborted from "+ICARTT_Return_Abort_Info(1, 2)+"."
							Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."  			//2022.12.05 KJZ replaced num2str with num2istr
						ELSE
							ICARTT_Error_Logger(strError_Message)
						ENDIF
					ENDIF
					
					if (V_min==V_max && V_min<=1)		//2.19
						DataIntervalVar=V_min
					else
						DataIntervalVar=0		// a decent default
					endif
					
					// finally! we verify that this is a good time wave	
					IndependentVariableNameStr=NameofWave(Data_Wave)	//				
					IndependentVariableFormatStr = ICARTT_FormatStr(formatStr, DigitsStr)
				
					Duplicate/o Data_Wave $"root:ICARTTFileFormat:Data:"+ nameOfWave(Data_Wave) /Wave = DuplicatedWave
					DuplicatedWave-=UTCDataStartVar
					
					// sets the UTCDateStartString
					UTCDataStartStr = ReplaceString("-", Secs2Date(UTCDataStartVar, -2), ", ")				//KJZ 2022.11.04 Removed the call to time2yyyymmddhhmmss since it is not needed
					WaveListTextWaveMatrix[iColDex][0]=combinedFormatStr
					WaveListTextWaveMatrix[iColDex][1]=IndependentVariableNameStr	
					WaveListTextWaveMatrix[iColDex][2]="seconds_past_midnight"
					WaveListTextWaveMatrix[iColDex][3]="---"								//2022.12.06 KJZ Can't have missing data in the independent variable
					WaveListTextWaveMatrix[iColDex][4]="---"		//2022.12.06 KJZ Can't have LODs for the independent variable
					WaveListTextWaveMatrix[iColDex][5]="---"
					WaveListTextWaveMatrix[iColDex][6]=SelectString(ICARTTVersionNumberVar>=2, "", WaveListTextWaveMatrix[iColDex][1])		//KJZ 2022.11.04 Standard name for the timewave should be the same as the wavename
					// notice that we do not put the independent variable into the VariableNamesList
		
				else		// can either be another time wave (start stop data) or a dependent parameter
					waveNumCol = dimSize(Data_Wave, 1)
					
					// sanity checks
					// check that all waves have the same number of rows.
					if (dimsize(Data_Wave,0) != numRows)
						strError_Message="The number of rows in wave "+NameofWave(Data_Wave) +" ("+num2istr(dimsize(Data_Wave,0))+") must be the same as in the first column ("+num2istr(numRows)+")."
						IF(kvDebug_Mode)
							DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
							Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."
						ELSE
							ICARTT_Error_Logger(strError_Message)
						ENDIF
					endif
				
					// check that it is a nice 2D and not a 3D
					IF(dimsize(Data_Wave,2)>0)	// 3D wave abort!
						strError_Message="Wave "+myWaveStr+" is 3D, can't process!"
						IF(kvDebug_Mode)
							DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
							Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."
						ELSE
							ICARTT_Error_Logger(strError_Message)
						ENDIF
					
					ELSEIF(waveNumCol==1)		// 2D wave with only one column, abort!
						strError_Message="Wave "+NameofWave(Data_Wave) +" is 2D, but there is only one column!"
						IF(kvDebug_Mode)
							DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
							Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."
						ELSE
							ICARTT_Error_Logger(strError_Message)
						ENDIF
					ENDIF
					
					//KJZ 2022.11.29 Figure out the missing data flag for each dependent variable
					WaveStats/Q Data_Wave
					Variable vMin_Value=V_Min
					
					//2023.06.08 KJZ Check other time waves (Time_Stop or Time_Mid) for NaNs, Infs, and nonmonoticity
					IF(cmpstr(formatStr, "t")==0 || cmpstr(formatStr, "8")==0)		//2023.06.08 KJZ: This might be redundant with the code below, but I'm going to keep it for now.
						IF(DimSize(Data_Wave,0)!=V_npnts)
							strError_Message="Wave "+NameofWave(Data_Wave) +" is a time wave, but it has NaNs or Infs, which are not allowed!"
							IF(kvDebug_Mode)
								DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
								Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."
							ELSE
								ICARTT_Error_Logger(strError_Message)
							ENDIF
						ENDIF
						
						Make/O/D/FREE/N=(Dimsize(Data_Wave,0)) wWave_Delta
						wWave_Delta[1,]=Data_Wave[p] - Data_Wave[p-1]
						wWave_Delta[0]=wWave_Delta[1]
						WaveStats/Q/M=1 wWave_Delta
							
						IF(v_min<=0 || V_npnts!=DimSize(Data_Wave,0) || V_numNans>0)		// we have duplicate times or we have nans in time
							strError_Message="There is a problem of nonmonoticity with the time wave at point number "+num2istr(V_minLoc) +" or at another point."
							
							IF(kvDebug_Mode)
								DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
								Print Secs2Time(DateTime, 3)+" "+strError_Message+"  Aborted from "+ICARTT_Return_Abort_Info(1, 2)+"."
								Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."  			//2022.12.05 KJZ replaced num2str with num2istr
							ELSE
								ICARTT_Error_Logger(strError_Message)
							ENDIF
						ENDIF
					ENDIF
							
					IF(!vGeneral_Format_Flag)
						Variable vNum_Digits, vMissing_Data_Indicator, vExponent, vLLOD_Indicator, vULOD_Indicator
						String strFlagged_Data=""
						
						IF(StringMatch(combinedFormatStr, "d*") || StringMatch(combinedFormatStr, "i*"))
							IF(vMin_value>=0 || numtype(vMin_Value)!=0)
								vNum_Digits=4		//2022.12.07 KJZ If the min is positive, then use -XXXX
							ELSE
								vNum_Digits=max(2+floor(log(abs(vMin_value)))	, 4)
							ENDIF
								
							strFlagged_Data=PadString("-", vNum_Digits+1, 0x58)			//0x58 is an uppercase X.  Use X so replacing is easier.
							
							vULOD_Indicator=str2num(PadString("-", vNum_Digits+1, 0x37))		//0x37 is 7
							vLLOD_Indicator=str2num(PadString("-", vNum_Digits+1, 0x38))		//0x38 is 8
							vMissing_Data_Indicator=str2num(PadString("-", vNum_Digits+1, 0x39))		//0x39 is 9
							
						ELSEIF(StringMatch(combinedFormatStr, "e*"))
							
							vNum_Digits=str2num(combinedFormatStr[1,strlen(combinedFormatStr)-1])			//In case the number of digits is greater than 9
							
							IF(vMin_Value>=0 || numtype(vMin_Value)!=0)
								vExponent=vNum_Digits
							ELSE
								vExponent=max(1+floor(log(abs(vMin_value))), 3)
							ENDIF
							
							strFlagged_Data=PadString("-X.", vNum_Digits+3, 0x58)+"e"+num2str(vExponent)
							
							vULOD_Indicator=str2num(PadString("-7.", vNum_Digits+3, 0x37))*10^(vExponent)
							vLLOD_Indicator=str2num(PadString("-8.", vNum_Digits+3, 0x38))*10^(vExponent)
							vMissing_Data_Indicator=str2num(PadString("-9.", vNum_Digits+3, 0x39))*10^(vExponent)
						
						ELSEIF(StringMatch(combinedFormatStr, "t*"))
							strFlagged_Data="-XXXX"		//2023.06.08 KJZ: Can't have LODs for time waves, but the NASA scanner complains if there aren't numbers
							vULOD_Indicator=-7777			//2023.06.08 KJZ: These shouldn't get used for time waves, but I'm going to keep this here in case something gets through
							vLLOD_Indicator=-8888								
							vMissing_Data_Indicator=-9999
							
						ELSE
							strError_Message="The format of "+NameofWave(Data_Wave)+" is not one of the allowed ones (decimal, integer, scientific, or time)."
							
							IF(kvDebug_Mode)
								DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
								Print Secs2Time(DateTime, 3)+" "+strError_Message+"  Aborted from "+ICARTT_Return_Abort_Info(1, 2)+"."
								Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."  			//2022.12.05 KJZ replaced num2str with num2istr
							ELSE
								ICARTT_Error_Logger(strError_Message)
							ENDIF
						ENDIF
						
						WaveListTextWaveMatrix[iColDex][3]=strFlagged_Data
					ENDIF
													
					IF(waveNumCol==0)	// 1D wave
						MatrixOp/O $"root:ICARTTFileFormat:Data:"+ nameOfWave(Data_Wave)=replaceNaNs(Data_Wave, vMissing_Data_Indicator)		//KJZ 2022.11.04 Removed the call to ChangeNans.  This is matrix aware and an order of magnitude faster than using ChangeNans or ? :.
						WAVE/Z DuplicatedWave=$"root:ICARTTFileFormat:Data:"+ nameOfWave(Data_Wave)	
						
						MatrixOp/O DuplicatedWave=Replace(DuplicatedWave, Inf, vULOD_Indicator)			//2023.06.01 KJZ Replace Inf and -Inf with ULOD and LLOD flags, requires the user to preflag their data
						MatrixOp/O DuplicatedWave=Replace(DuplicatedWave, -Inf, vLLOD_Indicator)
												
						WaveListTextWaveMatrix[iColDex][0] = combinedFormatStr
						WaveListTextWaveMatrix[iColDex][1] = NameofWave(Data_Wave) 	
						VariableNamesList+=NameofWave(Data_Wave) +";"
						
						IF((stringmatch(formatStr, "t")) || (stringmatch(formatStr, "8")))	// presumes there is no 2D wave with time/date info. Do when wave scaling is set to "dat" ("t") case, or when time format is specified ("8") in table.
							DuplicatedWave-=UTCDataStartVar
							WaveListTextWaveMatrix[iColDex][2]	= "seconds_past_midnight"
							
							SetScale d 0,0,"dat", DuplicatedWave			//2023.06.08 KJZ
							
							Redimension/N=(DimSize(wTime_Wave_Index, 0)+1) wTime_Wave_Index
							wTime_Wave_Index[DimSize(wTime_Wave_Index, 0)-1]=iColDex
							
							WaveListTextWaveMatrix[iColDex][4]="N/A"			//2022.12.06 KJZ Can't have LODs on time waves
							WaveListTextWaveMatrix[iColDex][5]="N/A"
							
						ELSE
//							WaveListTextWaveMatrix[iColDex][2]= selectString ( strlen(UnitsStr)>0 || strlen(WaveListTextWaveMatrix[p][2])>0,"EnterUnits", WaveListTextWaveMatrix[p][2] ) 
		
							IF(OldFormatPos>0)
								WaveListTextWaveMatrix[iColDex][2]=OLDWaveListTextWaveMatrix[OldFormatPos][2] 	// 2018.02 DTS mods for Pedro
								WaveListTextWaveMatrix[iColDex][4]=OLDWaveListTextWaveMatrix[OldFormatPos][4]		//2023.05.30 KJZ Use the old values for LODs if avaiable
								WaveListTextWaveMatrix[iColDex][5]=OLDWaveListTextWaveMatrix[OldFormatPos][5]
															
							ELSE
								WaveListTextWaveMatrix[iColDex][2]= selectString ( strlen(UnitsStr)>0, "EnterUnits", UnitsStr) // 2018.02 DTS mods for Pedro
								WaveListTextWaveMatrix[iColDex][4]="N/A"			//2022.12.06 KJZ Default is to not worry about LLOD and ULOD
								WaveListTextWaveMatrix[iColDex][5]="N/A"
							ENDIF
						ENDIF		//End checking to see if the format is time or not
						
					ELSE	// 2D wave with > one column
						MatrixOp/O/FREE Temp_2D_Wave=replaceNaNs(Data_Wave, vMissing_Data_Indicator)		//KJZ 2022.11.04 Removed the call to ChangeNans and changed how NaNs are scrubbed.  Now scrub NaNs from whole 2D way, then parse into 1D waves
						
						FOR(i2D_ColDex=0;i2D_ColDex<waveNumCol;i2D_ColDex+=1)
							MatrixOP/O  $"root:ICARTTFileFormat:Data:"+ nameOfWave(Data_Wave)+"_"+num2istr(i2D_ColDex) = col(Temp_2D_Wave,i2D_ColDex)			//2022.12.05 KJZ replaced num2str with num2istr
							WAVE DuplicatedWave = $"root:ICARTTFileFormat:Data:"+ nameOfWave(Data_Wave)+"_"+num2istr(i2D_ColDex)  
							
							WaveListTextWaveMatrix[iColDex+i2D_ColDex][0] = combinedFormatStr
							WaveListTextWaveMatrix[iColDex+i2D_ColDex][1] = NameofWave(Data_Wave) +"_"+num2istr(i2D_ColDex)				//2022.12.05 KJZ replaced num2str with num2istr
							VariableNamesList+=NameofWave(Data_Wave)+"_"+num2str(i2D_ColDex) +";"
//							WaveListTextWaveMatrix[iColDex+i2D_ColDex][2]= selectString ( strlen(UnitsStr)>0 || strlen(WaveListTextWaveMatrix[p][2])>0,"EnterUnits", WaveListTextWaveMatrix[p][2] ) 
							WaveListTextWaveMatrix[iColDex+i2D_ColDex][2]= selectString ( strlen(UnitsStr)>0, WaveListTextWaveMatrix[p][2] , UnitsStr) 
							WaveListTextWaveMatrix[iColDex+i2D_ColDex][2]= selectString ( strlen(WaveListTextWaveMatrix[p][2])>0,"EnterUnits", WaveListTextWaveMatrix[p][2] ) 		// DTS modified Jan 2017
						ENDFOR
				 		iColDex += waveNumCol-1 // (the for loop will add a one)
				 		
				 		WaveListTextWaveMatrix[iColDex][4]="N/A"			//2022.12.06 KJZ Can't have LODs on time waves
						WaveListTextWaveMatrix[iColDex][5]="N/A"			//ZZZ need to check this
				 		
					ENDIF					
				ENDIF		// first column (independent parameter) or data column
			ENDFOR		//end looping over the columns in the table
						
			if (itemsInLIst(VariableNamesList)+1 != numCols)
				IF(kvDebug_Mode)
					DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
				ENDIF
				Abort "Something went wrong with the parsing of the table.  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"!"
			endif
			
			IF(kvEnforce_Time_Names && cmpstr(WaveListTextWaveMatrix[0][1], "Time_Start")!=0)				//KJZ 2023.01.06 Makes sure the first time wave is Time_Start.  Can be disabled by flipping the value of the constant
				strError_Message="The name of the first time wave must be \"Time_Start\"  Change the constant kvEnforce_Time_Names to 0 if this offends you."
				IF(kvDebug_Mode)
					DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)		
					Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"!"
				ELSE
					ICARTT_Error_Logger(strError_Message)
				ENDIF
			ENDIF
			
			//KJZ 2022.11.29 Code to make sure that the precision on the time waves is sufficient that start time<mid time<stop time
			IF(numpnts(wTime_Wave_Index)>1)
				WAVE/Z Start_Time_Wave=$"root:ICARTTFileFormat:Data:"+WaveListTextWaveMatrix[0][1]
				
				String strStart_Time_Format=WaveListTextWaveMatrix[0][0]
				Variable vStart_Multiplier=10^(str2num(strStart_Time_Format[1,strlen(strStart_Time_Format)-1]))
				
				Make/O/D/FREE/N=(DimSize(Start_Time_Wave, 0)) wStart_Time_Wave_Format=round(Start_Time_Wave*vStart_Multiplier)/vStart_Multiplier
				
				IF(wTime_Wave_Index[1]!=1)
					strError_Message="Additional time waves must come after the first time wave!"
					IF(kvDebug_Mode)
						DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
						Abort strError_Message+"  Aborting from Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"."
					ELSE
						ICARTT_Error_Logger(strError_Message)
					ENDIF
				ENDIF
				
				WAVE/Z Stop_Time_Wave=$"root:ICARTTFileFormat:Data:"+WaveListTextWaveMatrix[1][1]
				String strStop_Time_Format=WaveListTextWaveMatrix[1][0]
				
				IF(kvEnforce_Time_Names && cmpstr(WaveListTextWaveMatrix[1][1], "Time_Stop")!=0)			//KJZ 2023.01.06 Makes sure the first time wave is Time_Start.  Can be disabled by flipping the value of the constant
					strError_Message="The second time wave name must be \"Time_Stop\"  Change the constant kvEnforce_Time_Names to 0 if this offends you."
					IF(kvDebug_Mode)
						DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
						Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"!"
					ELSE
						ICARTT_Error_Logger(strError_Message)
					ENDIF
				ENDIF
				
				IF(cmpstr(strStart_Time_Format, strStop_Time_Format)!=0)
					strError_Message="The time waves need to have the same precision!"
					IF(kvDebug_Mode)
						DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
						Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"!"
					ELSE
						ICARTT_Error_Logger(strError_Message)
					ENDIF
				ENDIF
				
				Variable vStop_Multiplier=10^(str2num(strStop_Time_Format[1,strlen(strStop_Time_Format)-1]))
				Make/O/D/FREE/N=(DimSize(Stop_Time_Wave, 0)) wStop_Time_Wave_Format=round(Stop_Time_Wave*vStop_Multiplier)/vStop_Multiplier
				
				Make/O/U/B/FREE/N=(DimSize(Stop_Time_Wave, 0)) wStart_GreaterEqual_Stop=wStart_Time_Wave_Format>=wStop_Time_Wave_Format
				IF(sum(wStart_GreaterEqual_Stop)>0)
					strError_Message="At least one start time is greater than the corresponding stop time.  Check the data OR increase the precision on the time waves!"
					IF(kvDebug_Mode)
						DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
						Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"!"
					ELSE
						ICARTT_Error_Logger(strError_Message)
					ENDIF
				ENDIF
				
				IF(numpnts(wTime_Wave_Index)>2)
					IF(wTime_Wave_Index[2]!=2)
						strError_Message="Additional time waves must come after the first time wave!"
						IF(kvDebug_Mode)
							DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
							Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"!"
						ELSE
							ICARTT_Error_Logger(strError_Message)
						ENDIF
					ENDIF
					
					IF(kvEnforce_Time_Names && cmpstr(WaveListTextWaveMatrix[2][1], "Time_Mid")!=0)			//KJZ 2023.01.06 Makes sure the first time wave is Time_Start.  Can be disabled by flipping the value of the constant
						strError_Message="The last time wave name must be \"Time_Mid\"  Change the constant kvEnforce_Time_Names to 0 if this offends you."
						IF(kvDebug_Mode)
							DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
							Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"!"
						ELSE
							ICARTT_Error_Logger(strError_Message)
						ENDIF
					ENDIF
					
					WAVE/Z Mid_Time_Wave=$"root:ICARTTFileFormat:Data:"+WaveListTextWaveMatrix[2][1]
					String strMid_Time_Format=WaveListTextWaveMatrix[2][0]
					
					IF(cmpstr(strMid_Time_Format, strStop_Time_Format)!=0)
						strError_Message="The time waves need to have the same precision!"
						IF(kvDebug_Mode)
							DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
							Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"!"
						ELSE
							ICARTT_Error_Logger(strError_Message)
						ENDIF
					ENDIF
					
					Variable vMid_Multiplier=10^(str2num(strMid_Time_Format[1,strlen(strMid_Time_Format)-1]))
					Make/O/D/FREE/N=(DimSize(Mid_Time_Wave, 0)) wMid_Time_Wave_Format=round(Mid_Time_Wave*vMid_Multiplier)/vMid_Multiplier
					
					Make/O/U/B/FREE/N=(DimSize(Mid_Time_Wave, 0)) wMid_GreaterEqual_Stop=wMid_Time_Wave_Format>=wStop_Time_Wave_Format
					IF(sum(wMid_GreaterEqual_Stop)>0)
						strError_Message="At least one mid time is greater than the corresponding stop time.  The order of the time waves MUST be START, STOP, MID!  Check the data OR increase the precision on the time waves!"
						IF(kvDebug_Mode)
							DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
							Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"!"
						ELSE
							ICARTT_Error_Logger(strError_Message)
						ENDIF
					ENDIF
					
					Make/O/U/B/FREE/N=(DimSize(Mid_Time_Wave, 0)) wStart_GreaterEqual_Mid=wStart_Time_Wave_Format>=wMid_Time_Wave_Format
					IF(sum(wStart_GreaterEqual_Mid)>0)
						strError_Message="At least one start time is greater than the corresponding mid time.  The order of the time waves MUST be START, STOP, MID!  Check the data OR increase the precision on the time waves!"
						IF(kvDebug_Mode)
							DisplayProcedure/W=$ICARTT_Return_Abort_Info(1,3)/L=(str2num(ICARTT_Return_Abort_Info(1,1))+2)
							Abort strError_Message+"  Aborting from "+ICARTT_Return_Abort_Info(1, 2)+"!"
						ELSE
							ICARTT_Error_Logger(strError_Message)
						ENDIF
					ENDIF
				ENDIF
			ENDIF
		
			NumVariablesVar=numCols-1		// don't include independent param
		
			SelWaveMatrix=2			// all cells are editable
			SelWaveMatrix[][1]=0		// make wave selection uneditable
			
			SetDimLabel 1,0,format, root:IcarttFileFormat:WaveListTextWaveMatrix
			SetDimLabel 1,1,wavename, root:IcarttFileFormat:WaveListTextWaveMatrix
			SetDimLabel 1,2,units, root:IcarttFileFormat:WaveListTextWaveMatrix								
			SetDimLabel 1,3,flag_format, root:IcarttFileFormat:WaveListTextWaveMatrix						//KJZ 2022.11.30 correcting the dimlabels to the ICARTT spec
			SetDimLabel 1,4,LLOD, root:IcarttFileFormat:WaveListTextWaveMatrix									//KJZ 2022.11.04 correcting the dimlabels to the ICARTT spec
			SetDimLabel 1,5,ULOD, root:IcarttFileFormat:WaveListTextWaveMatrix									//KJZ 2022.11.04 correcting the dimlabels to the ICARTT spec
			SetDimLabel 1,6,standard_name, root:IcarttFileFormat:WaveListTextWaveMatrix						//KJZ 2022.11.04 correcting the dimlabels to the ICARTT spec
			SetDimLabel 1,7,optional_long_description, root:IcarttFileFormat:WaveListTextWaveMatrix		//KJZ 2022.11.04 correcting the dimlabels to the ICARTT spec
		
			//1.12 addition by DTS
			SVAR FileNameStr =  root:ICARTTFileFormat:FileNameStr
			SVAR UTCDataStartStr =  root:ICARTTFileFormat:UTCDataStartStr
			string UTCNoSpace = ReplaceString(",",  ReplaceString(" ", UTCDataStartStr, ""), "")
			FileNameStr = ReplaceString(StringFromList(2,FileNameStr, "_" ),  FileNameStr, UTCNoSpace)
		
			ICARTT_Error_Notebook_Creator()
			

End

Function MoveWaveList2NewDF(WList,StartDF,EndDF)
	
	//Establish Function Parameters
	String WList
	DFREF StartDF, EndDF
	
	//Establish Local Parameters
	Variable i
	Variable nitems = itemsinlist(WList,";")
	
	
	//Loop to move
	For(i=0;i<nitems;i++)
		Wave TempWave = $Stringfromlist(i,WList,";")
		string wname = nameofwave(TempWave)
		Duplicate/O TempWave, EndDF:$wname
//		movewave StartDF:DupWave, EndDF
//		rename DupWave, $wname
	Endfor

End






















Function SplitWaveintoParts_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Doalert/T="Data Folder Check" 2, "Are you in the datafolder with the desired wave?"
			if(V_flag == 2 || V_Flag == 3) //If no or cancel clicked
				Abort "User Aborted."
			else
				//Do nothing
			endif
			V_Flag=0
			if(V_Flag==0)
			elseif(V_flag==1||V_Flag==2)
				Abort "User Aborted."
			endif
			string W_Str
			variable nParts
			prompt W_Str, "What is the wave that will be split?"
			prompt nParts, "How many parts should this wave be split into?"
			doprompt "Please enter the following.", W_Str, nParts
			if(V_Flag==1)
				Abort "User Aborted."
			endif
			wave W = $W_Str
			SplitWavesIntoParts(W, nParts)
		case 2:
			break
		endswitch
end


//2025/06/19 SplitWavesIntoParts: Takes a wave (designed for PBP data) and split in into equal parts so calcualtions can be done quicker (user will then concatenate wave later on)
Function SplitWavesIntoParts(W, nParts)

	//Establish Function Parameters
	wave W
	variable nParts
	
	//Establish Local Parameters
	variable npnts = dimsize(W,0)
	variable i
	Variable SplitNumbers = floor(npnts/nParts)
	Variable extraPnts = 0
	if(mod(nPnts,nParts)==0)	//If we have an even number do nothing as we can split the waves evenly
	elseif(mod(nPnts,nParts)!=0)
		extraPnts = mod(nPnts,nParts)	//We will add these "extra" points to the first wave
	endif
	
	//Make the waves
	string BaseWname = nameofwave(w)
	string tempWname = ""
	variable rangelow = 0
	variable rangehigh
	
	for(i=0;i<nParts;i++)
		tempWname = BaseWName+"_"+num2str(i)//+";"
		if(i==0)	//Add these first extra points here (if no extra points then it adds zero)
			rangehigh = (SplitNumbers+extraPnts)-1 //-1 = number of points to range offset
			Duplicate/o/d/R=[i,rangehigh] W,$tempWname
		elseif(i!=0)
			Duplicate/o/d/R=[rangelow,rangehigh] W,$tempWname
		endif
		//Update Ranges
		rangelow = ((i+1)*Splitnumbers)
		rangehigh = ((i+2)*Splitnumbers)-1 //-1 = number of points to range offset
		variable test = rangehigh-rangelow
	endfor
	
	

End




Function DMob2DAero_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Doalert/T="Data Folder Check" 2, "Are you in the datafolder with the desired wave?"
			if(V_flag == 2 || V_Flag == 3) //If no or cancel clicked
				Abort "User Aborted."
			else
				//Do nothing
			endif
			V_Flag=0
			if(V_Flag==0)
			elseif(V_flag==1||V_Flag==2)
				Abort "User Aborted."
			endif
			string Dmob_str, SIPrefix
			variable pRho, Chi
			prompt Dmob_str, "What is the wave containing the electrical mobility diameters (DMob)?"
			prompt pRho, "What is the denisty to use? (kg/m3)"
			prompt Chi, "What particle diameter shape factor should be used?"
			prompt SIPrefix, "What SI Prefix goes with the inputted units. See the following options: q;r;y;z;a;f;o;n;u;m;c;d;base;da;h;k;M;G;T;P;E;Z;Y;R;Q. Base indicates no prefix (i.e. meters, grams etc)" 
			doprompt "Please enter the following.", Dmob_str, pRho, Chi, SIPrefix
			if(V_Flag==1)
				Abort "User Aborted."
			endif
			wave W_DMob = $Dmob_str
			DMob2DAero(W_DMob, pRho, Chi,SIPrefix)
		case 2:
			break
		endswitch
end


Function DMob2DAero(W_DMob, pRho, Chi,SIPrefix)

	//Establish Function Parameters
	Wave w_DMob
	Variable pRho, Chi 
	string SIPrefix
	
	//Establish Local Parameters
	Variable StdRho = 1000 //kg m-3
	Variable nrows = dimsize(w_DMob,0)
	variable i
	Variable CcDMob, CcDA
	
	variable diam_mob
	variable Chi_C = Chi
	variable Chi_FM = Chi
	variable rho_p = pRho
	
	//Establish loop to calculate Aerodynamic Diameter (also establish the wave to write too)
	String DupName = nameofwave(w_DMob)+"_DAero"
	duplicate/O w_DMob, $DupName
	duplicate/O/FREE w_DMob, w_Dmiddle
	wave W_DAero = $DupName
	
	For(i=0;i<nrows;i++)
		diam_mob = W_DMob[i]
		w_Dmiddle[i] = DiamMob_to_DiamVolumEqAJD(diam_mob, Chi_C, Chi_FM)
		variable diam_ve = w_DMiddle[i]
		w_DAero[i] = DiamVolumeEq_to_DiamAerodynamicAJD(diam_ve, Chi_C, Chi_FM, rho_p)
//		variable D_x = w_DMob[i]
//		variable Dv = UnitAdjust(SIPrefix,"base",w_DMob[i])
//		CcDMob = CunninghamSlipCorrectionFactor(D_x, SIPrefix)
//		CcDa = CunninghamSlipCorrectionFactor(Dv, "base")	//The equations work out to where we have to solve for Dae but need it to solve for CcDa (this only applies for small particles as we need to apply the slip correction for them (less than 1 um)
//		//Equation Daero = Dmob/Sqrt(Chi*[(CC(Da)/CC(DMob))]*(rhostd/rhoparticle))
//		variable Part1 = Chi
//		variable Part2 = (CcDa/CcDmob)
//		variable Part3 = (StdRho/pRho)
//		Variable FinalPart = Sqrt(Part1*Part2*Part3)
//		variable Daero_Guess1 = D_x/FinalPart
////		CcDa = CunninghamSlipCorrectionFactor(Daero_Guess1, "base")
////		variable N1 = CcDMob*pRho
////		variable D1 = CcDa*Chi*StdRho
////		variable Daero_Guess2 = Dv*(sqrt(N1/D1))
//		//Guess 2 is my way of getting my head wrapped around it but the difference at 722 nm for guess 1 and guess 2 is less than 10 nm so just going with literature way
//		W_DAero[i] = Daero_Guess1
		
	EndFor
		
	//Dmob = DAero/Sqrt(deff) -> from Scanning Mobility Particle Sizer (SMPS)Aerodynamic Particle Sizer (APS) Merged Size Distribution (mergedsmpsaps) Value-Added Product Report 
	//Thus DAero = Dmob* Sqrt(deff)
	
	//From An Algorithm for Combining Electrical Mobility and Aerodynamic Size Distributions Data when Measuring Ambient Aerosol
	//Dmob = DAero * Sqrt(Chi*[(CC(Da)/CC(DMob))]*(rhostd/rhoparticle)): seems like a flushed out version of the above equation
	//Thus, Daero = Dmob/Sqrt(Chi*[(CC(Da)/CC(DMob))]*(rhostd/rhoparticle))
End

function DiamMob_to_DiamVolumEqAJD(diam_mob, Chi_C, Chi_FM [, TC, pressure, precision])
	//This function calculates the volume equivalent diameter from the mobility diameter
	//return value: volume equivalent diameter [nm]
	//martin.gysel@psi.ch; 09/10/2016; tested
	variable diam_mob	//mobility diameter [nm]
	variable Chi_C		//continuum regime shape factor [-]
	variable Chi_FM		//free molecular regime shape factor [-]
	variable TC			//optional temperature in °C
						//default: 20°C
	variable pressure		//optional pressure in mbar
						//default: 1013 mbar
	variable precision		//abort criterion for iterative solver (relative change of mobility diameter in the last iteration step)						
						//default: 1e-6

	//set defaults
	if (paramisdefault(TC))
		TC=20	
	endif					
	if (paramisdefault(pressure))
		pressure=1013
	endif
	if (paramisdefault(precision))
		precision=1e-6
	endif
	//shape factor and mean free path
	variable lambda=MeanFreePathBaron4_6AJD(TC, pressure)
	//iterate to find volume equivalent diameter
	variable niter, Cc_dve, diam_ve
	variable Cc_dmob=CunninghamSlipCorrKim2005AJD(Lambda, diam_mob)
	variable chi=ShapeFactorSizeDependenceAJD(Chi_C, Chi_FM, diam_mob, TC=TC, pressure=pressure)	//initial guess (use mobility diameter instead of volume equivalent diameter)
	variable prev_diam_ve=diam_mob/chi		//initial guess (ignore slip correction)
	do
		//update solution
		Cc_dve=CunninghamSlipCorrKim2005AJD(Lambda,prev_diam_ve)
		chi=ShapeFactorSizeDependenceAJD(Chi_C, Chi_FM, prev_diam_ve, TC=TC, pressure=pressure)
		diam_ve=diam_mob/chi*Cc_dve/Cc_dmob
		//test the result
		if (abs((diam_ve-prev_diam_ve)/(prev_diam_ve))<precision)
			//target precision reached => leave the loop
			break
		endif
		prev_diam_ve=diam_ve
	while (1)
	//finish procedure
	return diam_ve
end


Function VED2DAero_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Doalert/T="Data Folder Check" 2, "Are you in the datafolder with the desired wave?"
			if(V_flag == 2 || V_Flag == 3) //If no or cancel clicked
				Abort "User Aborted."
			else
				//Do nothing
			endif
			V_Flag=0
			if(V_Flag==0)
			elseif(V_flag==1||V_Flag==2)
				Abort "User Aborted."
			endif
			string VED_str, SIPrefix
			variable pRho, Chi
			prompt VED_str, "What is the wave containing the volume equivalent diameters (VED)?"
			prompt pRho, "What is the denisty to use? (kg/m3)"
			prompt Chi, "What particle diameter shape factor should be used?"
			prompt SIPrefix, "What SI Prefix goes with the inputted units. See the following options: q;r;y;z;a;f;o;n;u;m;c;d;base;da;h;k;M;G;T;P;E;Z;Y;R;Q. Base indicates no prefix (i.e. meters, grams etc)" 
			doprompt "Please enter the following.", VED_str, pRho, Chi, SIPrefix
			if(V_Flag==1)
				Abort "User Aborted."
			endif
			wave W_VED = $VED_Str
			VED2DAero(W_VED, pRho, Chi, SIPrefix)
		case 2:
			break
		endswitch
end

function DiamVolumeEq_to_DiamAerodynamicAJD(diam_ve, Chi_C, Chi_FM, rho_p [, TC, pressure, precision])
	//This function calculates the aerodynamic diameter from the volume equivalent diameter
	//return value: aerodynamic diameter [nm]
	//martin.gysel@psi.ch; 09/10/2016; tested
	variable diam_ve	//volume equivalent diameter [nm]
	variable Chi_C	//continuum regime shape factor [-]
	variable Chi_FM	//free molecular regime shape factor [-]
	variable rho_p	//density of the particle [kg/m³]
	variable TC		//optional temperature in °C
					//default: 20°C
	variable pressure	//optional pressure in mbar
					//default: 1013 mbar
	variable precision	//abort criterion for iterative solver (relative change of mobility diameter in the last iteration step)						
					//default: 1e-6

	//set defaults
	if (paramisdefault(TC))
		TC=20	
	endif					
	if (paramisdefault(pressure))
		pressure=1013
	endif
	if (paramisdefault(precision))
		precision=1e-6
	endif
	//reference particle properties
	variable chi_ref=1		//"sphere"
	variable rho_ref=1000	//kg/m3  "density of water"
	//shape factor and mean free path
	variable chi=ShapeFactorSizeDependenceAJD(Chi_C, Chi_FM, diam_ve, TC=TC, pressure=pressure)
	variable lambda=MeanFreePathBaron4_6AJD(TC, pressure)
	//iterate to find mobility diameter
	variable niter, Cc_daero, diam_aero
	variable Cc_dve=CunninghamSlipCorrKim2005AJD(Lambda,diam_ve)
	variable prev_diam_aero=diam_ve*sqrt(rho_p/rho_ref*chi_ref/chi)		//initial guess (ignore slip correction)
	do
		//update solution
		Cc_daero=CunninghamSlipCorrKim2005AJD(Lambda,prev_diam_aero)
		diam_aero=diam_ve*sqrt(rho_p/rho_ref*chi_ref/chi*Cc_dve/Cc_daero)
		//test the result
		if (abs((diam_aero-prev_diam_aero)/(prev_diam_aero))<precision)
			//target precision reached => leave the loop
			break
		endif
		prev_diam_aero=diam_aero
	while (1)
	//finish procedure
	return diam_aero
end


function CunninghamSlipCorrKim2005AJD(Lambda,Diam)
	//This function calculates the Cunningham slip correction factor for solid particles as a function of the mean free path of the air molecules.
	//Note: This parametrisation might be used by TSI for the SMPS evaluation in programs later than 2005.
	//Note: Before the parametrisation by Allan and Raabe (1985) has been used by TSI
	//Source: Kim, J.H., G.W. Mulholland, S.R. Kukuck, and D.Y.H. Pui (2005).
	//Slip correction measurements of certified PSL nanoparticles using a nanometer
	//differential mobility analyzer (nano-DMA) for Knudsen number from 0.5 to 83,
	//J. Res. Natl. Inst. Stand. Technol., 110, 31-54.
	//martin.gysel@psi.ch, 31.10.2005
	variable Lambda	//mean free path of the air molecules, [nm]
	variable Diam		//particle diameter, [nm]
	
	Diam*=1e-9		//convert from [nm] to [m]
	Lambda*=1e-9	//convert from [nm] to [m]
	
	variable Kn=2*lambda/diam
	variable a=1.165
	variable b=0.483
	variable g=0.997
	variable Cc
	Cc=1+Kn*(a+b*exp(-g/Kn))
	return Cc
end

function MeanFreePathBaron4_6AJD(T,press [, GasType])
	//This function calculates the mean free path (units: [nm]) of gas molecules as a function of temperature and pressure.
	//Source: Baron&Willeke, 2001, eq. 4-6, p.65
	//martin.gysel@psi.ch; 17/08/2005; 24/05/2016
	variable T	//temperature, [°C]
	variable press	//pressure, [mbar=hectopascal]
	variable GasType	//0: air		//default
					//1: O2		//likely not yet implemented; see sub-procedure
					//2: N2		//likely not yet implemented; see sub-procedure
					//3: Argon	//implemented
					//4: Helium	//likely not yet implemented; see sub-procedure
					//5: CO2		//likely not yet implemented; see sub-procedure
					//6: CO		//likely not yet implemented; see sub-procedure
	//set defaults
	if(paramisdefault(GasType))
		GasType=0
	endif
	//unit conversion	
	T-=-273.15	//convert [°C] to [K]
	//gas specific settings
	variable Lref,S,Tref,pref
	switch(GasType)
		case 0:		
			//air
			Lref=66.4		//reference lambda at NTP (20 °C, 1013 mbar)
							//note: TSI uses 66.5 at NTP
			S=110.4			//Sutherland constant
			Tref=293.15		//reference temperature [K]
			pref=1013		//reference pressure [mbar]
			break	
		case 3:		
			//argon
			Lref=69.4		//reference lambda at NTP (20 °C, 1013 mbar)
			S=141.4			//Sutherland constant
			Tref=293.15		//reference temperature [K]
			pref=1013		//reference pressure [mbar]
			break
		default:		
			//GasType not yet implemented
				string /g RTStackInfo=GetRTStackInfo(0)		//write stackinfo into global variable in current data folder
				string currproc=laststringfromlistAJD(RTStackInfo)	//name of current procedure
				string message								//reserve string for abort message
				message="Undefined value of the parameter 'GasType' handed over to the function "+currproc+"!"
				print message; print RTStackInfo; abort message			
	endswitch
	//calculate mean free path
	variable Lambda=Lref*(pref/press)*(T/Tref)*(1+S/Tref)/(1+S/T)
	return Lambda
end


Threadsafe function /S LastStringFromListAJD(ListStr [,ListSepStr])
	//this function returns the last string contained in a string list
	//martin.gysel@psi.ch; 15/06/2005; tested
	String ListStr		//string containing list
	String ListSepStr	//optional string containing the list separator string
					//default: ";"
	
	if (paramisdefault(ListSepStr))
		ListSepStr=";"
	else
		ListSepStr=ListSepStr[0]
	endif
	return stringfromlist(ItemsInList(ListStr, ListSepStr)-1, ListStr, ListSepStr)
end




//AJD 4/21/25: Take Volume Equivalent Diameter (VED) and change to Aerodynamic Diameter
Function VED2DAero(W_VED, pRho, Chi, SIPrefix)

	//Establish Function Parameters
	Wave W_VED
	Variable pRho, Chi
	String SIPrefix
	
	//set up global variable for progress bar
	DFREF CurrDF = GetdatafolderDFR()
	setdatafolder root:
	variable/G PercentFinished = 0
	setdatafolder currDF
	
	//make progress panel and timer as this can take a while with PBP data
	execute/Q/Z "pnlProgress()"
	stopalltimers()
	variable Timer = startMSTimer
	
	//Establish Local Parameters
	Variable StdRho = 1000 //kg m-3
	Variable nrows = dimsize(W_VED,0)
	variable i
	Variable CcDv, CcDA
	variable precision = 1e-6
	variable prev_diam_aero
	
	variable diam_ve
	variable Chi_C = 1
	variable Chi_FM = 1
	variable rho_p = pRho
//	variable TC = 20
//	Variable pressure = 1013
	
	//Establish loop to calculate Aerodynamic Diameter (also establish the wave to write too)
	String DupName = nameofwave(W_VED)+"_DAero"
	duplicate/O W_VED, $DupName
	wave W_DAero = $DupName
	
	For(i=0;i<nrows;i++)
		diam_ve = W_VED[i]
		if(numtype(diam_ve)==2)
			continue
		elseif(numtype(diam_ve)==0)
			w_DAero[i] = DiamVolumeEq_to_DiamAerodynamicAJD(diam_ve, Chi_C, Chi_FM, rho_p)
		endif
	
//		variable D_x = W_VED[i]
//		variable Dv = UnitAdjust(SIPrefix,"base",W_VED[i])
//		CcDv = CunninghamSlipCorrectionFactor(Dv, "base")
//		CcDa = CunninghamSlipCorrectionFactor(Dv, "base")	//The equations work out to where we have to solve for Dae but need it to solve for CcDa (this only applies for small particles as we need to apply the slip correction for them (less than 1 um)
//		//Equation Da = Dv*Sqrt(CcDv*pRho/CcDa*Chi*StdRho))
//		variable N = CcDv*pRho
//		variable D = CcDa*Chi*StdRho
//		variable Daero_Guess1 = Dv*(sqrt(N/D))
//		CcDa = CunninghamSlipCorrectionFactor(Daero_Guess1, "base")
//		prev_diam_aero = Daero_guess1
//		//Now that we have an inital guess update until our precision is satisfied
//		do	
//			ccDa = CunninghamSlipCorrectionFactor(prev_diam_aero, "base")
//			variable N1 = CcDv*pRho
//			variable D1 = CcDa*Chi*StdRho
//			variable Daero_Guess2 = Dv*(sqrt(N1/D1))
//			if(abs((Daero_Guess2-prev_diam_aero)/(prev_diam_aero))<precision)
//				break
//			endif
//			prev_diam_aero = Daero_Guess2
//			//Guess 2 is my way of getting my head wrapped around it but the difference at 722 nm for guess 1 and guess 2 is less than 10 nm so just going with literature way
//			W_DAero[i] = UnitAdjust("base","n",Daero_Guess2)
			NVAR root:PercentFinished = ((i+1)/nrows)*100
			doupdate/E=1/W=pnlProgress/SPIN=60
//		While(1)
		
	EndFor
	Timer = StopMSTimer(0)
	variable ElapsedTime = Timer/1E6/60
	doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."

End


function ShapeFactorSizeDependenceAJD(chiC, chiFM, Dve [, TC, pressure]) 
	//this function calculates the size dependent shape factor chi(Dve)
	//source: Biskos et al., 2005, submitted to GRL
	//martin.gysel@psi.ch; 09.12.2005
	variable chiC			//dynamic shape factor in the continuum regime (1.08 for cube)
	variable chiFM		//dynamic shape factor in the free molecular regime (1.24 for cube)
	variable Dve			//volume equivalent particle diameter in nm
	variable TC			//optional temperature in °C
						//default: 20°C
	variable pressure		//optional pressure in mbar
						//default: 1013 mbar
						
	//set defaults
	if (paramisdefault(TC))
		TC=20	
	endif					
	if (paramisdefault(pressure))
		pressure=1013
	endif
	variable lambda=MeanFreePathBaron4_6AJD(TC, pressure)
	variable CcDve=CunninghamSlipCorrBaron4_8AJD(lambda,Dve)
	variable CcDcorr=CunninghamSlipCorrBaron4_8AJD(lambda,chiFM/chiC*Dve)
	variable chiDve=chiC*CcDve/CcDcorr
	return chiDve	
end

function CunninghamSlipCorrBaron4_8AJD(Lambda,Diam)
	//This function calculates the Cunningham slip correction factor for solid particles as a function of the mean free path of the air molecules.
	//slightly different parameter for oil droplets
	//Source: Baron, 2001, eq. 4-8, p. 66
	//Note: That is the parametrisation that I use for the SMPS inversion.
	//martin.gysel@psi.ch, 17.08.2005
	variable Lambda	//mean free path of the air molecules, [nm]
	variable Diam		//particle diameter, [nm]
	
	Diam*=1e-9		//convert from [nm] to [m]
	Lambda*=1e-9	//convert from [nm] to [m]
	
	variable Kn=2*lambda/diam
	variable a=1.142
	variable b=0.558
	variable g=0.999
	variable Cc
	Cc=1+Kn*(a+b*exp(-g/Kn))
	return Cc
end

//Supporting function (designed for 'VED2DAero'); outputs the Cc for a particular diameter
Function/D CunninghamSlipCorrectionFactor(D_x, units)

	//Establish Function Parameters
	variable D_x	//Diameter in inputted units
	string units //What inputted diameters units are (um, nm)
	//Establish Local Parameters
	variable A = 1.257, B = 0.4, G = 1.1, L = 6.5E-8	//Alpha, Beta, and Gamma are experimental coefficients (from Cunningham, 1910; Seinfeld and Pandis, 2006)
	//D represent particle diameter; L (Lambda) represents the mean free path of the surrounding gas
	
	//Find what units the string is in
	variable D_m = UnitAdjust(units,"base",D_x)

	//Formula: Cc(D) = 1 + (2*L)/(D) * [A+Be(-G*D/L)]
	//Idea: The Cunningham slip correction factor, Cc, is used to account for non–continuum effects when calculating the drag force on small particles. Cc is a function of D
	Variable Cc 
	Cc = 1 + (2*L)/(D_m)*(A+B*exp(-(G*D_m)/(L)))
	return Cc
	
End

//Supporting function (designed for 'VED2DAero'); matches a string to a string in a list
Function/S MatchString2List(StrList,Designated_Str)

	//Establish Function Parameters
	String StrList, Designated_Str
	
	//Establish Local Parameters
	Variable i
	Variable nListString = itemsinList(StrList, ";")
	
	
	//Establish Loop
	For(i=0;i<nListString;i++)
		string currStr = stringfromlist(i,StrList,";")
		if(stringmatch(Designated_Str,currStr)==0)
		elseif(stringmatch(Designated_Str,currStr)==1)
			Return currStr
		endif
		
	Endfor

End

//Supporting Function (designed for 'VED2DAero'); provided a unit perform a calculation that will convert inputted units to desired units
Function/D UnitAdjust(u_in,u_desired,n_in)

	//Establish Function Parameters
	string u_in, u_desired
	variable n_in
	
	//Establish local parameters
	string unitslist = "q;r;y;z;a;f;o;n;u;m;c;d;base;da;h;k;M;G;T;P;E;Z;Y;R;Q"
	variable nUnits = itemsinList(unitslist,";")
	string converstionlist = "E-30;E-27;E-24;E-21;E-18;E-15;E-12;E-9;E-6;E-3;E-2;E-1;E0;E1;E2;E3;E6;E9;E12;E15;E18;E21;E24;E27;E30"
	string base = "1"
	string Conversion_ID_have, Conversion_ID_want
	Variable Conversion_Idx_have, Conversion_Idx_want
	string Operate = Base
	variable Convert 
	Variable n_out
	
	//Idea: use string match to take any units provided by user and determine their position in the list to identify what math should be applied
	Conversion_ID_have = MatchString2List(unitslist,u_in)
	Conversion_ID_want = MatchString2List(unitslist,u_desired)
	Conversion_Idx_have = WhichListItem(Conversion_ID_have, unitslist,";")
	Conversion_Idx_want = WhichListItem(Conversion_ID_want, unitslist,";")
	//Begin section for breakpoint analysis
	variable temp0 = str2num(Base+stringfromList(Conversion_Idx_want,converstionlist,";"))
	variable temp1 = str2num(Base+stringfromList(Conversion_Idx_have,converstionlist,";"))
	//End section for breakpoint analysis
	Convert = str2num(Base+stringfromList(Conversion_Idx_have,converstionlist,";"))/str2num(Base+stringfromList(Conversion_Idx_want,converstionlist,";"))
//	Operate += stringfromList(Conversion_Idx,converstionlist,";")
	n_out = n_in*Convert
	return n_out
	
End



//Supporting Function: progress panel
Window pnlProgress() : Panel
    PauseUpdate; Silent 1       // building window...
    NewPanel /W=(267,122,480,236) as "Progress"
    SetDrawLayer UserBack
    SetDrawEnv fsize= 16
    DrawText 74,23,"Progress:"
    ValDisplay valdispProgress,pos={8,28},size={200,45},frame=4
    ValDisplay valdispProgress,limits={0,100,0},barmisc={10,1},bodyWidth= 200
    ValDisplay valdispProgress,value= #"root:percentFinished"
    Button buttonAbort,pos={73,78},size={70,30},proc=Button_Abort,title="Abort"
    Button buttonAbort,fSize=14
End
 
Function Button_Abort(ba) : ButtonControl
    STRUCT WMButtonAction &ba
    switch( ba.eventCode )
        case 2: // mouse up
            Abort "The user has aborted"
            killwindow/Z pnlProgress
            break
    endswitch
    return 0
End





//1/6/25 AJD Make increasing monotonic wave
//Used to take a given wave and create an increasing monotonic wave wave off of it
	Function MakeMonoWave_butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Doalert/T="Data Folder Check" 2, "Are you in the datafolder with the desired wave?"
			if(V_flag == 2 || V_Flag == 3) //If no or cancel clicked
				Abort "User Aborted."
			else
				//Do nothing
			endif
			V_Flag=0
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			string w_str
			variable w_numb
			prompt w_str, "What is the identifying string to find the wave?"
			prompt w_numb, "How many points do you want this wave to be (should match up with either the rows or columns of the 2D wave)?"
			doprompt "Please enter the following.", w_str, w_numb
			if(V_Flag==1)
				Abort "User Aborted."
			endif
			string w_help = "*"+w_str+"*"
			string w_list = wavelist(w_help,";", "TEXT:0")
			wave w = $stringfromlist(0,w_list,";")
			string dupname = nameofwave(w)+"_Mono"
			Duplicate/O $stringfromlist(0,w_list,";"), $dupname
			Wave Bdr_Wave = $dupname
			MakeMonoWave(w,Bdr_Wave, w_numb)
		case 2:
			break
		endswitch
end


Function MakeMonoWave(w,Bdr_Wave,w_numb)
	//Establish Function Parameters
	wave w, Bdr_Wave
	variable w_numb
	
	Redimension/N=(w_numb) Bdr_Wave
	
	//Establish Variables
	variable npnts = dimsize(w,0)
	variable npnts_bdr = dimsize(Bdr_Wave,0)
	variable wMax = wavemax(w)
	variable wMin = wavemin(w)
	variable i
	
	//Determine spacing
	variable interval = (wMax-wMin)/w_numb
	
	//Create wave
	Bdr_Wave = NaN
	for(i=0;i<npnts_bdr;i++)
		Bdr_Wave[i] = wMin+(i*interval)
	endfor

End


//Button for the ICARTT Table
Function Integrated_Signal_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the data folder with the waves of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2||V_Flag==3)
				abort "Not in the correct Data Folder. Aborting procedure."
			endif
			String wavelist_Str = ""
			prompt wavelist_Str, "What is the identifier of the wavelist you want to use?"
			doprompt "Please Enter the following infomation.", wavelist_Str
			if(V_Flag==1)
				abort "User Aborted."
			else
			endif
			Integrated_Signal(wavelist_Str)
		case 2:
			break
		endswitch
end


//Button for integrated signal code
Function MakeICARTT_Table_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the data folder with the ICARTT named waves?"
			if(V_flag==1)
			elseif(V_Flag==2||V_Flag==3)
				abort "Not in the correct Data Folder. Aborting procedure."
			endif
			string typeStr = ""
			prompt typeStr, "Is this ACSM, SP2 or SMPS data? Type 'ACSM', 'SP2', or 'SMPS' to select."
			Doprompt "Please enter the following.", TypeStr
			if(V_Flag==1)
				Abort "User cancelled."
			else
				MakeICARTT_Table(TypeStr)
			Endif
		case 2:
			break
		endswitch
end


Function MakeICARTT_Table(TypeStr)

	//Establish Function Parameters
	string TypeStr

	//Establish Connection to the AdamToolkit Data folder
	DFREF StartDF = getdataFolderDFR()
	setdatafolder root:AdamToolkit
	DFREF AJDDF = getdatafolderDFR()
	setdatafolder StartDF
	
	
	//Grab the list of ICARTT date named waves
	setdatafolder AJDDF
	string/G ICARTT_wNames_Time, ICARTT_wNames_BC, ICARTT_wNames_ACSM, ICARTT_wNames_SMPS, ICARTT_Notes_LII
	setdatafolder StartDF
	
	//Determine what type of data that needs to be accessed. 
	string DataList = "ACSM;SP2;SMPS"
	variable i, j
	variable DataType = 3
	variable nDatapnts = itemsinlist(DataList,";")
	for(i=0;i<nDatapnts;i++)
		if(stringmatch(TypeStr,(stringfromlist(i,DataList,";")))==1)
		//If the string matches then proceed with the rest of the code with the desired data type
			DataType = i	//0-> ACSM;1 -> SP2;2-> SMPS; 3 -> bad data type
			break
		else
		endif
	endfor
		if(DataType == 3) //if the input is mistaked
			Abort "Error, type of data not recodnized."
		endif
	
	//Set up table
	string Graphname = ""
	String DataListWaves = ""
	variable nWavesinDataList
	String TimeListWaves = ICARTT_wNames_Time
	switch(DataType)
		case 0:	//ACSM data
			GraphName = "ACSM_ICARTT"
			DataListWaves = ICARTT_wNames_ACSM
			nWavesinDataList = itemsinlist(DataListWaves,";")
			break
		case 1:	//SP2 data
			GraphName = "SP2_ICARTT"
			DataListWaves = ICARTT_wNames_BC
			nWavesinDataList = itemsinlist(DataListWaves,";")
			break
		case 2:	//SMPS data
			GraphName = "SMPS_ICARTT"
			DataListWaves = ICARTT_wNames_SMPS
			nWavesinDataList = itemsinlist(DataListWaves,";")
			break
		default:	//Bad data
			abort "Data type error."
			break
	endswitch
	
	//Create and append time waves to table
	Edit/N=$GraphName
	Dowindow/T $GraphName, GraphName
	string TimewList2Append = ""
	string TimewListinFolder = wavelist("*", ";","TEXT:0")
	variable nTimeWavesinFolder = itemsinlist(TimewListinFolder,";") 
	for(i=0;i<nWavesinDataList;i++)
		string currWave = stringfromlist(i,TimeListWaves,";")
		for(j=0;j<nTimeWavesinFolder;j++)
			if(stringmatch(currWave,(stringfromlist(j,TimewListinFolder,";")))==1)
			//If we match waves
				Wave Tempwave = $currWave
				Appendtotable/W=$GraphName TempWave
				ModifyTable/W=$GraphName digits(TempWave)=2
			else
			//we don't match waves; do nothing and continue
			Endif	
		Endfor
	endfor
	
	//Get list of waves and append them to table
	string wList2Append = ""
	string wListinFolder = wavelist("*", ";","TEXT:0")
	variable nWavesinFolder = itemsinlist(wListinFolder,";") 
	for(i=0;i<nWavesinDataList;i++)
		currWave = stringfromlist(i,DataListWaves,";")
		for(j=0;j<nWavesinFolder;j++)
			if(stringmatch(currWave,(stringfromlist(j,wListinFolder,";")))==1)
			//If we match waves
				Wave Tempwave = $currWave
				Appendtotable/W=$GraphName TempWave
				ModifyTable/W=$GraphName format(TempWave)=3, digits(TempWave)=1
			else
			//we don't match waves; do nothing and continue
			Endif	
		Endfor
	endfor

End






//AJD 4/10/25
//This function will find the % contribution through the integrated signal method
//This is a method that is representative when wavelengths are not equal

Function Integrated_Signal(wavelist_Str)

	//Establish Function Parameters
	string Wavelist_str
	
	//Establish Local Parameters
	string Wavelist_helper = "*"+Wavelist_str+"*"
	String Sigwavelist = wavelist(wavelist_Helper, ";", "TEXT:0")
	variable nwaves = itemsinlist(Sigwavelist,";")
	Make/o/d/n=(nwaves)/Wave WaveofWaveRefs
	WaveofWaveRefs = listtowaveRefWave(SigWaveList,0)
	variable i = 0
	
	//Establish output waves
	Make/o/d/n=(1) Integrated_Signal_Total = 0
	Make/o/d/n=(nwaves) Integrated_Signal_Components = NaN
	Make/o/d/n=(nwaves) Integrated_Signal_PercentContribution = NaN
	Make/o/T/n=(nwaves) Integrated_Signal_WaveNames
	Wave/T WaveofWaveNames = Integrated_Signal_WaveNames
	
	//Establish Wave names
	for(i=0;i<nwaves;i++)
		WaveofWaveNames[i] = stringfromlist(i,Sigwavelist,";")
	endfor
	
	//Initate a loop that calculates all summed signals
	for(i=0;i<nwaves;i++)
		//Establish what wave we will be using for this loop
		wave CurrWave = $stringfromlist(i,SigWaveList,";")
		//Determine total signal
		Wavestats/Q CurrWave
		Integrated_Signal_Components[i] = V_Sum
		KillWaves/Z M_WaveStats
		Integrated_Signal_Total[0] += V_Sum
	endfor	
	
	//Initate a loop that determines the percent contirbution from the integrated signal calculation
	for(i=0;i<nwaves;i++)
		Integrated_Signal_PercentContribution[i]=(Integrated_Signal_Components[i]/Integrated_Signal_Total[0])*100
	Endfor
	
	killwaves/Z WaveofWaveRefs	
	
	Edit/N=Inegrated_Signal_Table
	appendtotable WaveofWaveNames, Integrated_Signal_PercentContribution, Integrated_Signal_Components, Integrated_Signal_Total
	
End


//4/10/25 Supporting function: make a wave of wave references
function/Wave WaveofWavesReferences(nwaves, wList)

	//Establish Function parameters
	variable nwaves
	string wList
	
	//Establish Local Parameters
	Make/O/D/Free/N=(nwaves)/Wave WaveofWaveRefs 
	variable i, npnts
	
	//Start a loop and impliment tysons 'wave of waves' recommendation
	for(i=0;i<nwaves;i++)
		string tempWname = stringfromlist(i,wList,";")
		npnts = dimsize($tempWname,0)
		make/o/d/n=(npnts) $tempWname
		Wave CurrLoopWave = WaveRefFromString(tempWname, i)
		WaveofWaveRefs[i] = CurrLoopWave
		
	endfor
	
	return waveofwaverefs

end























Function Concat2Folders_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			variable V_Flag
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			string DF1, DF2
			prompt DF1, "What is the full path to the first datafolder?"
			prompt DF2, "What is the full path to the second datafolder?"
			doprompt "Please enter the following.", DF1, DF2
			Concat2Folders(DF1,DF2)
		case 2:
			break
		endswitch
end


//20240210 Given two folders with the same waves concat them
Function Concat2Folders(DF1,DF2)

	//Establish function parameters
	string DF1, DF2
	
	setdatafolder $DF1
	string F1_Waves = wavelist("*", ";", "TEXT:0")
	setdatafolder $DF2
	string F2_Waves = wavelist("*", ";", "TEXT:0")
	setdatafolder $DF1
	variable nwaves = itemsinlist(F1_Waves, ";")
	setdatafolder $DF2
	variable testnwaves = itemsinlist(F2_Waves, ";")
	if(itemsinlist(F1_Waves)==itemsInList(F2_Waves))
		//Continue with the code
	else	
		abort "Error in number of waves detected. Aborting."
	endif
	variable i
	
	for(i=0;i<nwaves;i++)
		setdatafolder $DF1
		wave tempwave1 = $stringfromlist(i,F1_Waves,";")
		setdatafolder $DF2
		wave tempwave2 = $stringfromlist(i,F2_Waves,";")
		
		setdatafolder root:	//Change this when updating in the future.
		string concat_str = nameofwave(tempwave1)//+"_Concat"
		Concatenate/O/NP=0 {tempwave1, tempwave2}, $concat_str	
	endfor


end


/////////////////////////////////////////////////////////////////////
//////////////////Dup2NF and DUP2NF with Range///////////////////////
/////////////////////////////////////////////////////////////////////

//Button than runs the dup2NF()
Function Dup2NF_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			variable V_Flag
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			dup2NF()
			
		case 2:
			break
		endswitch
end

//This function will duplicate all of the waves in the data folder the user is currently in to a new folder. 
function dup2NF()	//duplicate all waves to a new folder
	
	//Get information about the current folder and make the new data folder called 'TempNewFolder_Renameme'
	DFREF CurrDF = getdataFolderDFR()
	string CurrDF_Str = getdatafolder(1)
	newdataFolder/O/S TempNewFolder_Renameme
	DFREF NewDataF = GetdataFolderDFR()
	
	string wname
	
	//get all the waves in old folder
	variable nwaves, i 
	nwaves = CountobjectsDFR(CurrDF,1)
	string wlist = ""
	
   for (i=0; i< nwaves; i+=1)
       String dfName = GetIndexedObjNameDFR(CurrDF, 1, i)
       wlist += dfName + ";"
   endfor
   //duplicate them all to a new folder
	for(i=0;i<nwaves;i++)
		wname = stringfromList(i,wlist)
		duplicate CurrDF:$wname, NewDataF:$wname
	Endfor 
End

//Button that runs the dup2NF_Range
Function Dup2NF_Range_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string Fnew = ""
			variable P1
			variable P2
			
			prompt P1, "Please enter the starting point to use."
			prompt P2, "Please enter the ending point to use."
			doprompt "Please Enter the following infomation.", P1, P2
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			dup2NF_Range(P1,P2)
			
		case 2:
			break
		endswitch
end

//This function will duplicate all waves in the current folder to a new one with only a certain range of the waves duplicated (range is provided by the user)
function dup2NF_Range(P1,P2)	//duplicate all waves to a new folder with certain range
	//Establish Parameters
	variable P1,P2

	//Get information about the current data folder and make the new one
	DFREF CurrDF = getdataFolderDFR()
	string CurrDF_Str = getdatafolder(1)
	newdataFolder/O/S TempNewFolder_Renameme
	DFREF NewDataF = GetdataFolderDFR()
	
	string wname
	
	//get all the waves in old folder
	variable nwaves, i 
	nwaves = CountobjectsDFR(CurrDF,1)
	string wlist = ""
	
   for (i=0; i< nwaves; i+=1)
       String dfName = GetIndexedObjNameDFR(CurrDF, 1, i)
       wlist += dfName + ";"
   endfor
   //duplicate them all to a new folder
	for(i=0;i<nwaves;i++)
		wname = stringfromList(i,wlist)
		duplicate/R=[P1,P2] CurrDF:$wname, NewDataF:$wname	//the /R flag uses the point range provided by the user in order to specify the range of the waves to duplicate; this will create a new wave of the same name but only with the points that are covered by the range.
	Endfor 
End


/////////////////////////////////////////////////////////////////////
/////////////////////////////2DPieWaves//////////////////////////////
/////////////////////////////////////////////////////////////////////

Function ACSM_Organize2DPieWaves_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string pOrg_str = ""
			string pNO3_str = ""
			string pSO4_str = ""
			string pNH4_str = ""
			string pChl_str = ""
			string Twave_str = ""
			
			prompt pOrg_str, "Please enter the organic signal wave to be used."
			prompt pNO3_str, "Please enter the nitrate signal wave to be used."
			prompt pSO4_str, "Please enter the sulfate signal wave to be used."
			prompt pNH4_str, "Please enter the ammonium signal wave to be used."
			prompt pChl_str, "Please enter the chloride signal wave to be used."
			prompt Twave_str, "Please enter the time wave to be used."
			doprompt "Please Enter the following infomation.", pOrg_str, pNO3_str, pSO4_str, pNH4_str, pChl_str, Twave_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave pOrg = $pOrg_str
			wave pNO3 = $pNO3_str
			wave PSO4 = $pSO4_str
			wave PNH4 = $pNH4_str
			wave pChl = $pChl_str
			wave Twave = $Twave_str
			Organize2DPieWaves(pOrg,pNO3,pSO4,pNH4,pChl,Twave)
			
		case 2:
			break
		endswitch
end


//AJD 4/25/24
//Idea: for a time series create waves that contain the percentage of every species from the ACSM to prepare for IGOR's 2D pie chart package
//Places to improve; when I have more time I should make this a matrix, not like 4000 1D waves
Function Organize2DPieWaves(pOrg,pNO3,pSO4,pNH4,pChl,Twave)
	//declare waves
	wave pOrg,pNO3,pSO4,pNH4,pChl,Twave
	
	//set up variables and strings. Includes variables for indexing and dimension sizes as well as strings for name and date conversions. 
	variable i
	string currpiewname
	string currmastertime_big_str, currmastertime_small_str = ""
	variable npnts = dimsize(Twave,0)
	variable currmastertime_big,currmastertime_small
	string currmonth,currday,curryear,currhr,currmin,currsec 
	
	//Check to see if DataFolder exists, if not create it
	DFREF StartDF = getdataFolderDFR()
	if(datafolderexists("All_Pie_Waves")==1) //If it exists
		setdatafolder "All_Pie_Waves"
		DFREF PieDF = getdatafolderDFR()
	elseif(datafolderexists("All_Pie_Waves")==0) //If it does not exist
		newdatafolder/S :All_Pie_Waves
		DFREF PieDF = GetdatafolderDFR()
	Endif
	
	//set up loop
	for(i=0;i<npnts;i++)
	//First, set up time for each iteration in order to get a good wave name
		//Find Year,Month,Day
		currmastertime_big = Twave[i]
		currmastertime_big_str = secs2date(currmastertime_big,-2,";")
		//Find Hour,Min,Sec
		currmastertime_small = Twave[i]
		currmastertime_small_str = secs2time(currmastertime_small,3)
		
		
		curryear = stringfromlist(0, currmastertime_big_str,";")
		currmonth = stringfromlist(1, currmastertime_big_str,";")
		currday = stringfromlist(2, currmastertime_big_str,";")
		
		
		currhr = stringfromlist(0, currmastertime_small_str,":")
		currmin = stringfromlist(1, currmastertime_small_str,":")
		currsec = stringfromlist(2, currmastertime_small_str,":")
		
		//Get the wavename
		currpiewname = curryear+"_"+currmonth+"_"+currday+"_"+currhr+"_"+currmin+"_"+currsec+"_"+"2DPieWave"+"_"+"Point_"+num2str(i)
	
		//Establish the wave (5 species) and attatch note
		make/o/d/n=(5) $currpiewname
		wave currpiewave = $currpiewname
		note currpiewave, "Point 0-5 = Org,NO3,SO4,NH4,Chl"
		
		//Fill 2D pie wave with species at index i 
		currpiewave[0] = pOrg[i]
		currpiewave[1] = pNO3[i]
		currpiewave[2] = pSO4[i]
		currpiewave[3] = pNH4[i]
		currpiewave[4] = pChl[i]
		
		//Now that we have our wave that represents out percentage of each species we can move to the next wave
		
	Endfor

	setdatafolder StartDF
End


Function ACSM_Average2DPieWaves_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Work flow checker." 1, "Have you ensured that the Pie waves to be averaged have been generated, and you are in the Data Folder that has them as well as the All_Pie_Waves Data Folder?"
			if(V_Flag==1)
			elseif(V_flag==2)
				Abort "Incorrect work flow steps. Aborting."
			endif
			variable P1, P2
			
			prompt P1, "Please enter the first point to be used."
			prompt P2, "Please enter the last point to be used."
			doprompt "Please Enter the following infomation.", P1,P2
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			getaverage_2DPie(p1,p2)
			
		case 2:
			break
		endswitch
end


//From the All_Pie_Waves DataFolder given two points create an average wave
function getaverage_2DPie(p1,p2)
	
	variable p1,p2
	Variable npnts = (p2-p1)+1
	variable i = 0 
	String Avgwavename = "Avg_Wave_"+ num2str(p1)+"-"+num2str(p2)
	
	make/o/d/n=(npnts)/Free pOrg
	make/o/d/n=(npnts)/Free pNO3
	make/o/d/n=(npnts)/Free pSO4
	make/o/d/n=(npnts)/Free pNH4
	make/o/d/n=(npnts)/Free pChl
	

	//Get to the All_Pie_Waves datafolder
	SetDatafolder :All_Pie_Waves
	DFREF CurrDF = GetDatafolderDFR()
	
	for(p1=p1;p1<(p2+1);p1++)
		wave/Z currwave = WaveRefIndexedDFR(CurrDF,p1)	//Get the wave starting at p1
		//From the current wave grab all of the nessesary information
		pOrg[i] = currwave[0]
		pNO3[i] = currwave[1]
		pSo4[i] = currwave[2]
		pNH4[i] = currwave[3]
		pChl[i] = currwave[4]
		i++
	Endfor
	
	wavetransform zapnans pOrg
	wavetransform zapnans pNO3
	wavetransform zapnans pSO4
	wavetransform zapnans pNH4
	wavetransform zapnans pChl
	
	//Create the average percentages for the timeframe (pointframe)
	variable avgOrg, avgNO3, avgSO4, avgNH4, avgChl
	
	//Check to see if DataFolder exists, if not create it
	if(datafolderexists("Avg_Pie_Waves")==1) //If it exists
		setdatafolder "Avg_Pie_Waves"
		DFREF SubPieDF = GETdataFolderDFR()
	elseif(datafolderexists("Avg_Pie_Waves")==0) //If it does not exist
		newdatafolder/S :Avg_Pie_Waves
		DFREF SubPieDF = GETdataFolderDFR()
	Endif
	
	avgOrg = mean(pOrg)
	avgNO3 = mean(pNO3)
	avgSO4 = mean(pSO4)
	avgNH4 = mean(pNH4)
	avgChl = mean(pChl)
	
	
	make/o/d/n=5 $Avgwavename
	wave avgwave = $Avgwavename
	note avgwave,"Point 0-5 = Org,NO3,SO4,NH4,Chl"
	note avgwave, "Keep in  mind that all NaNs are zapped in this wave."
	
	avgwave[0] = avgOrg
	avgwave[1] = avgNO3
	avgwave[2] = avgSO4
	avgwave[3] = avgNH4
	avgwave[4] = avgChl
	
	setdatafolder root:


End

/////////////////////////////////////////////////////////////////////
///////////////////////Inorganic Ion Balance/////////////////////////
/////////////////////////////////////////////////////////////////////


Function ACSM_InorganicIonBalance_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string pNO3_str = ""
			string pSO4_str = ""
			string pNH4_str = ""
			string Twave_str = ""
			
			prompt pNO3_str, "Please enter the nitrate signal wave to be used."
			prompt pSO4_str, "Please enter the sulfate signal wave to be used."
			prompt pNH4_str, "Please enter the ammonium signal wave to be used."
			prompt Twave_str, "Please enter the time wave to be used."
			doprompt "Please Enter the following infomation.", pNO3_str, pSO4_str, pNH4_str, Twave_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave NO3 = $pNO3_str
			wave SO4 = $pSO4_str
			wave NH4 = $pNH4_str
			wave Twave = $Twave_str
			Inorg_ion_balance(twave, NH4, NO3, SO4)
			
		case 2:
			break
		endswitch
end



function Inorg_ion_balance(twave, NH4, NO3, SO4)	//Establish an 'ion space' view of the Inorganic ions of the ACSM (NO3, SO4, NH4; not Chl) to inspect RIEs and view other aspects of a time period
	//Establish Parameters
	wave twave, NH4, NO3, SO4
	
	//Establish variables
	variable MW_NH4, MW_NO3, MW_SO4, npnts, NH4_ionbalance, NO3_ionbalance, So4_ionbalance
	MW_NH4 = 18 //Molecular weight of NH4+ ion in g mol-1
	MW_NO3 = 62 //Molecular weight of NO3- ion in g mol-1
	MW_SO4 = 96 //Molecular weight of SO4-2 ion in g mol-1
	npnts = dimsize(twave,0)
	
	//Make Waves
	make/o/d/n=(npnts) Pos_ion_balance
	make/o/d/n=(npnts) Negative_ion_balance 
	
	//Account for units
	//we start with MW -> g/mol and we take a concentration in ug/m3 and divide MW
	//So we need to get g/mol -> ug/umol
	//There is an associated charge with each cation and anion. So for nh3 we do this and there is an associated + charge; with NO3 there is a negative charge. 
	//with so4 there is a -2 charge which we account for by doubling the weight we divide by. 
	//Although we should take the moleculear wight by 1E-6 we will undo this later so it is unnesseary.
	
	//Full units breakdown
	//	ug X    	   mol	X	umol X				mol	X	 charge X
	//---- * 1E-6 (----) = ----- * 1e6 = ------ * -------- 		Where Charge X -> 1 for NH4+ and NO3-; and 2 for SO4-2 ;;; we assume 1 cubic meter
	// m3		       g X	  m3				m3		   mol X

	//Create for loop and it's components
	variable i 
	for(i=0;i<npnts;i++)
		//Perform pos ion calc
		NH4_ionbalance = (NH4[i]/MW_NH4) * 1 //conc -> mass -> charge NH4 1 charge per 1 mol
		//Perform neg ion calc
		NO3_ionbalance = (NO3[i]/MW_NO3) * 1 //conc -> mass -> charge NO3 1 charge per 1 mol
		SO4_ionbalance = (SO4[i]/(MW_SO4)) * 2 //conc -> mass -> charge So4 2 charge per 1 mol
		//Append calculated values to waves
		Pos_ion_balance[i] = NH4_ionbalance
		Negative_ion_balance[i] = NO3_ionbalance + SO4_ionbalance
	Endfor
	
	//Create basic graphing function 
	Display Pos_ion_balance vs Negative_ion_balance
	ModifyGraph mode(Pos_ion_balance)=2, lsize(Pos_ion_balance)=3
	ModifyGraph zColor(Pos_ion_balance)={twave,*,*,BlueBlackRed,0}
	Label left "Positive Ion"
	label bottom "Negative Ion"
	colorscale/C/N=text0 "\\f01DateTime (EDT)\\f00"
	//Curve fit a line
	CurveFit/Q/TBOX=769 line Pos_ion_balance /X = Negative_Ion_balance /D
	string r2 = num2str(V_r2)
	appendtext/N=CF_Pos_Ion_balance "R\\S2\\M = " + r2
	Dowindow/C Ion_Balance
	
End


Function PMF5Percent_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string PMF_Wave_Finder = ""
			string DT_Wave_Str = ""
			string Org_Sig_Wave_Str = ""
						
			prompt PMF_Wave_Finder, "Please enter the common part of all PMF waves that you want to incorperate."
			prompt DT_Wave_Str, "Please enter the time wave to be used."
			prompt Org_Sig_Wave_Str, "Please enter the organic signal wave to be used."
			doprompt "Please Enter the following infomation.", PMF_Wave_Finder, DT_Wave_Str, Org_Sig_Wave_Str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave DT = $DT_Wave_Str
			wave pOrg = $Org_Sig_Wave_Str
			PMF5Percent(DT, pOrg, PMF_Wave_Finder)
			
		case 2:
			break
		endswitch
end

//AJD: Perform 5% test to see what drives extreme PM
Function PMF5Percent(DT, pOrg, PMF_Wave_Finder)

	//Establish Function Parameters
	Wave DT, pOrg
	String PMF_Wave_Finder
	
	//Establish CurrentDF Folder hierarchy
	DFREF StartDF = getdatafolderDFR()
	newdatafolder/O/S Top5Percent_Contribution
	DFREF DataDF = getdatafolderDFR()
	setdatafolder StartDF
	
	//Establish Local Parameters
	String PMF_Wave_Finder_Helper = "*"
	variable npnts = dimsize(DT,0)
	variable i, j,k,z, h
	
	
	//Determine the amount of points to take for 5%
	variable TakePoints = round(npnts*0.05)
	
	//Find and Establish the PMF Waves and make the top 5% waves
	String WaveSeeker = PMF_Wave_Finder_Helper+PMF_Wave_Finder+PMF_Wave_Finder_Helper
	String PMF_wList = wavelist(WaveSeeker, ";", "TEXT:0")
	Variable nPMFWaves = itemsinlist(PMF_wList,";")
	String PMF_RefList = GenerateWaveRefList(nPMFWaves,PMF_wList)
	Make/O/D/N=(nPMFWaves)/Wave WaveofWaveRefs 
	//Start a loop and impliment tysons 'wave of waves' recommendation/hack
	for(i=0;i<nPMFWaves;i++)
		string tempWname = "Top5Percent_"+stringfromlist(i,PMF_wList,";")
		make/o/d/n=(TakePoints) $tempWname
		Wave CurrPMFLoopWave = WaveRefFromString(tempWname, i)
		WaveofWaveRefs[i] = CurrPMFLoopWave
		
	endfor

	//Make sure all of the waves are the same length (check pOrg and the first wave from out PMF wavelist)
	CheckDimsize(DT,pOrg,0);CheckDimsize(DT,$stringfromlist(0,PMF_WList,";"),0)
	
	//Duplicate the pOrg Wave to Sort it
	Duplicate/O pOrg, pOrg_Sorted
	//Ensure we zap the nans of the sorted wave as those are stored first
	Wavetransform ZapNans pOrg_Sorted
	Sort/R pOrg_Sorted,pOrg_Sorted
	
	//Set up big loop to extract the top 5% PMF Contributions
	for(i=0;i<TakePoints;i++)
		//Look at the sorted wave first to see the top points
		variable CurrSortedPnt = pOrg_Sorted[i]
		//Use this to aid in a binary search of the original non-sorted pOrg Wave
		variable CorrespondingLocation = FindWavePointFromValue(pOrg,CurrSortedPnt)
		//Now that we have the corresponding location in our time series wave from the sorted wave 
		//Take data from all of the original waves at that location to start building our top5% waves
		z=0
		for(j=0;j<nPMFWaves;j++)
			Wave CurrTop5W = WaveofWaveRefs[j]
			Wave CurrPMFW = $stringfromlist(j,PMF_wList,";")
			CurrTop5W[k] = CurrPMFW[CorrespondingLocation]
			z++
			if(z==nPMFWaves) //We have looped through all of our PMF Waves
				k++
			else
			endif
		endfor
	endfor
	
	//Move waves to new datafolder
	string Alldatawaves2move = ""; string Alldatawaves2moveText = ""
	Alldatawaves2move+=wavelist("*Top5Percent_*",";", "TEXT:0")
	alldatawaves2move+="pOrg_Sorted;"
	Alldatawaves2moveText+=wavelist("*Top5Percent_*",";", "TEXT:1")
	variable movewaves = itemsinlist(Alldatawaves2move,";"); variable movewavestext = itemsinlist(Alldatawaves2moveText,";")
	for(i=0;i<movewaves;i++)
		movewave $stringfromlist(i,Alldatawaves2move,";"), DataDF:$stringfromlist(i,Alldatawaves2move,";")
	endfor
	for(i=0;i<movewavestext;i++)
		movewave $stringfromlist(i,Alldatawaves2moveText,";"), DataDF:$stringfromlist(i,Alldatawaves2moveText,";")
	endfor
	
	//Now set the current DF to the one that we moved all the waves too
	setdatafolder DataDF
	
	//We have establish our top 5% waves. Graphically represent them.
	// (1) Make Labels
	make/o/d/n=(nPMFWaves)/T Top5Percent_Labels
	for(i=0;i<nPMFWaves;i++)
		//string labelname = "Top5Percent_Label_"+num2str(i)
		//make/o/d/n=(1)/T $labelname
	//	Wave/T TempWave = $labelname
		Top5Percent_Labels[i] = nameofwave(WaveofWaveRefs[i])
	endfor
	
//	//(2) Establish Axis names - for a box plot we only have to worry about bottom axis names
//	string bottomLabel = ""
//	for(i=0;i<nPMFWaves;i++)
//		bottomLabel+= "B"+num2str(i)+";"
//	endfor	
	string Top5List = wavelist("*Top5Percent_*",";","TEXT:0")
	Concatenate Top5List, Top5Percent_Matrix
	
	//(3) Setup the box plot
	Display;AppendBoxPlot Top5Percent_Matrix vs Top5Percent_Labels	//Wave references should align; i.e. BBOA with BBOA; COA with COA etc.
//	for(i=1;i<nPMFWaves;i++)
//		AppendBoxPlot/B=stringfromlist(i;BottomLabel,";")
//	endfor

	//Kill off unimportant waves
	Killwaves/Z WaveofWaveREfs


	//Set data folder to the start
	setdatafolder StartDF
End

//Advantage over BinarySearch is that is does not have to be a monotinically increasing or decreasing wave
//Assumes that the waves has only one point that contains the specific value the user is seeking
Function/D FindWavePointFromValue(w,value)
	
	//Establish Function Parameters
	wave w
	variable value
		
	//Establich Local Parameters
	variable i
	variable npnts =dimsize(w,0)
	variable CurrPointVal
	
	//Use for-loop to find value in wave
	for(i=0;i<npnts;i++)
		CurrPointVal = w[i]
		if(CurrPointVal==Value)
			Return i
		else
			//Do nothing and continue going through the loop
		endif
	endfor

end




//For ICARTT: Make time start and stop waves for SMPS
Function startstopwaves(datetimewave, scantime)  //datetimewave is the start time for an SMPS scan. 
	wave datetimewave, scantime
	//variable scantime //number of seconds for a scan
	Duplicate/O datetimewave SMPS_Start
	Duplicate/O datetimewave SMPS_Stop
	Duplicate/O datetimewave SMPS_MidPoint
	
	SMPS_Stop = datetimewave + scantime
	
	SMPS_MidPoint = SMPS_Start + scantime/2
	
end



//Button for integrated signal code
Function SeperateForICARTT_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the data folder with the ICARTT named waves?"
			if(V_flag==1)
			elseif(V_Flag==2||V_Flag==3)
				abort "Not in the correct Data Folder. Aborting procedure."
			endif
			string SD_Str = ""
			String MidpntDiam_Str = ""
			prompt SD_Str, "What is the SD wave?"
			prompt MidpntDiam_Str, "What is the midpoint diameter wave?"
			Doprompt "Please enter the following.", SD_Str,MidpntDiam_Str
			if(V_Flag==1)
				Abort "User cancelled."
			else
			wave SD = $SD_Str
			Wave MidpntDiam = $MidpntDiam_Str
				SeparateforICARTT(SD, MidpntDiam)
			Endif
		case 2:
			break
		endswitch
end

//ForICartt Seperate SD to numbered bins
function SeparateforICARTT(SD, MidpntDiam)
	Wave SD, MidpntDiam
	variable i = 0		
				
	//Duplicate and round the Diameter Wave to avoid 0.001 readability issues
	Duplicate/Free MidpntDiam, TempMidpnt
	string variablenames
	variablenames = ""
	for(i=0; i<(numpnts(TempMidpnt)); i+=1)
		string Expr = "([[:digit:]]+).([[:digit:]]+)"
		string befored, afterd
		SplitString/E=(Expr) num2str(TempMidpnt[i]), befored, afterd
		if(strlen(befored)<=2) //If we are not in the triple digits
			variable roundvar = 3
		else
			roundvar = 4
		endif		
		TempMidpnt[i] = RoundDecimal(TempMidpnt[i], roundvar)
		variablenames += nameofwave(SD)+"_MdPtDiam" +num2str(TempMidpnt[i]) + ";"
	endfor
		
	variablenames = replacestring(".",variablenames,"_") //Change decimals in wave to underscores
		
	//Make each *interval* column of the transposed wave into individual 1D waves with unique names
	for (i=0;i<dimsize(SD,1);i++)
		string thiswavename = stringfromlist(i, variablenames)
		Matrixop/O $thiswavename = col(SD,i)
		Redimension/N=-1 $thiswavename
	Endfor

End

//Supporting fucntion for SeperateforICARTT()
//From Thomas_Braun https://www.wavemetrics.com/code-snippet/rounding-values-defined-number-significant-digits
Function RoundDecimal(value, numSigDigits)
    variable value, numSigDigits
 
    string str
 	 
    sprintf str, "%.*g\r", numSigDigits, value
 
    return str2num(str)
End

//AJD 3/24/2025 Wave Reference From String in a loop: provided a string will generate a wave refrence; designed to be in a loop to
//deal with the case where you want to loop through a lot of points and generate a wave refrence for every loop
Function/Wave WaveRefFromString(Str, Var)

	//Establish Function Parameters
	String Str
	Variable Var
	
	//Test to make sure we know the base wave
	Wave WExist = $Str
	if(waveexists(WExist)==0) //If it does not exist
		Abort Str+" was not found. In order to generate a refrence the wave must be previously generated."
	
	elseif(waveexists(WExist)==1) //If it does exist
		//Continue
	endif
	
	//Compile and return the wave ref
	Wave ReturnWave = $Str//+"_"+num2str(Var)
	Return ReturnWave

end

//AJD 3/24/2025 Generate a wave refrence list to aid the WaveRefFromString function in a loop
function/S GenerateWaveRefList(nPntsInLoop, CorrespondingWList)

	//Establish Function Parameters
	Variable nPntsInLoop
	String CorrespondingWList
	
	//Establish Local Parameters
	String ReturnStr = ""
	variable i
	
	
	//Run Loop 
	for(i=0;i<nPntsInLoop;i++)
		ReturnStr+= Stringfromlist(i,CorrespondingWList,";")+";"
	Endfor
	
	Return ReturnStr

end













//20250131 AJD 2D to 1D wave
//Takes a given wave (2D) and makes 1D waves. 
Function TwoDto1D_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			//Inital Check: Is the user in a good Data Folder?
			doalert/T="Initial Check" 2, "Are you in the Data folder that holds the waves to be used?"
			if(V_Flag ==1)
			elseif(V_Flag==2)
				abort "User is not in a good Data Folder to run the code. Aborting."
			elseif(V_Flag==3)
				abort "User is not in a good Data Folder to run the code. Aborting."
			else
				abort "Unknown Input. Aborting."
			endif
			
			string Wave_str = ""
			string type = ""
			
			prompt Wave_str, "Please enter the wave to be used."
			prompt type, "Enter 'row' to group 2D wave based on rows or 'column' to group based on columns."
			doprompt "Please Enter the following infomation.", Wave_str, type
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave w2D = $Wave_str
			TwoD21D(w2D,type)
			
		case 2:
			break
		endswitch
end


Function TwoD21D(w2D,type)
	//Establish Function Parameters
	wave w2D
	string type
	
	//Establish Function Variables
	variable nrows = dimsize(w2D,0)
	variable ncols = dimsize(w2D,1)
	variable i, j
	string newname = nameofwave(w2D)
	string newWavename = ""
	
	
	//Loop through either the columns or rows
	if(stringmatch(type,"row")==1)
		for(i=0;i<nrows;i++)
		//Create new wave name
			newWavename = newname+"_"+num2str(i)
			wave TempWave1
			Make/O/D/N=(nrows) $newWaveName = NaN
			wave TempWave = $newWavename
		//Take the row out of the main matrix
			Matrixop TempWave1 = row(W2D,i)
		//Transfter the extracted row to a 1D wave
			for(j=0;j<nrows;j++)
				TempWave[j] = TempWave1[0][j]
			endfor
		//Delete TempWave1
			killwaves/z TempWave1
		//Repeat the loop
			j=0			
		endfor
	
	elseif(stringmatch(type,"column")==1)
		for(i=0;i<ncols;i++)
		//Create new wave name
			newWavename = newname+"_"+num2str(i)
			wave TempWave1
			Make/O/D/N=(nrows) $newWaveName = NaN
			wave TempWave = $newWavename
		//Take the column out of the main matrix
			MatrixOP TempWave1 = col(W2D,i)
		//Duplicate TempWave1
			Duplicate/O TempWave1, $newWaveName
		//Kill TempWave1
			killwaves/z TempWave1
		endfor
	else
		Abort "Unsure on iteration type. Ensure 'row' or 'column' is inputted."
	endif
	
	

end





/////////////////////////////////////////////////////////////////////
////////////////////////////Flip Wave////////////////////////////////
/////////////////////////////////////////////////////////////////////

//This button runs the flip_wave code
Function FlipWave_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
		
			//Inital Check: Is the user in a good Data Folder?
			doalert/T="Initial Check" 2, "Are you in the Data folder that holds the waves to be used?"
			if(V_Flag ==1)
			elseif(V_Flag==2)
				abort "User is not in a good Data Folder to run the code. Aborting."
			elseif(V_Flag==3)
				abort "User is not in a good Data Folder to run the code. Aborting."
			else
				abort "Unknown Input. Aborting."
			endif
			
			string Wave_str = ""
			
			prompt Wave_str, "Please enter the wave to be used."
			doprompt "Please Enter the following infomation.", Wave_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave w = $Wave_str
			Flip_Wave(w)
			
		case 2:
			break
		endswitch
end

//This function will take a wave and flip it
//When I say 'flip it' what I mean is the inversing of values in the wave (for example if wave[0] = 5 and wave[10] = 2 (and wave[10] was the final point then the flipped wave would result in wave[0] = 2 and wave[10] = 5) 
Function Flip_Wave(w)
	//Establish parameters
	wave w
	
	//Establish variables
	variable npnts = dimsize(w,0)
	
	//Take the name of the wave inputted and then add a '_Flipped' to it 
	string flippedname = nameOfWave(w)+"_Flipped"
	duplicate w, $flippedname
	wave tempwave = $flippedname
	
	//An intresting approach to this problem, do a for loop but start at the end, and go backwards. 
	variable i, j 
	j=0
	for(i=npnts-1;i>=0;i--)
		
		tempwave[i] = w[j]
		
		if(j==0)
			j++
		else
			j++
		endif
	Endfor
	
End

Function Flip_Wave_Text(w)
	//Establish parameters
	wave/T w
	
	//Establish variables
	variable npnts = dimsize(w,0)
	
	//Take the name of the wave inputted and then add a '_Flipped' to it 
	string flippedname = nameOfWave(w)+"_Flipped"
	duplicate w, $flippedname
	wave/T tempwave = $flippedname
	
	//An intresting approach to this problem, do a for loop but start at the end, and go backwards. 
	variable i, j 
	j=0
	for(i=npnts-1;i>=0;i--)
			
		string wdata_str = w[j]
		tempwave[i] = wdata_str
		
		if(j==0)
			j++
		else
			j++
		endif
	Endfor
	
End






////////////////////////////////////////////////////////////
/////////////////////////AJD////////////////////////////////
////////////Residence Time and Laminar flow/////////////////
////////////////////////////////////////////////////////////
///////////////////Updated:2023_12_19///////////////////////
////////////////////////////////////////////////////////////

Function Restime_butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			variable flowrate, Diameter, Total_Length, absolute_pressure_pa, temp
			
			prompt flowrate, "Please enter the flowrate (LPM) to be used."
			prompt Diameter, "Please enter the Diameter of the tubing (inches) to be used."
			prompt Total_Length, "Please enter the total length of tubing (meters) to be used."
			prompt absolute_pressure_pa, "Please enter the absolute pressure to be used (pa) to be used."
			prompt temp, "Please enter the temperature (Kelvin) to be used."
			doprompt "Please Enter the following infomation.", flowrate, Diameter, Total_Length, absolute_pressure_pa, temp
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			restime(flowrate, Diameter, Total_Length, absolute_pressure_pa, temp)
			
		case 2:
			break
		endswitch
end





Function restime(flowrate, Diameter, Total_Length, absolute_pressure_pa, temp)
//Intialize every parameter
	variable flowrate, Diameter, total_length, absolute_pressure_pa, temp //Flowrate in LPM; go with lowest flow to be conservative; Diameter in inches; total length in meters
	variable wpnts, R //R -> Ideal gas constant in J/(kg*K); This is for air specifically)
	
	

//The density of air and temp variables are used for the laminar flow calculation. This function is called below the residence time calculation. 
//Converstion calculations
	Diameter = Diameter/39.37	//Inches to meter conversion
	
//Cross-sectional area, Volumetric Flow, and velocity calculations
	variable A //Cross sectional area
	A = (pi*(Diameter^2))/(4)	//Units: m^2
	
	Variable Q //Volumetric Flow Rate
	Q = Flowrate * (1/60)*(0.001)	// units: LPM * (1m/60S) * (0.001 m^3/1 L) => m^3/s
	
	Variable V //Velocity
	V = (Q/A)	//Units: 		(m^3/S)
//							-------------	=> m/s
//								 (m^2)				
	
	
// Density of air-calculation; from : https://byjus.com/physics/density-of-air/#:~:text=Density%20is%20a%20measure%20of,and%20v%20is%20the%20volume.

	variable density_air, absolute_pressure	
	R = 287 //	J/(kg/k)
																	//												kg						
																	//												______							
																	//												m*s^2								
	density_air = (absolute_pressure_pa)/(R*temp)		//Units:				 kg/m^3	=	 ------------------- 
																	//												kg*m^2		K
																	//												______	*	
																	//												kg*K*s^2
	
//Residence Time calculations

//Residence time = total_distance/ velocity //Units: residence time (s) = distance (m)/ Velocity (m/s) 
	wave Residence_Time_Sec

	
	if(waveexists(Residence_Time_Sec))
		wpnts = dimsize(Residence_Time_Sec, 0)
		redimension/N=(wpnts+1) Residence_Time_Sec
		Residence_Time_Sec[wpnts] = Total_length/V
	elseif(!waveexists(Residence_Time_Sec))
		make/n=1 Residence_Time_Sec
		Residence_Time_Sec[0] = Total_length/V
	endif
	
//Calling the Laminar Flow calculation funtion

	laminarflow(Density_air, V, Diameter, Temp)

//Other waves for use in laminar flow calc
	Wave Density_wave, Velocity_Wave, Diameter_Wave, Temp_wave
	wave/T Laminar_Flow_Wave
	wave Re_Wave

//Is the system as it has been defined passable?
	wave/T Passable
	
	if(waveexists(Passable))
		wpnts = dimsize(Passable,0)
		redimension/n=(wpnts+1) Passable
		if(residence_time_sec[wpnts] < 15 && Re_wave[wpnts] <1800)
			Passable[wpnts] = "Yes"
		elseif(Residence_time_sec[wpnts] <15 && Re_wave[wpnts] > 1800)
			Passable[wpnts] = "No. Re too high; not laminar"
		elseif(Residence_time_sec[wpnts]>15 && re_wave[wpnts] <1800)
			Passable[wpnts] = "No. Residence time too long."
		elseif(residence_time_sec[wpnts] > 15 && Re_wave[wpnts] > 1800)
			Passable[wpnts] = "No. Residence Time too long and Reynolds number too large; Not laminar flow."
		endif
	elseif(!waveexists(Passable))
		make/T/n=1 Passable
		if(residence_time_sec[wpnts] < 15 && Re_wave[wpnts] <1800)
			Passable[wpnts] = "Yes"
		elseif(Residence_time_sec[wpnts] <15 && Re_wave[wpnts] > 1800)
			Passable[wpnts] = "No. Re too high; not laminar"
		elseif(Residence_time_sec[wpnts]>15 && re_wave[wpnts] <1800)
			Passable[wpnts] = "No. Residence time too long."
		elseif(residence_time_sec[wpnts] > 15 && Re_wave[wpnts] > 1800)
			Passable[wpnts] = "No. Residence Time too long and Reynolds number too large; Not laminar flow."
		endif
	endif
	
	
	//Check to see if table exists		

	Dowindow/F Laminar_Flow_Table
		if(V_Flag==0) //If window does not exist
			Edit/n= Laminar_Flow_Table
			Appendtotable/W=Laminar_Flow_Table Density_wave, velocity_wave, Diameter_wave,Temp_wave,Residence_time_Sec, Re_wave, Laminar_flow_wave, Passable
		else
			Appendtotable/W=Laminar_Flow_Table Density_wave, velocity_wave, Diameter_wave,Temp_wave,Residence_time_Sec, Re_wave,  Laminar_flow_wave, Passable
	endif
	
	note/K Density_Wave "Denisty of air in kg/m^3."
	note/K Velocity_Wave "Velocity through tube in m/s."
	note/K Diameter_Wave "Inner Diameter of the tube in m"
	note/K RE_Wave "Reynolds number determined by Re = Density*velocity*inner Diameter/Eta; Unitless; Laminar flow in tube occurs when Re < 1800."
	note/K Laminar_Flow_Wave "If Re is > 1800 then flow is not laminar, if Re is < 1800 then flow is laminar."
	note/K Temp_wave "Tempature in Kelvin; used to calulate the dynamic viscocity of air (Eta)."
	note/K Residence_time_Sec "Residence Time of particles moving through the tubing system"




End

Function laminarflow(density, velocity, diameter, Temp)
//Initalize Parameters
	variable density, velocity, diameter, Temp //(Pipe or Particle) - Hinds //Pipe here
//The purpose of temperature is to calculate the correct tempature dependent dynamic viscocity of air (Eta); needs to be in Kelvin
//Density -> kg/m^3; velocity -> m/s; diameter -> m

//Eta is 1.81E-5 at 15 C but it will likely not be that temperature in NYC in Janurary and Feburary. 
//	variable Eta = 1.81E-5 //Units: Pa*S or N*s/m^2 or kg/(m*s) // Viscocity -> remember Re is a ratio of Inertial to Viscous Forces

	variable Eta = (1.458E-6 * (Temp^(3/2)))/ (Temp+110.4) //from: https://www.omnicalculator.com/physics/kinematic-viscosity-of-air#:~:text=%CE%BC%20%3D%20(1.458%C3%9710%2D,%2D5%20m2%2Fs.
	
	
	
//Converstion Calculations
	
//Reynolds Flow Calculation: Re = (Density*Velocity*Diameter)/(Viscocity)
	Variable Re = (density*velocity*diameter)/(Eta)
//Units:
//			kg		m
//			__	*	_	*	m
//			m^3		s
//	Re = --------------		===> Unitless (makes sense it is a ratio)
//				kg
//			________
//			 (m*s)

//	Assumptions: 293K, 101kPa -> for Eta; Todo -> impliment T change later

//Present values in table 
Wave Density_wave, Velocity_Wave, Diameter_Wave, Temp_wave
variable wpnts
wave/T Laminar_Flow_Wave
wave Re_Wave


	if(waveexists(Density_wave))
		wpnts = dimsize(Density_wave, 0)
		redimension/N=(wpnts+1) Density_wave
		Density_Wave[wpnts] = density
	elseif(!waveexists(Density_Wave))
		make/n=1 Density_Wave
		Density_wave[0] = Density
	endif
		
	if(waveexists(velocity_wave))
		wpnts = dimsize(Velocity_wave, 0)
		redimension/N=(wpnts+1) Velocity_wave
		Velocity_Wave[wpnts] = Velocity
	elseif(!waveexists(Velocity_Wave))
		make/n=1 Velocity_Wave
		Velocity_wave[0] = Velocity
	endif
		
	if(waveexists(diameter_wave))
		wpnts = dimsize(Diameter_wave, 0)
		redimension/N=(wpnts+1) Diameter_wave
		Diameter_Wave[wpnts] = Diameter
	elseif(!waveexists(Diameter_Wave))
		make/n=1 Diameter_Wave
		Diameter_wave[0] = Diameter
	endif
	
	if(waveexists(Re_wave))
		wpnts = dimsize(Re_wave, 0)
		redimension/N=(wpnts+1) Re_wave
		Re_Wave[wpnts] = Re
	elseif(!waveexists(Re_Wave))
		make/n=1 Re_Wave
		Re_wave[0] = Re
	endif
	
	if(waveexists(Temp_wave))
		wpnts = dimsize(Temp_wave, 0)
		redimension/N=(wpnts+1) Temp_wave
		Temp_Wave[wpnts] = Temp
	elseif(!waveexists(Temp_Wave))
		make/n=1 Temp_Wave
		Temp_wave[0] = Temp
	endif
	
	if(waveexists(Laminar_Flow_wave))
		wpnts = dimsize(Laminar_Flow_wave, 0)
		redimension/N=(wpnts+1) Laminar_Flow_wave
		if(Re<1800)
			Laminar_Flow_Wave[wpnts] = "Yes"
		elseif(Re>1800)
			Laminar_Flow_Wave[wpnts] = "No"
		endif
	elseif(!waveexists(Laminar_Flow_Wave))
		make/T/n=1 Laminar_Flow_Wave
		if(Re<1800)
			Laminar_Flow_Wave[wpnts] = "Yes"
		elseif(Re>1800)
			Laminar_Flow_Wave[wpnts] = "No"
		endif
	endif


End


function Cuninghamcorrection(d)	// cunninghams correction factor function; does not currently work-ish
	variable d	//inputted in nm
	variable dm = 3.7E-10 // collisional diameter in meters constant from Hinds
	variable nc = 2.5E32 //1/m3 number concentration of air molecules from Hinds; shown as E25 but jesus im not getting ~ 0.066 um any other way; probaby some conversion error
	//d = diameter in meters
	d *=1e-9
	variable Cc //cunninghams correction factor
	variable lambda // gas mean free path
	//Cc = 1 + (2.52*lambda/d)
	//nc* dm^2
	variable x = dm^2
	x*=nc
	variable breakdown = 2*pi*x
	variable breakdown1 = sqrt(breakdown)
	variable breakdown2 = 1/breakdown1
	//lambda = 1/(Sqrt(2*pi*x)) //meters but I use breakdown bc I suck at igor math syntax
	
	Cc = 1 + ((2.52*breakdown2)/d)
	print "Cc = " + num2str(Cc)
	return Cc

End
function D (T, diam) //diffusion coefficient calculator
	variable T, diam //Temperature in K and diameter in nm
	
	variable k = 1.38E-23 //boltzman constant J/K
	variable Ccorr = Cuninghamcorrection(diam) //cunningham's correction factor
	variable eta = (1.458E-6 * (T^(3/2)))/ (T+110.4)	//viscocity
	diam*=1E-9 //nm to m
	
	//D = kTCc/3pi*eta*d
	
	variable D //diffusion coefficent in m^2/s
	D = (k*T*Ccorr)/(3*pi*eta*diam)
	
	print "D = " + num2str(D)

End



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////SP2 Figures of Merit//////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Function SP2_Uncert_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			string OrgMS_Str = ""
			string NO3MS_str = ""
			string SO4MS_str = ""
			string NH4MS_str = ""
			String ChlMS_str = ""
			string MSS_BaseWave_Str = ""
			
			prompt OrgMS_Str, "Please enter the Organic MS wave to be used."
			prompt NO3MS_str, "Please enter the Nitrate MS wave to be used."
			prompt SO4MS_str, "Please enter the Sulfate MS wave to be used."
			prompt NH4MS_str, "Please enter the Ammonium MS wave to be used."
			prompt ChlMS_str, "Please enter the Chloride MS wave to be used."
			prompt MSS_BaseWave_Str, "Please enter the MSS Basewave to be used. (This is the wave with the desired AMU's)"
			doprompt "Please Enter the following infomation.", OrgMS_Str,NO3MS_str, SO4MS_str, NH4MS_str, ChlMS_Str, MSS_BaseWave_Str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave Org_MS = $OrgMS_Str
			wave NO3_MS = $NO3MS_str
			wave SO4_MS = $SO4MS_str
			wave NH4_MS = $NH4MS_str
			wave Chl_MS = $ChlMS_Str
			wave MSS_Basewave = $MSS_BaseWave_Str
		//	SP2_Uncert()
					
		case 2:
			break
		endswitch
End


Function SP2_CalibrationAccuracy_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			string FitPkHt_BBHG_Str = ""
			string FitPkHt_BBLG_str = ""
			string FitPkHt_NBHG_str = ""
			string FitPkHt_NBLG_str = ""
			
			string Sdev_BBHG_Sdev_Str = ""
			string Sdev_BBLG_Sdev_str = ""
			string Sdev_NBHG_Sdev_str = ""
			string Sdev_NBLG_Sdev_str = ""
			
			prompt FitPkHt_BBHG_Str, "Please enter the BBHG Fit Peak Ht wave wave to be used."
			prompt FitPkHt_BBLG_str, "Please enter the BBLG Fit Peak Ht wave to be used."
			prompt FitPkHt_NBHG_str, "Please enter the NBHG Fit Peak Ht wave to be used."
			prompt FitPkHt_NBLG_str, "Please enter the NBLG Fit Peak Ht wave to be used."
			
			prompt Sdev_BBHG_Sdev_Str, "Please enter the BBHG Accuracy wave wave to be used."
			prompt Sdev_BBLG_Sdev_str, "Please enter the BBLG Accuracy wave to be used."
			prompt Sdev_NBHG_Sdev_str, "Please enter the NBHG Accuracy wave to be used."
			prompt Sdev_NBLG_Sdev_str, "Please enter the NBLG Accuracy wave to be used."
			doprompt "Please Enter the following infomation.", FitPkHt_BBHG_Str,FitPkHt_BBLG_str, FitPkHt_NBHG_str, FitPkHt_NBLG_str,Sdev_BBHG_Sdev_Str,Sdev_BBLG_Sdev_str,Sdev_NBHG_Sdev_str,Sdev_NBLG_Sdev_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave FitPkHt_BBHG = $FitPkHt_BBHG_Str
			wave FitPkHt_BBLG = $FitPkHt_BBLG_str
			wave FitPkHt_NBHG = $FitPkHt_NBHG_str
			wave FitPkHt_NBLG = $FitPkHt_NBLG_str
			wave Sdev_BBHG = $Sdev_BBHG_Sdev_Str
			wave Sdev_BBLG = $Sdev_BBLG_Sdev_str
			wave Sdev_NBHG = $Sdev_NBHG_Sdev_str
			wave Sdev_NBLG = $Sdev_NBLG_Sdev_str
			SP2_CalibrationAccuracy(FitPkHt_BBHG, FitPkHt_BBLG, FitPkHt_NBHG, FitPkHt_NBLG,Sdev_BBHG,Sdev_BBLG,Sdev_NBHG,Sdev_NBLG)	
		case 2:
			break
		endswitch
End

//AJD 4/15/25: Take the Standard Deviation of the gaussian fit at each diameter
//for each of the detectors and combine them with other uncertainties to find the accuracy figure of merit for the SP2. 
Function SP2_CalibrationAccuracy(FitPkHt_BBHG, FitPkHt_BBLG, FitPkHt_NBHG, FitPkHt_NBLG,Sdev_BBHG,Sdev_BBLG,Sdev_NBHG,Sdev_NBLG)

	//Establish Function Parameters
	wave FitPkHt_BBHG, FitPkHt_BBLG, FitPkHt_NBHG, FitPkHt_NBLG,Sdev_BBHG,Sdev_BBLG,Sdev_NBHG,Sdev_NBLG
	
	//Establish Local Parameters
	variable SP2_Err_SV = 0.05, SP2_Err_Diam = 0.05, SP2_Err_Density = 0.05
	variable Mass_Err, i, j, npnts = dimsize(FitPkHt_BBHG,0)
	String SigList = nameofwave(FitPkHt_BBHG)+";"+nameofwave(FitPkHt_BBLG)+";"+nameofwave(FitPkHt_BBLG)+";"+nameofwave(FitPkHt_BBLG)+";"
	string SdevList = nameofwave(Sdev_BBHG)+";"+nameofwave(Sdev_BBLG)+";"+nameofwave(Sdev_NBHG)+";"+nameofwave(Sdev_NBLG)+";"
	//Make output waves
	Make/o/d/n=(npnts) SP2Accuracy_BBHG
	Make/o/d/n=(npnts) SP2Accuracy_BBLG
	Make/o/d/n=(npnts) SP2Accuracy_NBHG
	Make/o/d/n=(npnts) SP2Accuracy_NBLG
	String wList_Acc = wavelist("SP2Accuracy*",";","TEXT:0")
	Make/o/d/n=(npnts) SP2Accuracy_ErrAbs_BBHG
	Make/o/d/n=(npnts) SP2Accuracy_ErrRel_BBHG
	Make/o/d/n=(npnts) SP2Accuracy_ErrAbs_BBLG
	Make/o/d/n=(npnts) SP2Accuracy_ErrRel_BBLG
	Make/o/d/n=(npnts) SP2Accuracy_ErrAbs_NBHG
	Make/o/d/n=(npnts) SP2Accuracy_ErrRel_NBHG
	Make/o/d/n=(npnts) SP2Accuracy_ErrAbs_NBLG
	Make/o/d/n=(npnts) SP2Accuracy_ErrRel_NBLG
	string wList_ErrAbs = wavelist("SP2Accuracy_ErrAbs*", ";", "TEXT:0")
	string wList_ErrRel = wavelist("SP2Accuracy_ErrRel*", ";", "TEXT:0")
	
	//Idea behind SP2 accuracy:
	//Error_or_Accuracy = Gaussian Standard Deviation + Diam Error + Sample volume error + relative density error summed in quaterature
	//Mass_Err = sqrt((sigma)^2+(SP2_Err_SV)^2+(SP2_Err_Diam)^2+(SP2_Err_Density)^2)
	
	For(j=0;j<4;j++)
		Wave CurrInPutSdevWave = $stringfromlist(j,SdevList,";")
		Wave CurrInPutSigWave = $stringfromlist(j,SigList,";")
		Wave CurrOutPutWave = $stringfromlist(j,wList_Acc,";")
		Wave CurrErrAbsWave = $stringfromlist(j,wList_ErrAbs,";")
		Wave CurrErrRelWave = $stringfromlist(j,wList_ErrRel,";")
		For(i=0;i<npnts;i++)
			//Compute error from Mass Calibration (sdev of gaussian fit to histogram)
			 CurrOutPutWave[i] = Sqrt(((CurrInPutSdevWave[i])^2) + ((SP2_Err_SV)^2) + ((SP2_Err_Diam)^2) + ((SP2_Err_Density)^2))
			//Take signal into account and compute abs and error
			CurrErrAbsWave[i] = CurrInPutSigWave[i]*Sqrt(((CurrInPutSdevWave[i])^2) + ((SP2_Err_SV)^2) + ((SP2_Err_Diam)^2) + ((SP2_Err_Density)^2))
			CurrErrRelWave[i] = CurrInPutSigWave[i]/CurrErrAbsWave[i]
		EndFor	
	Endfor
	
	//Put in a table
	Edit/N=SP2_Accuracy_Table
	appendtotable SP2Accuracy_ErrAbs_BBHG, SP2Accuracy_ErrRel_BBHG, SP2Accuracy_BBHG
	appendtotable SP2Accuracy_ErrAbs_BBLG, SP2Accuracy_ErrRel_BBLG, SP2Accuracy_BBLG
	appendtotable SP2Accuracy_ErrAbs_NBHG, SP2Accuracy_ErrRel_NBHG, SP2Accuracy_NBHG
	appendtotable SP2Accuracy_ErrAbs_NBLG, SP2Accuracy_ErrRel_NBLG, SP2Accuracy_NBLG


End


Function SP2_ApplyAccuracy_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			variable SP2_Accuracy
			
			string BBHG_Sig_Str = "BBHG_"
			string BBLG_Sig_str = "BBLG_"
			string NBHG_Sig_str = "NBHG_"
			string NBLG_Sig_str = "NBLG_"
			
			prompt SP2_Accuracy, "What is the overall SP2 accuracy (%)?"
			prompt BBHG_Sig_Str, "Please enter the BBHG Mass or Diameter wave wave to be used."
			prompt BBLG_Sig_str, "Please enter the BBLG Mass or Diameter to be used."
			prompt NBHG_Sig_str, "Please enter the NBHG Mass or Diameter to be used."
			prompt NBLG_Sig_str, "Please enter the NBLG Mass or Diameter to be used."
			
			doprompt "Please Enter the following infomation.", SP2_Accuracy,BBHG_Sig_Str,BBLG_Sig_str,NBHG_Sig_str,NBLG_Sig_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave BBHG_Sig = $BBHG_Sig_Str
			wave BBLG_Sig = $BBLG_Sig_str
			wave NBHG_Sig = $NBHG_Sig_str
			wave NBLG_Sig = $NBLG_Sig_str
			SP2_ApplyAcc(SP2_Accuracy,BBHG_Sig,BBLG_Sig,NBHG_Sig,NBLG_Sig)	
		case 2:
			break
		endswitch
End

//4/23/2025 AJD: With the Accuracy generated from SP2_CalibrationAccuracy(), apply it to a diameter or mass wave
//Best to apply it to a mass wave imo. Other uncertainties are included in the converstion to diameter
Function SP2_ApplyAcc(SP2_Accuracy,BBHG_Sig,BBLG_Sig,NBHG_Sig,NBLG_Sig)
	
	//Establish Function Parameters
	Wave BBHG_Sig,BBLG_Sig,NBHG_Sig,NBLG_Sig
	variable SP2_Accuracy
	
	//Estblish Local Parameters	
	variable nrows_sig = dimsize(BBHG_Sig,0)
	make/o/d/n=(nrows_Sig) BBHG_AccRange_Upper;make/o/d/n=(nrows_Sig) BBLG_AccRange_Upper;make/o/d/n=(nrows_Sig) NBHG_AccRange_Upper;make/o/d/n=(nrows_Sig) NBLG_AccRange_Upper
	make/o/d/n=(nrows_Sig) BBHG_AccRange_Lower;make/o/d/n=(nrows_Sig) BBLG_AccRange_Lower;make/o/d/n=(nrows_Sig) NBHG_AccRange_Lower;make/o/d/n=(nrows_Sig) NBLG_AccRange_Lower
	
	
	//Idea: For each wave (BBHG, BBLG, NBHG, NBLG) generate an upper and lower accuracy wave.
	//i.e. if a mass is 1 fg and we have an accuracy of 10% the waves at that point will be 1.1 fg (upper) and 0.9 fg lower
	//Upper boundry calculation: Sig+(Sig*Accuracy/100)
	//Lower boundry calculation: Sig-(Sig*Accuracy/100)
	BBHG_AccRange_Upper = (BBHG_Sig+(BBHG_Sig*(SP2_Accuracy/100)))
	BBHG_AccRange_Lower = (BBHG_Sig-(BBHG_Sig*(SP2_Accuracy/100)))
	BBLG_AccRange_Upper = (BBLG_Sig+(BBLG_Sig*(SP2_Accuracy/100)))
	BBLG_AccRange_Lower = (BBLG_Sig-(BBLG_Sig*(SP2_Accuracy/100)))
	NBHG_AccRange_Upper = (NBHG_Sig+(NBHG_Sig*(SP2_Accuracy/100)))
	NBHG_AccRange_Lower = (NBHG_Sig-(NBHG_Sig*(SP2_Accuracy/100)))
	NBLG_AccRange_Upper = (NBLG_Sig+(NBLG_Sig*(SP2_Accuracy/100)))
	NBLG_AccRange_Lower = (NBLG_Sig-(NBLG_Sig*(SP2_Accuracy/100)))
	
	//Make ErrWaves
	make/o/d/n=(nrows_Sig) BBHG_Err;make/o/d/n=(nrows_Sig) BBLG_Err;make/o/d/n=(nrows_Sig) NBHG_Err;make/o/d/n=(nrows_Sig) NBLG_Err
	
	//Do the same as above but do not add the inital mass or diameter
	BBHG_Err = (BBHG_Sig*(SP2_Accuracy/100))
	BBLG_Err = (BBLG_Sig*(SP2_Accuracy/100))
	NBHG_Err = (NBHG_Sig*(SP2_Accuracy/100))
	NBLG_Err = (NBLG_Sig*(SP2_Accuracy/100))
		
End










Function/Wave NAD(w, p1, p2)

	wave w
	variable p1,p2
	
	string wname = nameofwave(w)+"_NAD"
	
	
	duplicate/O/R=[p1,p2] w, $wname
	wave NAD = $wname
	NAD = nan
	
	variable npnts = numpnts(w)
	variable i,k, num, denom_D,denom_CIMS, output
	
	for(i=p1;i<p2+1;i++)
		num = (w[i] - w[i-1])
		denom_D  = ((w[i]+w[i-1])/2) //Delphine approach
		denom_CIMS = sqrt((w[i]*w[i-1]))
		output = num/denom_CIMS
		NAD[k] = output
		k++
	endfor


	return NAD
End

Function SP2_Precision_Gaussfit(w)

	wave w
	string HistName = nameofwave(w)+"_Hist4SP2Precison"
	
	
	//Make Hist
	Make/N=100/O $HistName;DelayUpdate
	Histogram/B=1 w, $HistName
	Display $Histname
	
	//Gaussian Fit
	CurveFit/TBOX=1023 gauss $HistName /D 


End

Function SP2_PrecisionfromNAD(sigw,p1,p2)

	wave sigw
	variable p1,p2
	
	wave NADw = NAD(sigw, p1, p2)	
	SP2_Precision_Gaussfit(NADw)


End






Function pUnderOver_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			string sigwavestr_Str = ""
			variable MinCut
			
			prompt sigwavestr_Str, "Please enter the signal wave to be used."
			prompt MinCut, "Please enter the minimum cutoff for the signal wave."
			doprompt "Please enter the following information.", sigwavestr_Str, MinCut
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave SigWave = $sigwavestr_Str
			pUnderOver(SigWave, MinCut)
					
		case 2:
			break
		endswitch
End

//Function takes a signal wave and provides % of the time the wave is under or at/above a minimum cuttoff

Function pUnderOver(SigWave, MinCut)

	//Establish Function Parameters
	wave SigWave
	variable MinCut
	
	//Establish Local Parameters
	variable punder, pover, pTotal,i
	variable npnts = numpnts(sigwave)
	
	//Create loop
	for(i=0;i<npnts;i++)
		if(SigWave[i]<MinCut) 
			pUnder++
		elseif(SigWave[i]>=MinCut)	
			pOver++
		endif
	endfor
	
	//Determine % numbers
	ptotal = punder+pover
	punder = (punder/ptotal)*100
	pover = (pover/ptotal)*100
	
	print nameofwave(SigWave)+" contributes above "+num2str(mincut)+"% "+num2str(pover)+"% of the time, and contributes below "+num2str(mincut)+"% "+num2str(punder)+"% of the time."


end


















/////////////////////////////////////////////////////////////////////
///////////////////Ucertainty and other in-depth calcs///////////////
/////////////////////////////////////////////////////////////////////


Function rBCCTStatatLevel_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			string rBCCT_Str = ""
			string OtherWave_str = ""
			variable MinCut
			
			prompt rBCCT_Str, "Please enter the Coatings wave to be used."
			prompt OtherWave_str, "Please enter the signal wave to be used."
			prompt MinCut, "Please enter the minimum cutoff for the signal wave."
			doprompt "Please enter the following information.", rBCCT_Str,OtherWave_str, MinCut
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave rBCCT = $rBCCT_Str
			wave OtherWave = $OtherWave_str
			rBCCTStatsatLevel(rBCCT, OtherWave, MinCut)
					
		case 2:
			break
		endswitch
End

Function rBCCTStatsatLevel(rBCCT, OtherWave, MinCut)
	
	//Establish parameters
	wave rBCCT, OtherWave
	variable MinCut
	
	//Perform some checks
	variable nptns_rBCCT = dimsize(rBCCT,0)
	variable npnts_OtherWave = dimsize(OtherWave,0)
	//Check to see they are both the same dimensions
	if(nptns_rBCCT != npnts_OtherWave)
		Abort "The waves inputted are not the same dimensions!"
	else
	Endif
	
	//Establish other parameters
	string newwavename_min = nameofwave(rBCCT)+"_AboveMinCut_"+num2str(MinCut)+"_by_"+nameofwave(OtherWave)
	string newwavename_max = nameofwave(rBCCT)+"_belowMinCut_"+num2str(MinCut)+"_by_"+nameofwave(OtherWave)
	Duplicate/O rBCCT, $newwavename_min
	Duplicate/O rBCCT, $newwavename_max
	wave tempwave1 = $newwavename_min
	wave tempwave2 = $newwavename_max
	variable i 
	
	for(i=0;i<nptns_rBCCT;i++)
		if(OtherWave[i]<MinCut) //In this case the other wave is below the minimum cut, and therefore we should take the wave that stores the 'above minimum cuts' values and NaN it; perserving only values above the minimum cut
			tempwave1[i] = NaN
		elseif(OtherWave[i]>MinCut)	//In this case the other wave is above the mimimum cut, and therefore we should take the wave that stores the 'below minimum cuts' values and NaN it; perserving only values below the minimum cut
			tempwave2[i] = NaN
		endif
	Endfor	
	
	//Perform some stats
	string StatsWaveAvg_Str1 = "Avg_Stats_"+nameofwave(rBCCT)+"_belowMinCut_"+num2str(MinCut)+"_by_"+nameofwave(OtherWave)
	string StatsWaveAvg_Str2 = "Avg_Stats_"+nameofwave(rBCCT)+"_aboveMinCut_"+num2str(MinCut)+"_by_"+nameofwave(OtherWave)
	string StatsWaveMedian_Str1 = "Median_Stats_"+nameofwave(rBCCT)+"_belowMinCut_"+num2str(MinCut)+"_by_"+nameofwave(OtherWave)
	string StatsWaveMedian_Str2 = "Median_Stats_"+nameofwave(rBCCT)+"_aboveMinCut_"+num2str(MinCut)+"_by_"+nameofwave(OtherWave)
//	make/O/D/N=(2,2) $StatsWave_Str1
//	note $StatsWave_Str, "First Column is Average and second Column is Median."
//	note $StatsWave_Str, "First Row is values above the minimum cut and the second row is values below the minimim cut."
	
//	wave StatsWave = $StatsWave_Str
	
	wavetransform zapnans Tempwave1
	wavetransform zapnans Tempwave2
	
	//Perform numpnts check to make sure we can do the statistics
	variable checkpntsw1, checkpntsw2
	checkpntsw1 = dimsize(Tempwave1,0)
	checkpntsw2 = dimsize(Tempwave2,0)
	
	if(checkpntsw1<=2) //Need at least two points to run the ttest, technically I think we can run the Wilcoxon Rank Test with 1 point but lets just do two for safety. 
		//Can't run the stats due to the lack of points
		killwaves/Z Tempwave1
		killwaves/Z Tempwave2
		Abort "The "+nameofwave(OtherWave)+ " does not have enough points ("+num2str(checkpntsw1)+" points) with coatings to perform statistics."
	elseif(checkpntsw2<=2)
		//Can't run the stats due to the lack of points
		killwaves/Z Tempwave1
		killwaves/Z Tempwave2
		Abort "The "+nameofwave(OtherWave)+ " does not have enough points ("+num2str(checkpntsw1)+" points) with coatings to perform statistics."
	endif
	
	
	
	StatsWilcoxonRankTest/APRX=2/T=1/Q/TAIL=4 Tempwave1, Tempwave2
	string Wilcoxon_str = "Wilcoxon_Test_"+nameofwave(OtherWave)
	Killwaves/Z $Wilcoxon_Str
	rename W_WilcoxonTest, $Wilcoxon_str
	Wave TempWilcoxon = $Wilcoxon_str
	
	StatsTTest/T=1/Q/CI Tempwave1, Tempwave2
	string TTest_Str = "TTest_"+nameofwave(OtherWave)
	Killwaves/Z $TTest_Str
	rename W_StatsTTest,$TTest_Str
	Wave TempTTest = $TTest_Str
	
	Killwaves/Z M_WaveStats
	KillWaves/Z W_StatsQuantiles
	WaveStats/Q/W Tempwave1
	rename M_WaveStats, $StatsWaveAvg_Str1
	StatsQuantiles/Q Tempwave1
	rename W_StatsQuantiles, $StatsWaveMedian_Str1
	WaveStats/Q/W Tempwave2
	rename M_WaveStats, $StatsWaveAvg_Str2 
	StatsQuantiles/Q Tempwave2
	rename W_StatsQuantiles, $StatsWaveMedian_Str2
	
	//Provide information to user
	Variable Wilcoxon_UpperTail, Wilcoxon_LowerTail, Wilcoxon_TwoTail, TTest_LowCritical, TTest_HighCritical, TTest_Statistic, TTest_P,TTest_Accept
	Wilcoxon_UpperTail = TempWilcoxon[6]
	Wilcoxon_LowerTail = TempWilcoxon[5]
	Wilcoxon_TwoTail = TempWilcoxon[7]
	TTest_LowCritical = TempTTest[11]
	TTest_HighCritical = TempTTest[12]
	TTest_Statistic = TempTTest[8]
	TTest_P = TempTTest[9]
	TTest_Accept = TempTTest[17]
	
	if(TTest_Accept==0)//If we reject the null
		//First TTest
		string MessageStr = "The T-test has rejected the null hypothesis (that there is no difference between the populations)."
		MessageStr+= "\rT-test low critical is" + num2str(TTest_LowCritical)+"."
		MessageStr+= "\rT-test high critical is" + num2str(TTest_HighCritical)+"."
		MessageStr+= "\rT-test statistic is" + num2str(TTest_Statistic)+"."
		MessageStr+= "\rT-test P is " + num2str(TTest_P)+"."
		MessageStr+= "\r"
		//Now Wilcoxon Rank test (look at two tail)
		if(Wilcoxon_TwoTail<0.05)
			MessageStr+="The wilcoxon ranked test two tail P is less than 0.05 ("+num2str(Wilcoxon_TwoTail)+")."
			MessageStr+="\rThe wilcoxon ranked test upper tail P ("+num2str(Wilcoxon_UpperTail)+")."
			MessageStr+="\rThe wilcoxon ranked test lower tail P ("+num2str(Wilcoxon_LowerTail)+")."
		elseif(Wilcoxon_TwoTail>0.05)
			MessageStr+="\rThe wilcoxon ranked test two tail P is more than 0.05 ("+num2str(Wilcoxon_TwoTail)+")."
			MessageStr+="\rThe wilcoxon ranked test upper tail P is ("+num2str(Wilcoxon_UpperTail)+")."
			MessageStr+="\rThe wilcoxon ranked test lower tail P is ("+num2str(Wilcoxon_LowerTail)+")."
			MessageStr+= "\r"
		endif
	elseif(TTest_Accept==1)//If we accept the null
		//First TTest
		MessageStr = "The T-test has accepted the null hypothesis (that there is no difference between the populations)."
		MessageStr+= "\rT-test low critical is" + num2str(TTest_LowCritical)+"."
		MessageStr+= "\rT-test high critical is" + num2str(TTest_HighCritical)+"."
		MessageStr+= "\rT-test statistic is" + num2str(TTest_Statistic)+"."
		MessageStr+= "\rT-test P is " + num2str(TTest_P)+"."
		MessageStr+= "\r"
		//Now Wilcoxon Rank test (look at two tail)
		if(Wilcoxon_TwoTail<0.05)
			MessageStr+="The wilcoxon ranked test two tail P is less than 0.05 ("+num2str(Wilcoxon_TwoTail)+")."
			MessageStr+="\rThe wilcoxon ranked test upper tail P is ("+num2str(Wilcoxon_UpperTail)+")."
			MessageStr+="\rThe wilcoxon ranked test lower tail P is ("+num2str(Wilcoxon_LowerTail)+")."
		elseif(Wilcoxon_TwoTail>0.05)
			MessageStr+="\rThe wilcoxon ranked test two tail P is more than 0.05 ("+num2str(Wilcoxon_TwoTail)+")."
			MessageStr+="\rThe wilcoxon ranked test upper tail P is ("+num2str(Wilcoxon_UpperTail)+")."
			MessageStr+="\rThe wilcoxon ranked test lower tail P is ("+num2str(Wilcoxon_LowerTail)+")."
			MessageStr+= "\r"
		endif
		
	endif
	
	DoAlert/T="Stats Result" 0, MessageStr
	
End
		

Function SP2_Uncert(pScatt, prBC)

//First figure out the 22% Scatt and 12% rBC to get 40% uncert in rBC Containing Particle

	Variable pScatt, prBC
	
	//Get from % to decimal
	pScatt/=100
	prBC/=100
	
	//Square root calc with add subtract rules?
	Variable Err = Sqrt((pScatt)^2+(prBC)^2)
	//Back to % space 
	Err*=100
	Print num2str(Err)+"%"
	


End		

		
		
Function PMF_MSS_Graph_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert 1, "Are you sure that you are in the PMF_Imported_Waves DF? Also ensure that there the MSS_Base wave in the PMFS datafolder."
			if(V_Flag==1)
			elseif(V_flag==2)
				Abort "User Aborted."
			endif
			variable nFactor, fPeak
	
			prompt fPeak, "Please enter the fPeak desired (-1 to 1 with intervals of 0.2, no rotations can be entered as '0'\r For example an fPeak of -0.8 would be entered as -08."
			prompt nFactor, "Please enter desired Factor. This code operates with 10 or less."
			doprompt "Please Enter the following infomation.", fPeak, nFactor
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			PMF_MSS_graph(nFactor,fPeak)
			
		case 2:
			break
		endswitch
end


Function PMF_MSS_graph(nFactor,fPeak)
	
	//Establish Parameters
	variable nFactor, fPeak
	
	//Establish strings for naming things
	string namelist = "", namebase = "PMFS", name_f = "F"
	variable i, k
	for(i=0;i<nFactor;i++)
		string name2add = namebase+num2str(nFactor)+name_f+num2str(i+1) //PMF;9;SF;1
		namelist+=name2add+";"
	endfor
	
	//Determine what data folder we are in
	DFREF StartDF = getdatafolderDFR()
	
	//Create nessesary lists to find the correct DF
	String FactorList = "", fPeakList = "", SubFolderList= ""
	FactorList = "PMFS1;PMFS2;PMFS3;PMFS4;PMFS5;PMFS6;PMFS7;PMFS8;PMFS9;PMFS10;"
	fPeakList = "fPNeg1;fPNeg08;fPNeg06;fPNeg04;fPNeg02;fP0;fP02;fP04;fP06;fP08;fP1"
	SubFolderList= "PMF_Diurnals;PMF_Factors;PMF_TSeries;"

	//Determine if user entered negative fPeak
	string Find_Factor_Str= "PMFS"+num2str(nFactor)
	if(fPeak<0)//if negative
		if(fpeak==-1)	//if negative 1 do not include zero
			string Find_fPeak_Str = "fPNeg"+num2str(abs(fPeak))
		else
			Find_fPeak_Str = "fPNeg0"+(num2str(abs(fPeak)))
		endif
	elseif(fPeak>0)	//if positive
		Find_fPeak_Str = "fP0"+num2str(abs(fPeak))
	elseif(fPeak==0) //if 0
		Find_fPeak_Str = "fP0"
	endif
	
	//With the established code ensure that we can find this in the lists
	variable testlist = WhichListItem(Find_Factor_Str, FactorList,";")
	if(TestList == -1)	//If there is an error
		abort "Error in Locating Factor from FactorList. Aborting."
	endif
	
	testlist = WhichListITem(Find_fPeak_Str,fPeakList)
	if(TestList == -1)	//If there is an error
		abort "Error in Locating fPeak from fPeakList. Aborting."
	endif
	
	if(cmpstr("PMFS0", Find_Factor_Str) == 0)//If they match
		abort "0 Factor Solution entered. Aborting."
	endif
	
	//Create DFREFs
	setdatafolder $find_Fpeak_Str
	DFREF fPeakDF = getdatafolderDFR()
	setdatafolder $find_Factor_Str
	DFREF FactorDF = getdatafolderDFR()
	string SubFolder_str = stringfromList(1,SubFolderList)
	setdatafolder $SubFolder_str
	DFREF SubFolderDF = getdatafolderDFR()
	
	string y_axis_list = wavelist("*", ";", "TEXT:0")
	
	
	setdatafolder FactorDF
	string x_axis_list = wavelist("*MSS*",";","TEXT:0")
	wave MSS_Base = $stringfromlist(0,x_axis_list,";")
	
	setdatafolder SubFolderDF
	string GraphName = "MSS_Graph_PMFS"+num2str(nFactor)
	Killwindow/Z $GraphName
	display/N=$GraphName
	//Find out how we should split the x_axis
	Variable Splitaxis = (100/nFactor)/100 //last /100 is to get it into decimal places
	variable Currhigh, currlow
	
	for(i=0;i<itemsInList(y_axis_list);i++)
		if(i==0)
			Currhigh = (Splitaxis*i)+SplitAxis //0*0.25+0.25 = 0.25; 1*0.25+0.25 = 0.5; 2*0.25+0.25 = 0.75 etc
			Currlow = Splitaxis*i	//0*0.25 = 0 ; 1*0.25 = 1; 2*0.25 = 0.5 etc
		elseif(i!=0)
			Currhigh = (Splitaxis*i)+SplitAxis //0*0.25+0.25 = 0.25; 1*0.25+0.25 = 0.5; 2*0.25+0.25 = 0.75 etc
			Currlow = (Splitaxis*i)+0.02	//0*0.25 = 0 ; 1*0.25 = 1; 2*0.25 = 0.5 etc + offset
		endif
		//Sometimes we will be a bit ahead of 1 which results in an error. 
		if(i==nFactor-1)
			Currhigh = 0.99
		Endif
		
		wave tempwave_y = $stringfromlist(i,y_axis_list,";")
		appendtograph/L=$nameofwave(tempwave_y) tempwave_y vs MSS_Base
		string GraphName_y = stringfromlist(i,y_axis_list,";")
		//Label Appropriate axis
//		Label/W=$GraphName $stringfromlist(k,y_axis_list,";"), "\\Z08"
		string labelLeft_str = ReplaceString("y_axis_",GraphName_y,"")
		Label/W=$GraphName $nameofwave(tempwave_y), "\\Z16"+labelLeft_str	
		ModifyGraph/W=$GraphName mode($nameofwave(tempwave_y))=1
		ModifyGraph/W=$GraphName lsize($nameofwave(tempwave_y))=2
		ModifyGraph/W=$GraphName rgb($nameofwave(tempwave_y))=(0,0,0)
		ModifyGraph/W=$GraphName AxisEnab($nameofwave(tempwave_y))={currlow,currhigh}
//		ModifyGraph/W=$GraphName freePos(MSS_Base)=0
	endfor

	SetAxis bottom *,100
//	Label left "µg m\\S-3\\M (?)";DelayUpdate
	Label bottom "m/Q"
	ModifyGraph axisEnab(bottom)={0.066,1}
	ModifyGraph nticks(bottom)=100,sep(bottom)=1
	
	setdatafolder StartDF

	
End
		
		
Function ACSM_MSS_Graph_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			string OrgMS_Str = ""
			string NO3MS_str = ""
			string SO4MS_str = ""
			string NH4MS_str = ""
			String ChlMS_str = ""
			string MSS_BaseWave_Str = ""
			
			prompt OrgMS_Str, "Please enter the Organic MS wave to be used."
			prompt NO3MS_str, "Please enter the Nitrate MS wave to be used."
			prompt SO4MS_str, "Please enter the Sulfate MS wave to be used."
			prompt NH4MS_str, "Please enter the Ammonium MS wave to be used."
			prompt ChlMS_str, "Please enter the Chloride MS wave to be used."
			prompt MSS_BaseWave_Str, "Please enter the MSS Basewave to be used. (This is the wave with the desired AMU's)"
			doprompt "Please Enter the following infomation.", OrgMS_Str,NO3MS_str, SO4MS_str, NH4MS_str, ChlMS_Str, MSS_BaseWave_Str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave Org_MS = $OrgMS_Str
			wave NO3_MS = $NO3MS_str
			wave SO4_MS = $SO4MS_str
			wave NH4_MS = $NH4MS_str
			wave Chl_MS = $ChlMS_Str
			wave MSS_Basewave = $MSS_BaseWave_Str
			MSS_graph(MSS_Basewave, Org_MS, NO3_MS, NH4_MS, SO4_MS, Chl_MS)
			
		case 2:
			break
		endswitch
end


Function MSS_graph(MSS_Basewave, Org_MS, NO3_MS, NH4_MS, SO4_MS, Chl_MS)
	wave MSS_Basewave, Org_MS, NO3_MS, NH4_MS, SO4_MS, Chl_MS
	
	display/N=MSS_Graph Org_MS vs MSS_Basewave
	string graph_name = "MSS_Graph"
	//appendtograph Org_MS vs MSS_BaseWave
	appendtograph No3_MS vs MSS_BaseWave
	appendtograph Nh4_MS vs MSS_BaseWave
	appendtograph SO4_MS vs MSS_BaseWave
	appendtograph Chl_MS vs MSS_BaseWave
	
	string wnamelist = tracenamelist("", ";",1)
	variable numtraces = Itemsinlist(wnamelist)
	variable i 
	for(i=0;i<numtraces;i++)
		string name = Stringfromlist(i, wnamelist)
		//printf("Trace %d, name=%s\r",i,name)
		if(i==0)
			Modifygraph rgb($name)=(3,52428,1), mode($name)=1,hbFill($name)=2
		elseif(i==1)
			ModifyGraph rgb($name)=(1,16019,65535), mode($name)=1,hbFill($name)=2
		elseif(i==2)
			ModifyGraph rgb($name)=(65535,43690,0),  mode($name)=1,hbFill($name)=2
		elseif(i==3)
			ModifyGraph mode($name)=1,hbFill($name)=2
		elseif(i==4)
			ModifyGraph rgb($name)=(65535,0,52428), mode($name)=1,hbFill($name)=2
		endif
	Endfor


	SetAxis bottom *,100
	Label left "µg m\\S-3\\M";DelayUpdate
	Label bottom "m/Q"
	ModifyGraph nticks(bottom)=100,sep(bottom)=1

	
End



/////////////////////////////////////////////////////////////////////
///////////////////////FUNCTIONS WITHOUT BUTTONS/////////////////////
/////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////
///////////////////////Minimum Time Difference///////////////////////
/////////////////////////////////////////////////////////////////////


//Button that runs the minimum time difference function
//This function will take a time or datetime wave and determine the minimum time difference within the wave. 
Function MinTDiff_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			//Inital Check: Is the user in a good Data Folder?
			doalert/T="Initial Check" 2, "Are you in the Data folder that holds the waves to be used?"
			if(V_Flag ==1)
			elseif(V_Flag==2)
				abort "User is not in a good Data Folder to run the code. Aborting."
			elseif(V_Flag==3)
				abort "User is not in a good Data Folder to run the code. Aborting."
			else
				abort "Unknown Input. Aborting."
			endif
		
			string twave_str
	
			prompt twave_str, "Please enter the time wave to be used."
			doprompt "Please Enter the following infomation.", twave_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave twave = $twave_str
			min_t_diff(twave)
			
		case 2:
			break
		endswitch
end

//This function 
function/D min_t_diff(twave) //Find the minimum time difference (time step) in a time wave; the /D flag is due to this function returning a double precision number (it was designed to be called by other functions).
	//Establish Parameters
	wave twave
	
	//Establish variables
	variable i, npnts, temp_min, test_temp_min, minpnt
	npnts = dimsize(twave,0)	//number of points in twave
	temp_min = abs(twave[1] - twave[0])//minimum point between twave at point 1 and point 0 (twave[0] and twave[1])
	
	for(i=0;i<(npnts-1);i++)
		test_temp_min = abs(twave[i+1] - twave[i])
		if(test_temp_min < temp_min && test_temp_min !=0)	//if the current and next point's time difference is smaller than the smallest difference up until that point then update the current smallest difference with the new smallest differnce just found.  
			temp_min = test_temp_min
			minpnt = i
		else
		endif
		
	endfor
	
	//Print what the smallest difference is and return it (in case this is function is called by another).
	print "Minimum Time Difference in wave '" + nameofwave(twave)+ "' is " + num2str(temp_min) + " seconds at point "+num2str(minpnt)+"."
	return temp_min
	
End


/////////////////////////////////////////////////////////////////////
/////////////////////////One to One Line/////////////////////////////
/////////////////////////////////////////////////////////////////////


//Button that runs the one2oneline code
Function one2oneLine_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
		
			//Inital Check: Is the user in a good Data Folder?
			doalert/T="Initial Check" 2, "Are you in the Data folder that holds the waves to be used?"
			if(V_Flag ==1)
			elseif(V_Flag==2)
				abort "User is not in a good Data Folder to run the code. Aborting."
			elseif(V_Flag==3)
				abort "User is not in a good Data Folder to run the code. Aborting."
			else
				abort "Unknown Input. Aborting."
			endif
		
			string xwave_str = ""
			string ywave_str = ""
	
			prompt xwave_str, "Please enter the xwave wave to be used."
			prompt ywave_str, "Please enter the ywave to be used."
			doprompt "Please Enter the following infomation.", xwave_str, ywave_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave xwave = $xwave_str
			wave ywave = $ywave_str
			one2oneline(ywave, xwave)
			
		case 2:
			break
		endswitch
end

//This function will create a 1:1 line to be used in a scatterplot. 
Function one2oneline(ywave, xwave)	// make a 1:1 line for a scatter plot where y = x (i.e. allow for a visualization of what the graph would look like if the y wave was equal to the x wave).
	//Establish parameters
	wave ywave, xwave
	
	//Establish variables ; I don't use these as the code changed but I am going to keep them here in case it changes in the future.
	variable npnts = dimsize(ywave,0)
	variable maxpnty,maxpntx, minpnty, minpntx
	maxpnty = wavemax(ywave)
	minpnty = wavemin(ywave)
	maxpntx = wavemax(xwave)
	minpntx = wavemin(ywave)

	//Create the 1:1 line and call it Temp_121_Line
	duplicate/O xwave, Temp_121_Line	//Duplicate the x_wave and then plot that on the y-axis to create the 1:1 line
	
	//Append the 1:1 line to the graph of intrest		
	String graphname_Str = ""
	prompt graphname_Str, "What is the name of the graph to append the signal wave to?"	
	doprompt "Please Enter the following infomation.", graphname_Str			
	AJD_Append2Graph(Temp_121_line,graphname_str)
	
 
	
End

//Expand a wave from its first point by an interval
Function Wave_ExpansionfromPoint(w,interval,startingpoint)

	wave w
	variable interval // in seconds
	variable startingpoint	//Index of point to start
	
	variable npnts = dimsize(w,0)
	variable start_point = startingpoint
	variable i, z 
	variable offset = (npnts - start_point)
	
	for(i=start_point;i<npnts;i++)
		w[i] = w[start_point]+(z*300)	
		z++
	endfor


End


/////////////////////////////////////////////////////////////////////
/////////////////////////Percentage Diff/////////////////////////////
/////////////////////////////////////////////////////////////////////


//Button that runs the pdiff code
Function PDiff_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			
			variable v1,v2
	
			prompt v1, "Please enter the first variable to be used."
			prompt v2, "Please enter the second variable to be used."
			doprompt "Please Enter the following infomation.", v1, v2
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			variable print_V = 1
			pdiff(v1,v2,print_V)
			
		case 2:
			break
		endswitch
end

//This function will determine the percent difference between two numbers provided by the user
//This function was designed to be called by other functions so it has the /D flag to return a double precision number; it will also print out the percent difference
function/D pdiff(v1,v2, print_V)
	//Establish Parameters
	variable v1, v2, print_V //2 numbers to find % difference with; print_V is to determine if the percentage difference found should be printed to the command line. 
	
	//Establish variables
	variable pD	//Difference in %
	variable numerator, denominator
	
	//Determine numerator and denominator for the percent difference calculation
	numerator = abs(v1-v2)	//partial calc 1
	denominator = (v1+v2)/2 //partial calc 2
	
	//Throw previous calcs together and determine the percent difference
	pD = (numerator/denominator)*100		//calculation put together
	
	string pstring = num2str(pD) + " %"
	
	if(print_V==0)
		//Do nothing if Print_V is equal to zero
	elseif(print_V==1)
		print pstring	//if Print_V is equal to one then print to the command line
	Endif
	
	return pD
End

//Button that runs the pdiffwave function
Function PDiff_Wave_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			doalert/T="Data Folder Check" 2, "Are you in the data folder with the waves of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Not in the correct Data Folder. Aborting procedure."
			endif
		
			string w1_str = ""
			string w2_str = ""
	
			prompt w1_str, "Please enter the first wave to be used."
			prompt w2_str, "Please enter the second wave to be used."
			doprompt "Please Enter the following infomation.", w1_str, w2_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave w1 = $w1_str
			wave w2 = $w2_str
			pdiffwave(w1,w2)
			
		case 2:
			break
		endswitch
end


//This function will determine the percent difference of two waves at each point of the wave
function pdiffwave(w1,w2)
	//Establish Parameters
	wave w1, w2
	
	//Establish Variables
	variable nrows = dimsize(w1,0)
	variable print_V = 0
	variable i, pD
	variable wn1,wn2
	string newwavename = "Percentdiff_"+nameofwave(w1)+"_and_"+nameofwave(w2)
	
	make/o/n=(nrows) $newwavename
	wave w = $newwavename
	
	for(i=0;i<nrows;i++)
		wn1 = w1[i]
		wn2 = w2[i]
		w[i] = pdiff(wn1,wn2,print_V)
	Endfor

End


/////////////////////////////////////////////////////////////////////
///////////////////////////PMF Functions/////////////////////////////
/////////////////////////////////////////////////////////////////////

Function PMF_dfBuilder_button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert 1, "Are you in the Datafolder that you want to build the PMF DF hierarcy in?"
			if(V_Flag==1)
			elseif(V_flag==2)
				Abort "User Aborted."
			endif
//			string twave_str = ""
//			variable nfactors
	
//			prompt twave_str, "Please enter the name of the time wave to be used."
//			prompt nfactors, "Please enter number of PMF factors. This code is meant to operate with 10 or less."
//			doprompt "Please Enter the following infomation.", twave_str, nfactors
//			if(V_Flag==0)
//			elseif(V_flag==1)
//				Abort "User Aborted."
//			endif
//			wave twave = $twave_str
			PMF_dfBuilder()
			
		case 2:
			break
		endswitch
end


Function PMF_dfBuilder()

	//Get data folders and create lists
	DFREF StartDF = getdatafolderDFR()
	String FactorList = "", fPeakList = "", SubFolderList= ""
	FactorList = "PMFS1;PMFS2;PMFS3;PMFS4;PMFS5;PMFS6;PMFS7;PMFS8;PMFS9;PMFS10;"
	fPeakList = "fPNeg1;fPNeg08;fPNeg06;fPNeg04;fPNeg02;fP0;fP02;fP04;fP06;fP08;fP1"
	SubFolderList= "PMF_Diurnals;PMF_Factors;PMF_TSeries;"
	variable nFactors = itemsInList(FactorList,";")
	variable nfPeaks = itemsInList(fPeakList, ";")
	variable nSubFolders = itemsInList(SubFolderList, ";")
	variable i, k, l //Looping variable
	
	//Create the parent DF
	newdatafolder/O/S PMF_Imported_Waves
	DFREF PMF_Base = getdatafolderDFR()
	
	//Create the Database
	For(i=0;i<nfPeaks;i++)
	//To start out make a fPeak Folder
		string newDFstring = stringfromlist(i,fPeakList,";")
		DFREF newDFREF = getdatafolderDFR()
		NewDatafolder/O/S $newDFstring
		//Now that we have the fPeak folder, create the Factor folder 
		for(k=0;k<nFactors;k++)
			newDFstring = stringfromlist(k, FactorList, ";")
			newDFREF =  getdatafolderDFR()
			NewDataFolder/O/S $newDFstring
			//Now that we have created the Factor folder, create the SubFolders
			for(l=0;l<nSubFolders;l++)
				newDFstring = stringfromlist(l, SubFolderList,";")
				Newdatafolder/O $newDFString
			endfor
			//Set df Back to previous one
			setdatafolder newDFREF 
		Endfor
	setdatafolder PMF_Base 
	endfor
	//Create Correlations DF
	setdatafolder PMF_Base
	NewDataFolder/O/S PMF_Correlation_Holder //Will hold correlation waves 
	setdatafolder PMF_Base
	NewDataFolder/O/S PMF_Correlations
	setdatafolder StartDF
	NewDataFolder/O/S PMF_Diurnals
	setdatafolder Start_DF
	NewDataFolder/O/S MET_Data
	setdatafolder Start_DF
	
End

Function PMF_Correlations_button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert 1, "Are you sure that you are in the PMF_Imported_Waves DF?"
			if(V_Flag==1)
			elseif(V_flag==2)
				Abort "User Aborted."
			endif
			variable nFactor, fPeak
	
			prompt fPeak, "Please enter the fPeak desired (-1 to 1 with intervals of 0.2, no rotations can be entered as '0'\r For example an fPeak of -0.8 would be entered as -08."
			prompt nFactor, "Please enter desired Factor. This code operates with 10 or less."
			doprompt "Please Enter the following infomation.", fPeak, nFactor
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			PMF_Correlations(fPeak, nFactor)
			
		case 2:
			break
		endswitch
end

Function PMF_Correlations(fPeak, nFactor)

	//Establish Parameters
	variable fPeak, nFactor
	
	//Determine what data folder we are in
	DFREF StartDF = getdatafolderDFR()
	
	//Create nessesary lists to find the correct DF
	String FactorList = "", fPeakList = "", SubFolderList= ""
	FactorList = "PMFS1;PMFS2;PMFS3;PMFS4;PMFS5;PMFS6;PMFS7;PMFS8;PMFS9;PMFS10;"
	fPeakList = "fPNeg1;fPNeg08;fPNeg06;fPNeg04;fPNeg02;fP0;fP02;fP04;fP06;fP08;fP1"
	SubFolderList= "PMF_Diurnals;PMF_Factors;PMF_TSeries;"
	
	//Create variables
	variable i, k 

	//Determine if user entered negative fPeak
	string Find_Factor_Str= "PMFS"+num2str(nFactor)
	if(fPeak<0)//if negative
		if(fpeak==-1)	//if negative 1 do not include zero
			string Find_fPeak_Str = "fPNeg"+num2str(abs(fPeak))
		else
			Find_fPeak_Str = "fPNeg0"+(num2str(abs(fPeak)))
		endif
	elseif(fPeak>0)	//if positive
		Find_fPeak_Str = "fP0"+num2str(abs(fPeak))
	elseif(fPeak==0) //if 0
		Find_fPeak_Str = "fP0"
	endif
	
	//With the established code ensure that we can find this in the lists
	variable testlist = WhichListItem(Find_Factor_Str, FactorList,";")
	if(TestList == -1)	//If there is an error
		abort "Error in Locating Factor from FactorList. Aborting."
	endif
	
	testlist = WhichListITem(Find_fPeak_Str,fPeakList)
	if(TestList == -1)	//If there is an error
		abort "Error in Locating fPeak from fPeakList. Aborting."
	endif
	
	if(cmpstr("PMFS0", Find_Factor_Str) == 0)//If they match
		abort "0 Factor Solution entered. Aborting."
	endif
	
	//Create DFREFs
	setdatafolder $find_Fpeak_Str
	DFREF fPeakDF = getdatafolderDFR()
	setdatafolder $find_Factor_Str
	DFREF FactorDF = getdatafolderDFR()
	string SubFolder_str = stringfromList(2,SubFolderList)
	setdatafolder $SubFolder_str
	DFREF SubFolderDF = getdatafolderDFR()
	setdatafolder StartDF
	string Correlation_Holder_Str = "PMF_Correlation_Holder"
	setdatafolder $Correlation_Holder_Str
	DFREF Correlation_HolderDF = getdatafolderDFR()
	setdatafolder StartDF
	string Correlations_Str = "PMF_Correlations"
	setdatafolder $Correlations_Str
	DFREF CorrelationsDF = getdatafolderDFR()
	
	//Make SubFolder to hold generated waves
	setdatafolder CorrelationsDF
	String OutPut_Str = "ScatterPlot_PMFS"+num2str(nFactor)
	NewDataFolder/O/S $OutPut_Str
	DFREF OutPut_DF = getdatafolderDFR()
	
	//Get nessesary Lists
	Setdatafolder Correlation_HolderDF
	String y_axis_list = wavelist("*",";","TEXT:0")
	Setdatafolder SubFolderDF
	String x_axis_list = wavelist("*",";","TEXT:0")
	
	//Test to make sure that the number of points are the same
	variable testPMF = dimsize($stringfromList(0,x_axis_list,";"),0)
	SetDatafolder Correlation_HolderDF
	variable testSignal = dimsize($stringfromList(0,y_axis_list,";"),0)
	
	if(testPMF!=testSignal)
		abort "Waves are not equal in points. Aborting."
	endif
	

	//Create a list of bottom_axis_list for graphing
	string bottom_axis_list = "" 
	for(i=0;i<nFactor;i++)
		string currwavename = "PMFS"+num2str(nFactor)+"F"+num2str(i+1) //PMFS4F1
		bottom_axis_list += currwavename+";"
	Endfor
	currwavename = "" 

	//We now have our x-axis, y-axis and our bottom axis names
	
	//Next duplicate our waves to our new folder
	//The idea here is to duplicate our y_axis waves to ensure that we curve fit things well
	//i.e. f44 -> f44_PMF5SF1, f44_PMF5SF2 etc. This way we have seperate waves to curve fit too
	setdatafolder Correlation_HolderDF
	for(i=0;i<itemsinlist(y_axis_list,";");i++)
		wave tempwave = $stringfromlist(i,y_axis_list,";")
		string currwavename_yaxis = stringfromlist(i,y_axis_list,";")
		//Next loop through the number of PMFfactors we have
		for(k=0;k<nFactor;k++)
			wave tempwave = $stringfromlist(i,y_axis_list,";")
			string currwavename_xaxis = stringfromlist(k,x_axis_list,";")
			string dupwavename = currwavename_yaxis +"_"+ currwavename_xaxis
			duplicate/O tempwave, OutPut_DF:$Dupwavename
		endfor
	endfor

	setdatafolder SubFolderDF
	//Now we have our duplicated y_waves in our PMF folder that are ready for graphing and correlations, so we need to duplicate our x_waves (PMF_TSeriesFactor waves)
	for(i=0;i<nFactor;i++)
		wave tempwave = $stringfromlist(i,x_axis_list,";")
		Dupwavename = stringfromlist(i,x_axis_list,";")
		duplicate/O tempwave, OutPut_DF:$Dupwavename
	
	endfor

	setdatafolder OutPut_DF

	//Okay, everything has been duplicated and moved over to the new data folder; so we are ready to do some graphing
	//and correlations. 
	//The idea here is to make a graph that has all of the different factors vs their PMF counterparts and then to 
	//establish a wave that will hold the correlations and slopes (as well as printing out some information on a textbox)
	//on the graph.
	
	
	//Matrix for R2 and slope
		variable nrows = itemsinlist(x_axis_list,";")
		variable ncolums = itemsinlist(y_axis_list,";")
		Make/O/D/N=(nrows,ncolums) Correlation_Matrix
		Note Correlation_Matrix, "Rows (top to bottom) are: " + x_axis_list
		Note Correlation_Matrix, "Columns(left to right) are: " + y_axis_list
		Make/O/D/N=(nrows,ncolums) Slope_Matrix
		Note Slope_Matrix, "Rows (top to bottom) are: " + x_axis_list
		Note Slope_Matrix, "Columns(left to right) are: " + y_axis_list
	
	
//	//Do all graphing through a loop to cover all of the factors we have
	for(i=0;i<itemsinlist(y_axis_list,";");i++)
		//Establish the name of the Graph to append things too
		string GraphName_y = stringfromlist(i,y_axis_list,";")
		GraphName_y = ReplaceString("y_axis_",GraphName_y, "")
		string GraphName_x = "PMFS"+num2str(nFactor)
		string GraphName = "ScatterPlot_"+GraphName_y+"_vs_"+GraphName_x
		
		//Establish waves that contain what we will be graphing 
		string graphlist_y_support = "*"+GraphName_y+"*"
		string graphlist_y = wavelist(graphlist_y_support,";","Text:0")
		string graphlist_x = x_axis_list	//To help fight against wavelist not getting waves in the correct order
//		string graphlist_x = wavelist("PMF*",";","Text:0")
		
		//Find out how we should split the x_axis
		Variable Splitaxis = (100/nFactor)/100 //last /100 is to get it into decimal places
		variable Currhigh, currlow
		
		//Start Graphing (ensure we get rid of another window of the same type)
		Killwindow/Z $GraphName
		Display/N=$GraphName
		
		//Start a loop to begin the appending of traces
		for(k=0;k<nFactor;k++)
			//First establish the waves
			wave tempwave_x = $stringfromlist(k,graphlist_x, ";")
			wave tempwave_y = $stringfromlist(k,graphlist_y, ";")
			//Now append the waves
			Appendtograph/W=$GraphName/B=$stringfromlist(k,bottom_axis_list,";") tempwave_y vs tempwave_x
			//Now edit the graph to account for the fact we are putting multiple waves on it
			if(k==0)
				Currhigh = (Splitaxis*k)+SplitAxis //0*0.25+0.25 = 0.25; 1*0.25+0.25 = 0.5; 2*0.25+0.25 = 0.75 etc
				Currlow = Splitaxis*k	//0*0.25 = 0 ; 1*0.25 = 1; 2*0.25 = 0.5 etc
			elseif(k!=0)
				Currhigh = (Splitaxis*k)+SplitAxis //0*0.25+0.25 = 0.25; 1*0.25+0.25 = 0.5; 2*0.25+0.25 = 0.75 etc
				Currlow = (Splitaxis*k)+0.02	//0*0.25 = 0 ; 1*0.25 = 1; 2*0.25 = 0.5 etc + offset
			endif
			//Sometimes we will be a bit ahead of 1 which results in an error. 
			if(k==nFactor-1)
				Currhigh = 0.99
			Endif
			ModifyGraph/W=$GraphName mode($nameofwave(tempwave_y))=2,lsize($nameofwave(tempwave_y))=2,rgb($nameofwave(tempwave_y))=(0,0,0), AxisEnab($stringfromlist(k,bottom_axis_list,";"))={currlow,currhigh}, freePos($stringfromlist(k,bottom_axis_list,";"))=0
			//Label Appropriate axis
			Label/W=$GraphName $stringfromlist(k,bottom_axis_list,";") "\\Z08"+nameofwave(tempwave_x)
			string labelLeft_str = ReplaceString("y_axis_",GraphName_y,"")
			Label/W=$GraphName left "\\Z16"+labelLeft_str
			//Now make the curve fit
			CurveFit/Q line $nameofwave(tempwave_y) /X=$nameofwave(tempwave_x) /D 
			//Create the textbox and wave to store information
			TextBox/W=$GraphName/A=LT/F=2 "\\Z07\f01"+labelLeft_str+" vs "+nameofwave(tempwave_x)+"\rR\S2\M\\Z07\f01 = "+num2str(v_R2) + "\rSlope = " + num2str(v_sigb)
			//Update our slope and correlation matrix
			Correlation_Matrix[k][i] = v_R2
			Slope_Matrix[k][i] = v_sigb
			
		endfor	
	Endfor
	
	string Tablename = "MatrixTable_"+GraphName_x
	Killwindow/Z $TableName
	Edit/N=$Tablename 
	Appendtotable/W=$TableName Correlation_Matrix
	Appendtotable/W=$TableName Slope_Matrix 
	
	setdatafolder StartDF
	doalert/T="Code Completion Message" 0, "The code has been ran, ensure that the correlations seem sound as sometimes there are errors in organizing the string list of PMF factors. If so then drag the waves to the root and then back into the folder."

	setdatafolder StartDF
End



Function PMF_TSeries_button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert 1, "Are you sure that you are in the PMF_Imported_Waves DF?"
			if(V_Flag==1)
			elseif(V_flag==2)
				Abort "User Aborted."
			endif
			variable nFactor, fPeak
	
			prompt fPeak, "Please enter the fPeak desired (-1 to 1 with intervals of 0.2, no rotations can be entered as '0'\r For example an fPeak of -0.8 would be entered as -08."
			prompt nFactor, "Please enter desired Factor. This code operates with 10 or less."
			doprompt "Please Enter the following infomation.", fPeak, nFactor
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			PMF_TSeries(fPeak, nFactor)
			
		case 2:
			break
		endswitch
end

Function PMF_TSeries(fPeak, nFactor)

	//Establish Parameters
	variable fPeak, nFactor
	
	//Determine what data folder we are in
	DFREF StartDF = getdatafolderDFR()
	
	//Create nessesary lists to find the correct DF
	String FactorList = "", fPeakList = "", SubFolderList= ""
	FactorList = "PMFS1;PMFS2;PMFS3;PMFS4;PMFS5;PMFS6;PMFS7;PMFS8;PMFS9;PMFS10;"
	fPeakList = "fPNeg1;fPNeg08;fPNeg06;fPNeg04;fPNeg02;fP0;fP02;fP04;fP06;fP08;fP1"
	SubFolderList= "PMF_Diurnals;PMF_Factors;PMF_TSeries;"
	
	//Create variables
	variable i, k 

	//Determine if user entered negative fPeak
	string Find_Factor_Str= "PMFS"+num2str(nFactor)
	if(fPeak<0)//if negative
		if(fpeak==-1)	//if negative 1 do not include zero
			string Find_fPeak_Str = "fPNeg"+num2str(abs(fPeak))
		else
			Find_fPeak_Str = "fPNeg0"+(num2str(abs(fPeak)))
		endif
	elseif(fPeak>0)	//if positive
		Find_fPeak_Str = "fP0"+num2str(abs(fPeak))
	elseif(fPeak==0) //if 0
		Find_fPeak_Str = "fP0"
	endif
	
	//With the established code ensure that we can find this in the lists
	variable testlist = WhichListItem(Find_Factor_Str, FactorList,";")
	if(TestList == -1)	//If there is an error
		abort "Error in Locating Factor from FactorList. Aborting."
	endif
	
	testlist = WhichListITem(Find_fPeak_Str,fPeakList)
	if(TestList == -1)	//If there is an error
		abort "Error in Locating fPeak from fPeakList. Aborting."
	endif
	
	if(cmpstr("PMFS0", Find_Factor_Str) == 0)//If they match
		abort "0 Factor Solution entered. Aborting."
	endif
	
	//Create DFREFs
	setdatafolder $find_Fpeak_Str
	DFREF fPeakDF = getdatafolderDFR()
	setdatafolder $find_Factor_Str
	DFREF FactorDF = getdatafolderDFR()
	string SubFolder_str = stringfromList(2,SubFolderList)
	setdatafolder $SubFolder_str
	DFREF SubFolderDF = getdatafolderDFR()
	setdatafolder StartDF
	
	//Get nessesary Lists
	Setdatafolder SubFolderDF
	String y_axis_list = wavelist("*",";","TEXT:0")
	Setdatafolder FactorDF
	String x_axis_list = wavelist("*t*",";","TEXT:0") //Assume the time waves contains t and no other waves do 
	
	//Test to make sure that the number of points are the same
	variable testPMF = dimsize($stringfromList(0,x_axis_list,";"),0)
	SetDatafolder SubFolderDF
	variable testSignal = dimsize($stringfromList(0,y_axis_list,";"),0)
	
	if(testPMF!=testSignal)
		abort "Waves are not equal in points. Aborting."
	endif
	
	setdatafolder FactorDF
//	string x_axis_list = wavelist("*t*",";","TEXT:0")	//Assume the time waves contains t and no other waves do 
	wave tWave = $stringfromlist(0,x_axis_list,";")
	
	setdatafolder SubFolderDF
	string GraphName = "TSeries_Graph_PMFS"+num2str(nFactor)
	Killwindow/Z $GraphName
	display/N=$GraphName
	//Find out how we should split the x_axis
	Variable Splitaxis = (100/nFactor)/100 //last /100 is to get it into decimal places
	variable Currhigh, currlow
	
	for(i=0;i<itemsInList(y_axis_list);i++)
		if(i==0)
			Currhigh = (Splitaxis*i)+SplitAxis //0*0.25+0.25 = 0.25; 1*0.25+0.25 = 0.5; 2*0.25+0.25 = 0.75 etc
			Currlow = Splitaxis*i	//0*0.25 = 0 ; 1*0.25 = 1; 2*0.25 = 0.5 etc
		elseif(i!=0)
			Currhigh = (Splitaxis*i)+SplitAxis //0*0.25+0.25 = 0.25; 1*0.25+0.25 = 0.5; 2*0.25+0.25 = 0.75 etc
			Currlow = (Splitaxis*i)+0.02	//0*0.25 = 0 ; 1*0.25 = 1; 2*0.25 = 0.5 etc + offset
		endif
		//Sometimes we will be a bit ahead of 1 which results in an error. 
		if(i==nFactor-1)
			Currhigh = 0.99
		Endif
		
		wave tempwave_y = $stringfromlist(i,y_axis_list,";")
		appendtograph/L=$nameofwave(tempwave_y) tempwave_y vs tWave
		string GraphName_y = stringfromlist(i,y_axis_list,";")
		//Label Appropriate axis
//		Label/W=$GraphName $stringfromlist(k,y_axis_list,";"), "\\Z08"
		string labelLeft_str = ReplaceString("y_axis_",GraphName_y,"")
		Label/W=$GraphName $nameofwave(tempwave_y), "\\Z16"+labelLeft_str+"(µg/m\S3\M)"
//		ModifyGraph/W=$GraphName mode($nameofwave(tempwave_y))=1
//		ModifyGraph/W=$GraphName lsize($nameofwave(tempwave_y))=2
		ModifyGraph/W=$GraphName rgb($nameofwave(tempwave_y))=(0,0,0)
		ModifyGraph/W=$GraphName AxisEnab($nameofwave(tempwave_y))={currlow,currhigh}
//		ModifyGraph/W=$GraphName freePos(MSS_Base)=0
	endfor

//	SetAxis bottom *,100
//	Label left "µg m\\S-3\\M (?)";DelayUpdate
	Label bottom "DateTime"
	ModifyGraph axisEnab(bottom)={0.066,1}
	ModifyGraph nticks(bottom)=100,sep(bottom)=1
	
	setdatafolder StartDF

	


	setdatafolder StartDF
	doalert/T="Code Completion Message" 0, "The code has been ran, ensure that the correlations seem sound as sometimes there are errors in organizing the string list of PMF factors. If so then drag the waves to the root and then back into the folder."
End

Function PMF_TSeriesCorrelation_button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert 1, "Are you sure that you are in the PMF_Imported_Waves DF?"
			if(V_Flag==1)
			elseif(V_flag==2)
				Abort "User Aborted."
			endif
			variable nFactor, fPeak
	
			prompt fPeak, "Please enter the fPeak desired (-1 to 1 with intervals of 0.2, no rotations can be entered as '0'\r For example an fPeak of -0.8 would be entered as -08."
			prompt nFactor, "Please enter desired Factor. This code operates with 10 or less."
			doprompt "Please Enter the following infomation.", fPeak, nFactor
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			PMF_TSeriesCorrelation(fPeak, nFactor)
			
		case 2:
			break
		endswitch
end

Function PMF_TSeriesCorrelation(fPeak, nFactor)

	//Establish Parameters
	variable fPeak, nFactor
	
	//Determine what data folder we are in
	DFREF StartDF = getdatafolderDFR()
	
	//Create nessesary lists to find the correct DF
	String FactorList = "", fPeakList = "", SubFolderList= ""
	FactorList = "PMFS1;PMFS2;PMFS3;PMFS4;PMFS5;PMFS6;PMFS7;PMFS8;PMFS9;PMFS10;"
	fPeakList = "fPNeg1;fPNeg08;fPNeg06;fPNeg04;fPNeg02;fP0;fP02;fP04;fP06;fP08;fP1"
	SubFolderList= "PMF_Diurnals;PMF_Factors;PMF_TSeries;"
	
	//Create variables
	variable i, k 

	//Determine if user entered negative fPeak
	string Find_Factor_Str= "PMFS"+num2str(nFactor)
	if(fPeak<0)//if negative
		if(fpeak==-1)	//if negative 1 do not include zero
			string Find_fPeak_Str = "fPNeg"+num2str(abs(fPeak))
		else
			Find_fPeak_Str = "fPNeg0"+(num2str(abs(fPeak)))
		endif
	elseif(fPeak>0)	//if positive
		Find_fPeak_Str = "fP0"+num2str(abs(fPeak))
	elseif(fPeak==0) //if 0
		Find_fPeak_Str = "fP0"
	endif
	
	//With the established code ensure that we can find this in the lists
	variable testlist = WhichListItem(Find_Factor_Str, FactorList,";")
	if(TestList == -1)	//If there is an error
		abort "Error in Locating Factor from FactorList. Aborting."
	endif
	
	testlist = WhichListITem(Find_fPeak_Str,fPeakList)
	if(TestList == -1)	//If there is an error
		abort "Error in Locating fPeak from fPeakList. Aborting."
	endif
	
	if(cmpstr("PMFS0", Find_Factor_Str) == 0)//If they match
		abort "0 Factor Solution entered. Aborting."
	endif
	
	//Create DFREFs
	setdatafolder $find_Fpeak_Str
	DFREF fPeakDF = getdatafolderDFR()
	setdatafolder $find_Factor_Str
	DFREF FactorDF = getdatafolderDFR()
	string SubFolder_str = stringfromList(2,SubFolderList)
	setdatafolder $SubFolder_str
	DFREF SubFolderDF = getdatafolderDFR()
	setdatafolder StartDF
	string Correlation_Holder_Str = "PMF_Correlation_Holder"
	setdatafolder $Correlation_Holder_Str
	DFREF Correlation_HolderDF = getdatafolderDFR()
	setdatafolder StartDF
	string Correlations_Str = "PMF_Correlations"
	setdatafolder $Correlations_Str
	DFREF CorrelationsDF = getdatafolderDFR()
	
	//Make SubFolder to hold generated waves
	setdatafolder CorrelationsDF
	String OutPut_Str = "TSeries_Correlations_PMFS"+num2str(nFactor)
	NewDataFolder/O/S $OutPut_Str
	DFREF OutPut_DF = getdatafolderDFR()
	
	//Get nessesary Lists
	Setdatafolder Correlation_HolderDF
	String y_axis_list = wavelist("*",";","TEXT:0") //Correlations
	Setdatafolder FactorDF
	String x_axis_list = wavelist("*t*",";","TEXT:0") //Datetime
	setdatafolder SubFolderDF
	string PMF_list = wavelist("*t*",";","TEXT:0")	//PMFS1F1 for example
//	wave tWave = $stringfromlist(0,x_axis_list,";")
	
	//Test to make sure that the number of points are the same
	SetDataFolder FactorDF
	variable testPMF = dimsize($stringfromList(0,x_axis_list,";"),0)
	SetDatafolder Correlation_HolderDF
	variable testSignal = dimsize($stringfromList(0,y_axis_list,";"),0)
	
	if(testPMF!=testSignal)
		abort "Waves are not equal in points. Aborting."
		setdatafolder StartDF
	endif

	//We now have our x-axis and y-axis
	
	//Next duplicate our waves to our new folder
	//The idea here is to duplicate our y_axis waves to ensure that we curve fit things well
	//i.e. f44 -> f44_PMF5SF1, f44_PMF5SF2 etc. This way we have seperate waves to curve fit too
	setdatafolder Correlation_HolderDF
	for(i=0;i<itemsinlist(y_axis_list,";");i++)
		wave tempwave = $stringfromlist(i,y_axis_list,";")
		string currwavename_yaxis = stringfromlist(i,y_axis_list,";")
		//Next loop through the number of PMFfactors we have
		for(k=0;k<nFactor;k++)
			string dupwavename = currwavename_yaxis+num2str(k)
			duplicate/O tempwave, OutPut_DF:$Dupwavename
		endfor
	endfor
	
	setdatafolder SubFolderDF
	for(i=0;i<itemsinlist(PMF_list,";");i++)
		wave tempwave = $stringfromlist(i,PMF_List,";")
		currwavename_yaxis = stringfromlist(i,PMF_List,";")
		dupwavename = currwavename_yaxis
		duplicate/O tempwave, OutPut_DF:$Dupwavename
	endfor

	setdatafolder FactorDF
	//Now we have our duplicated y_waves in our PMF folder that are ready for graphing and correlations, so we need to duplicate our x_waves (PMF_TSeriesFactor waves)
	wave tempwave = $stringfromlist(0,x_axis_list,";")
	Dupwavename = stringfromlist(0,x_axis_list,";")
	duplicate/O tempwave, OutPut_DF:$Dupwavename
	
	setdatafolder OutPut_DF

	
//	//Do all graphing through a loop to cover all of the factors we have
	for(i=0;i<itemsinlist(y_axis_list,";");i++)
		//Establish the name of the Graph to append things too
		string GraphName_y = stringfromlist(i,y_axis_list,";")
		GraphName_y = ReplaceString("y_axis_",GraphName_y, "")
		string GraphName_x = "PMFS"+num2str(nFactor)
		string GraphName = "TSeries_"+GraphName_y+"_vs_"+GraphName_x
		
		//Establish waves that contain what we will be graphing 
		string graphlist_y_support = "*"+GraphName_y+"*"
		string graphlist_y = wavelist(graphlist_y_support,";","Text:0")
		string graphlist_x = x_axis_list	//To help fight against wavelist not getting waves in the correct order
		string graphlist_PMF = PMF_List
		
		//Find out how we should split the x_axis
		Variable Splitaxis = (100/nFactor)/100 //last /100 is to get it into decimal places
		variable Currhigh, currlow
		
		//Start Graphing (ensure we get rid of another window of the same type)
		Killwindow/Z $GraphName
		Display/N=$GraphName
		
		//Start a loop to begin the appending of traces
		for(k=0;k<nFactor;k++)
			//First establish the waves
			wave tempwave_x = $stringfromlist(0,graphlist_x, ";")
			wave tempwave_y = $stringfromlist(k,graphlist_y, ";")
			wave tempwave_PMF = $Stringfromlist(k, PMF_List, ";")
			string Laxisname = nameofwave(tempwave_y)+num2str(k)
			//Now append the waves
			Appendtograph/W=$GraphName/L=$Laxisname tempwave_y vs tempwave_x
			Appendtograph/W=$GraphName/L=$nameofwave(tempwave_PMF) tempwave_PMF vs tempwave_x
			//Now edit the graph to account for the fact we are putting multiple waves on it
			if(k==0)
				Currhigh = (Splitaxis*k)+SplitAxis //0*0.25+0.25 = 0.25; 1*0.25+0.25 = 0.5; 2*0.25+0.25 = 0.75 etc
				Currlow = Splitaxis*k	//0*0.25 = 0 ; 1*0.25 = 1; 2*0.25 = 0.5 etc
			elseif(k!=0)
				Currhigh = (Splitaxis*k)+SplitAxis //0*0.25+0.25 = 0.25; 1*0.25+0.25 = 0.5; 2*0.25+0.25 = 0.75 etc
				Currlow = (Splitaxis*k)+0.02	//0*0.25 = 0 ; 1*0.25 = 1; 2*0.25 = 0.5 etc + offset
			endif
			//Sometimes we will be a bit ahead of 1 which results in an error. 
			if(k==nFactor-1)
				Currhigh = 0.99
			Endif
//			ModifyGraph/W=$GraphName mode($nameofwave(tempwave_y))=2
			ModifyGraph/W=$GraphName lsize($nameofwave(tempwave_y))=1
			ModifyGraph/W=$GraphName lsize($nameofwave(tempwave_PMF))=1
			ModifyGraph/W=$GraphName rgb($nameofwave(tempwave_PMF))=(0,0,0)
			ModifyGraph/W=$GraphName AxisEnab($Laxisname)={currlow,currhigh}//, freePos($stringfromlist(k,bottom_axis_list,";"))=0
			ModifyGraph/W=$GraphName AxisEnab($nameofwave(tempwave_PMF))={currlow,currhigh}
			if(k!=0)
				ModifyGraph/W=$GraphName tick($Laxisname)=3
				ModifyGraph/W=$GraphName noLabel($Laxisname)=2
			else
				ModifyGraph/W=$GraphName freePos($Laxisname)=-25
			endif
			//Label Appropriate axis
//			Label/W=$GraphName $stringfromlist(k,graphlist_y,";") "\\Z08"+nameofwave(tempwave_y)
			string labelLeft_str = replacestring("TSeries", nameofwave(tempwave_PMF), "")
			labelLeft_str = replacestring("_1D", labelLeft_str, "")
			Label/W=$GraphName $nameofwave(tempwave_PMF) "\\Z16"+labelLeft_str
//			//Now make the curve fit
//			CurveFit/Q line $nameofwave(tempwave_y) /X=$nameofwave(tempwave_x) /D 
//			//Create the textbox and wave to store information
//			TextBox/W=$GraphName/A=LT/F=2 "\\Z07\f01"+labelLeft_str+" vs "+nameofwave(tempwave_x)+"\rR\S2\M\\Z07\f01 = "+num2str(v_R2) + "\rSlope = " + num2str(v_sigb)
		endfor	
			Label Bottom "DateTime"
			ModifyGraph/W=$GraphName AxisEnab(Bottom)={0.1,1}
	Endfor
	doalert/T="Code Completion Message" 0, "The code has been ran, ensure that the correlations seem sound as sometimes there are errors in organizing the string list of PMF factors. If so then drag the waves to the root and then back into the folder."
	setdatafolder StartDF
End









Function PMF_Diurnal_button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert 1, "Are you sure that you are in the PMF_Imported_Waves DF?"
			if(V_Flag==1)
			elseif(V_flag==2)
				Abort "User Aborted."
			endif
			variable nFactor, fPeak
	
			prompt fPeak, "Please enter the fPeak desired (-1 to 1 with intervals of 0.2, no rotations can be entered as '0'\r For example an fPeak of -0.8 would be entered as -08."
			prompt nFactor, "Please enter desired Factor. This code operates with 10 or less."
			doprompt "Please Enter the following infomation.", fPeak, nFactor
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			PMF_Diurnal(fPeak, nFactor)
			
		case 2:
			break
		endswitch
end

Function PMF_Diurnal(fPeak, nFactor)

	//Establish Parameters
	variable fPeak, nFactor
	
	//Determine what data folder we are in
	DFREF StartDF = getdatafolderDFR()
	
	//Create nessesary lists to find the correct DF
	String FactorList = "", fPeakList = "", SubFolderList= ""
	FactorList = "PMFS1;PMFS2;PMFS3;PMFS4;PMFS5;PMFS6;PMFS7;PMFS8;PMFS9;PMFS10;"
	fPeakList = "fPNeg1;fPNeg08;fPNeg06;fPNeg04;fPNeg02;fP0;fP02;fP04;fP06;fP08;fP1"
	SubFolderList= "PMF_Diurnals;PMF_Factors;PMF_TSeries;"
	
	//Create variables
	variable i, k 

	//Determine if user entered negative fPeak
	string Find_Factor_Str= "PMFS"+num2str(nFactor)
	if(fPeak<0)//if negative
		if(fpeak==-1)	//if negative 1 do not include zero
			string Find_fPeak_Str = "fPNeg"+num2str(abs(fPeak))
		else
			Find_fPeak_Str = "fPNeg0"+(num2str(abs(fPeak)))
		endif
	elseif(fPeak>0)	//if positive
		Find_fPeak_Str = "fP0"+num2str(abs(fPeak))
	elseif(fPeak==0) //if 0
		Find_fPeak_Str = "fP0"
	endif
	
	//With the established code ensure that we can find this in the lists
	variable testlist = WhichListItem(Find_Factor_Str, FactorList,";")
	if(TestList == -1)	//If there is an error
		abort "Error in Locating Factor from FactorList. Aborting."
	endif
	
	testlist = WhichListITem(Find_fPeak_Str,fPeakList)
	if(TestList == -1)	//If there is an error
		abort "Error in Locating fPeak from fPeakList. Aborting."
	endif
	
	if(cmpstr("PMFS0", Find_Factor_Str) == 0)//If they match
		abort "0 Factor Solution entered. Aborting."
	endif
	
	//Create DFREFs
	setdatafolder $find_Fpeak_Str
	DFREF fPeakDF = getdatafolderDFR()
	setdatafolder $find_Factor_Str
	DFREF FactorDF = getdatafolderDFR()
	string SubFolder_str = stringfromList(2,SubFolderList)
	setdatafolder $SubFolder_str
	DFREF SubFolderDF = getdatafolderDFR()
	setdatafolder StartDF
	setdatafolder PMF_Diurnals
	DFREF DiurnalDF = getdatafolderDFR()
	setdatafolder StartDF
	
	
	//Get nessesary Lists
	Setdatafolder SubFolderDF
	String y_axis_list = wavelist("*",";","TEXT:0")
	Setdatafolder FactorDF
	String x_axis_list = wavelist("*t*",";","TEXT:0") //Assume the time waves contains t and no other waves do 
	
	//Test to make sure that the number of points are the same
	variable testPMF = dimsize($stringfromList(0,x_axis_list,";"),0)
	SetDatafolder SubFolderDF
	variable testSignal = dimsize($stringfromList(0,y_axis_list,";"),0)
	
	if(testPMF!=testSignal)
		abort "Waves are not equal in points. Aborting."
	endif
	
	//Create DF to hold wave in PMF_Diurnals
	setdatafolder DiurnalDF
	string newDF_str = "PMFS"+num2str(nFactor)
	NewDataFolder/O/S $newDF_str
	DFREF OutPutDF = getdatafolderDFR()

	
	for(i=0;i<nFactor;i++)
		setdatafolder FactorDF
		wave twave = $stringfromlist(0,x_axis_List,";")
		setdatafolder SubFolderDF
		wave sigwave = $stringfromlist(i,y_axis_List,";")
		setdatafolder OutPutDF
		Make/O/D/N=24 Hour_Wave
		wave Hour_Wave = diurnal_time(twave, sigwave)	//Get the waves in to a diurnal time format
		diurnal_graph(twave, sigwave, Hour_Wave)	//Run the formatted waves through a graphing function
	endfor
	
	//Now that we have made individual graphs make an overall diurnal graph
	setdatafolder OutPutDF
	Killwaves/Z Hour_Wave
	Variable nDF = countobjectsDFR(OutPutDF,4)
	string DFList = ""
	for(i=0;i<nDF;i++)
		DFList += GetindexedObjNameDFR(OutputDF, 4, i)+";"	
	endfor
	setdatafolder $stringfromlist(0,DFList,";")
	x_axis_list = wavelist("*Diurnal_Hour*",";","TEXT:0")
	Wave xWave = $Stringfromlist(0,x_axis_list,";")
	y_axis_list = ""
	string err_list_up ="", err_list_down = ""
	setdatafolder OutPutDF
	for(i=0;i<nDF;i++)
		setdatafolder $stringfromList(i,DFList,";")
		y_axis_list += wavelist("*Median*",";","TEXT:0")
		err_list_up += wavelist("*UIQR*",";","TEXT:0")
		err_list_down += wavelist("*LIQR*",";","TEXT:0")
		setdatafolder OutPutDF	
	endfor
	
	string GraphName = "Diurnal_Graph_PMFS"+num2str(nFactor)
	Killwindow/Z $GraphName
	display/N=$GraphName
	//Find out how we should split the x_axis
	Variable Splitaxis = (100/nFactor)/100 //last /100 is to get it into decimal places
	variable Currhigh, currlow
	
	for(i=0;i<itemsInList(y_axis_list);i++)
		if(i==0)
			Currhigh = (Splitaxis*i)+SplitAxis //0*0.25+0.25 = 0.25; 1*0.25+0.25 = 0.5; 2*0.25+0.25 = 0.75 etc
			Currlow = Splitaxis*i	//0*0.25 = 0 ; 1*0.25 = 1; 2*0.25 = 0.5 etc
		elseif(i!=0)
			Currhigh = (Splitaxis*i)+SplitAxis //0*0.25+0.25 = 0.25; 1*0.25+0.25 = 0.5; 2*0.25+0.25 = 0.75 etc
			Currlow = (Splitaxis*i)+0.02	//0*0.25 = 0 ; 1*0.25 = 1; 2*0.25 = 0.5 etc + offset
		endif
		//Sometimes we will be a bit ahead of 1 which results in an error. 
		if(i==nFactor-1)
			Currhigh = 0.99
		Endif
		
		setdatafolder $stringfromlist(i,DFList,";")
		wave tempwave_y = $stringfromlist(i,y_axis_list,";")
		wave err_up = $stringfromlist(i,err_list_up,";")
		wave err_down = $stringfromlist(i,err_list_down,";")
		appendtograph/L=$nameofwave(tempwave_y) tempwave_y vs xWave
		string GraphName_y = stringfromlist(i,y_axis_list,";")
		//Label Appropriate axis
//		Label/W=$GraphName $stringfromlist(k,y_axis_list,";"), "\\Z08"
		string labelLeft_str = ReplaceString("y_axis_",GraphName_y,"")
		Label/W=$GraphName $nameofwave(tempwave_y), "\\Z16"+labelLeft_str+"Median (µg/m\S3\M)"
//		ModifyGraph/W=$GraphName mode($nameofwave(tempwave_y))=1
//		ModifyGraph/W=$GraphName lsize($nameofwave(tempwave_y))=2
		ModifyGraph/W=$GraphName rgb($nameofwave(tempwave_y))=(0,0,0)
		ModifyGraph/W=$GraphName AxisEnab($nameofwave(tempwave_y))={currlow,currhigh}
//		ModifyGraph/W=$GraphName freePos(MSS_Base)=0
		ErrorBars/W=$GraphName $nameofwave(tempwave_y) SHADE={0,0,(0,0,0,0),(0,0,0,0)},wave=(err_up,err_down) 
		setdatafolder OutPutDF
	endfor

//	SetAxis bottom *,100
//	Label left "µg m\\S-3\\M (?)";DelayUpdate
	Label bottom "Hour of Day"
	ModifyGraph axisEnab(bottom)={0.066,1}
	ModifyGraph nticks(bottom)=100,sep(bottom)=1

	setdatafolder StartDF
	doalert/T="Code Completion Message" 0, "The code has been ran, ensure that the correlations seem sound as sometimes there are errors in organizing the string list of PMF factors. If so then drag the waves to the root and then back into the folder."
End




Function PMF_FracDom_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert 1, "Are you in the folder with all of the time series PMF waves and the datetime wave?"
			if(V_Flag==1)
			elseif(V_flag==2)
				Abort "User Aborted."
			endif
			string twave_str = ""
			variable nfactors
	
			prompt twave_str, "Please enter the name of the time wave to be used."
			prompt nfactors, "Please enter number of PMF factors. This code is meant to operate with 10 or less."
			doprompt "Please Enter the following infomation.", twave_str, nfactors
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave twave = $twave_str
			PMF_FracDom(twave, nfactors)
			
		case 2:
			break
		endswitch
end












Function PMF_Imported_Plot_Diurnal_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
//			doalert 1, "Are your PMF Factor waves named 'PMF1', 'PMF2'... etc?"
//			if(V_Flag==1)
//			elseif(V_flag==2)
//				Abort "User Aborted."
//			endif
			string folderpath_str = ""
			string graphchoice_str = "" 
			variable nfactors
			
			prompt folderpath_str, "Please enter the full path to the folder the waves are held."
			prompt graphchoice_str, "Please enter 'Hour', 'DayofWeek', WeekDayEnd', or 'Month' to create the appropriate graph (assuming appropriate waves have been loaded in correctly)."
			prompt nfactors, "Please enter number of PMF factors. This code is meant to operate with 10 or less."
			doprompt "Please Enter the following infomation.", folderpath_str,graphchoice_str, nfactors
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			
			PMF_Imported_Plot_Diurnal(folderpath_str,graphchoice_str, nfactors)
			
		case 2:
			break
		endswitch
end

//AJD 10/30/24: Plot the diurnal graph of choice from exported PMF waves
Function PMF_Imported_Plot_Diurnal(folderpath_str,graphchoice_str, nfactors)
	
	//Establish required parameters
	string folderpath_str,graphchoice_str
	variable nfactors
	
	//Set up DataFolder Paths
	DFREF StartDF = getdatafolderDFR()
	setdatafolder $folderpath_Str
	DFREF PMFDF = getdatafolderDFR()
	
	//Establish Additional Parameters
	variable i,k, nitems
	string listname_full= "", tempindicator = "", generatedlist = ""
	string generatedlistname_Median = "", generatedlistname_Median_Err=""
	string generatedlistname_P25="", generatedlistname_P25_Err=""
	string generatedlistname_P75 ="", generatedlistname_P75_Err="" 
	string graphindicator_median="", graphindicator_P25="",graphindicator_p75="", graphindicator_p25_err="", graphindicator_p75_err="",graphindicator_median_ErrPos,graphindicator_median_ErrNeg
	string generatedlistname_Median_ErrPos = "", generatedlistname_Median_ErrNeg = ""
	//Establish DFREF for given folder
	setdatafolder $folderpath_str
	DFREF PMF_Folder = GetdatafolderDFR()
	
	//Establish some wavelists that contain information about the time series
	if(cmpstr(graphchoice_str,"Hour")==0)
		string DiurnalXWave = wavelist("DiurnalHours",";","TEXT:0")
		wave x_Diurnal = $stringfromlist(0,DiurnalXWave,";")
	elseif(cmpstr(graphchoice_str,"DayOfWeek")==0)
		DiurnalXWave = wavelist("DayOfWeekVals",";","TEXT:0")
		wave x_Diurnal = $stringfromlist(0,DiurnalXWave,";")
	elseif(cmpstr(graphchoice_str,"WeekDayEnd")==0)
		DiurnalXWave = wavelist("WeekDayEndVals",";","TEXT:0")
		wave x_Diurnal = $stringfromlist(0,DiurnalXWave,";")
	elseif(cmpstr(graphchoice_str,"Month")==0)
		DiurnalXWave = wavelist("MonthVals",";","TEXT:0")
		wave x_Diurnal = $stringfromlist(0,DiurnalXWave,";")
	else
		abort "Time Series choice error. Aborting."
	endif
	
	string CurrList = ""
	string TSeriesList = "TSeries1;TSeries2;TSeries3;TSeries4;TSeries5;TSeries6;TSeries7;TSeries8;TSeries9;TSeries10;"
	string TSeries1 = "", Tseries1_ErrPos="",Tseries1_ErrNeg="", TSeries1_P25="", TSeries1_p75="",TSeries1_P25_Err="", TSeries1_p75_Err=""
	string TSeries2 = "", Tseries2_ErrPos="",Tseries2_ErrNeg="",TSeries2_P25="", TSeries2_p75="",TSeries2_P25_Err="", TSeries2_p75_Err=""
	string TSeries3 = "", Tseries3_ErrPos="",Tseries3_ErrNeg="",TSeries3_P25="", TSeries3_p75="",TSeries3_P25_Err="", TSeries3_p75_Err=""
	string TSeries4 = "", Tseries4_ErrPos="",Tseries4_ErrNeg="",TSeries4_P25="", TSeries4_p75="",TSeries4_P25_Err="", TSeries4_p75_Err=""
	string TSeries5 = "", Tseries5_ErrPos="",Tseries5_ErrNeg="",TSeries5_P25="", TSeries5_p75="",TSeries5_P25_Err="", TSeries5_p75_Err=""
	string TSeries6 = "", Tseries6_ErrPos="",Tseries6_ErrNeg="",TSeries6_P25="", TSeries6_p75="",TSeries6_P25_Err="", TSeries6_p75_Err=""
 	string TSeries7 = "", Tseries7_ErrPos="",Tseries7_ErrNeg="",TSeries7_P25="", TSeries7_p75="",TSeries7_P25_Err="", TSeries7_p75_Err=""
	string TSeries8 = "", Tseries8_ErrPos="",Tseries8_ErrNeg="",TSeries8_P25="", TSeries8_p75="",TSeries8_P25_Err="", TSeries8_p75_Err=""
	string TSeries9 = "", Tseries9_ErrPos="",Tseries9_ErrNeg="",TSeries9_P25="", TSeries9_p75="",TSeries9_P25_Err="", TSeries9_p75_Err=""
	string TSeries10 = "", Tseries10_ErrPos="",Tseries10_ErrNeg="", TSeries10_P25="", TSeries10_p75="",TSeries10_P25_Err="", TSeries10_p75_Err=""

	//Create for loop to create and trim lists down based on nFactors and graphchoice_str
	for(i=0;i<nFactors;i++)
		tempindicator = "*ts"+num2str(i+1)+"*"
		listname_full = wavelist(tempindicator,";","TEXT:0")
		//Now that we have the name of our list lets pick shorten the list based on what the user inputted
		nitems = itemsinlist(listname_full)
		//Set up some if statements to help our list condensing 
		if(cmpstr(graphchoice_str,"Hour")==0) //If user wants an this graph
			graphindicator_median = "*Median_ts"+num2str(i+1)+"_diurnal_"+"*"
			graphindicator_median_ErrPos = "*P75_ts"+num2str(i+1)+"_diurnal_"+"f0EB"+"*"
			graphindicator_median_ErrNeg = "*P25_ts"+num2str(i+1)+"_diurnal_"+"f0EB"+"*"
			graphindicator_p25 = "*P25_ts"+num2str(i+1)+"_diurnal_"+"*"
			graphindicator_p25_Err = "*P0_ts"+num2str(i+1)+"_diurnal_"+"*"
			graphindicator_p75 = "*P75_ts"+num2str(i+1)+"_diurnal_"+"*"
			graphindicator_p75_Err = "*P100_ts"+num2str(i+1)+"_diurnal_"+"*"
		elseif(cmpstr(graphchoice_str,"DayofWeek")==0)
			graphindicator_median = "*Median_ts"+num2str(i+1)+"_DayOfWeek_"+"*"
			graphindicator_p25 = "*P25_ts"+num2str(i+1)+"_DayOfWeek_"+"*"
			graphindicator_median_ErrPos = "*P75_ts"+num2str(i+1)+"_DayOfWeek_"+"f0EB"+"*"
			graphindicator_median_ErrNeg = "*P25_ts"+num2str(i+1)+"_DayOfWeek_"+"f0EB"+"*"
			graphindicator_p25_Err = "*P0_ts"+num2str(i+1)+"_DayOfWeek_"+"*"
			graphindicator_p75 = "*P75_ts"+num2str(i+1)+"_DayOfWeek_"+"*"
			graphindicator_p75_Err = "*P100_ts"+num2str(i+1)+"_DayOfWeek_"+"*"
		elseif(cmpstr(graphchoice_str,"WeekDayEnd")==0)
			graphindicator_median = "*Median_ts"+num2str(i+1)+"_WeekDayEnd_"+"*"
			graphindicator_median_ErrPos = "*P75_ts"+num2str(i+1)+"_WeekDayEnd_"+"f0EB"+"*"
			graphindicator_median_ErrNeg = "*P25_ts"+num2str(i+1)+"_WeekDayEnd_"+"f0EB"+"*"
			graphindicator_p25 = "*P25_ts"+num2str(i+1)+"_WeekDayEnd_"+"*"
			graphindicator_p25_Err = "*P0_ts"+num2str(i+1)+"_WeekDayEnd_"+"*"
			graphindicator_p75 = "*P75_ts"+num2str(i+1)+"_WeekDayEnd_"+"*"
			graphindicator_p75_Err = "*P100_ts"+num2str(i+1)+"_WeekDayEnd_"+"*"
		elseif(cmpstr(graphchoice_str,"Month")==0)
			graphindicator_median = "*Median_ts"+num2str(i+1)+"_month_"+"*"
			graphindicator_median_ErrPos = "*P75_ts"+num2str(i+1)+"_month_"+"f0EB"+"*"
			graphindicator_median_ErrNeg = "*P25_ts"+num2str(i+1)+"_month_"+"f0EB"+"*"
			graphindicator_p25 = "*P25_ts"+num2str(i+1)+"_month_"+"*"
			graphindicator_p25_Err = "*P0_ts"+num2str(i+1)+"_month_"+"*"
			graphindicator_p75 = "*P75_ts"+num2str(i+1)+"_month_"+"*"
			graphindicator_p75_Err = "*P100_ts"+num2str(i+1)+"_month_"+"*"
		else
			abort "Graph choice input error. Aborting."
		endif
		//Generate a new list and have it take from the broadlist in order to condense what is dealt with
		generatedlistname_Median = ListMatch(listname_full,graphindicator_median,";")
		generatedlistname_Median_ErrPos = ListMatch(listname_full,graphindicator_median_ErrPos,";")
		generatedlistname_Median_ErrNeg = ListMatch(listname_full,graphindicator_median_ErrNeg,";")
		generatedlistname_P25 = ListMatch(listname_full,graphindicator_p25,";")
		generatedlistname_P25_Err = ListMatch(listname_full,graphindicator_p25_Err,";")
		generatedlistname_P75 = ListMatch(listname_full,graphindicator_p75,";")
		generatedlistname_P75_Err = ListMatch(listname_full,graphindicator_p75_Err,";")
		//Some if statments to match correct list up
		if(i==0)
			TSeries1 = generatedlistname_Median
			TSeries1_ErrPos = generatedlistname_Median_ErrPos
			TSeries1_ErrNeg = generatedlistname_Median_ErrNeg
			TSeries1_P25 = generatedlistname_P25
			TSeries1_P25_Err = generatedlistname_P25_Err
			TSeries1_P75 = generatedlistname_P75
			TSeries1_P75_Err = generatedlistname_P75_Err
		elseif(i==1)
			TSeries2 = generatedlistname_Median
			TSeries2_ErrPos = generatedlistname_Median_ErrPos
			TSeries2_ErrNeg = generatedlistname_Median_ErrNeg
			TSeries2_P25 = generatedlistname_P25
			TSeries2_P25_Err = generatedlistname_P25_Err
			TSeries2_P75 = generatedlistname_P75
			TSeries2_P75_Err = generatedlistname_P75_Err
		elseif(i==2)
			TSeries3 = generatedlistname_Median
			TSeries3_ErrPos = generatedlistname_Median_ErrPos
			TSeries3_ErrNeg = generatedlistname_Median_ErrNeg
			TSeries3_P25 = generatedlistname_P25
			TSeries3_P25_Err = generatedlistname_P25_Err
			TSeries3_P75 = generatedlistname_P75
			TSeries3_P75_Err = generatedlistname_P75_Err
		elseif(i==3)
			TSeries4 = generatedlistname_Median
			TSeries4_ErrPos = generatedlistname_Median_ErrPos
			TSeries4_ErrNeg = generatedlistname_Median_ErrNeg
			TSeries4_P25 = generatedlistname_P25
			TSeries4_P25_Err = generatedlistname_P25_Err
			TSeries4_P75 = generatedlistname_P75
			TSeries4_P75_Err = generatedlistname_P75_Err
		elseif(i==4)
			TSeries5 = generatedlistname_Median
			TSeries5_ErrPos = generatedlistname_Median_ErrPos
			TSeries5_ErrNeg = generatedlistname_Median_ErrNeg
			TSeries5_P25 = generatedlistname_P25
			TSeries5_P25_Err = generatedlistname_P25_Err
			TSeries5_P75 = generatedlistname_P75
			TSeries5_P75_Err = generatedlistname_P75_Err
		elseif(i==5)
			TSeries6 = generatedlistname_Median
			TSeries6_ErrPos = generatedlistname_Median_ErrPos
			TSeries6_ErrNeg = generatedlistname_Median_ErrNeg
			TSeries6_P25 = generatedlistname_P25
			TSeries6_P25_Err = generatedlistname_P25_Err
			TSeries6_P75 = generatedlistname_P75
			TSeries6_P75_Err = generatedlistname_P75_Err
		elseif(i==6)
			TSeries7 = generatedlistname_Median
			TSeries7_ErrPos = generatedlistname_Median_ErrPos
			TSeries7_ErrNeg = generatedlistname_Median_ErrNeg
			TSeries7_P25 = generatedlistname_P25
			TSeries7_P25_Err = generatedlistname_P25_Err
			TSeries7_P75 = generatedlistname_P75
			TSeries7_P75_Err = generatedlistname_P75_Err
		elseif(i==7)
			TSeries8 = generatedlistname_Median
			TSeries8_ErrPos = generatedlistname_Median_ErrPos
			TSeries8_ErrNeg = generatedlistname_Median_ErrNeg
			TSeries8_P25 = generatedlistname_P25
			TSeries8_P25_Err = generatedlistname_P25_Err
			TSeries8_P75 = generatedlistname_P75
			TSeries8_P75_Err = generatedlistname_P75_Err
		elseif(i==8)
			TSeries9 = generatedlistname_Median
			TSeries9_ErrPos = generatedlistname_Median_ErrPos
			TSeries9_ErrNeg = generatedlistname_Median_ErrNeg
			TSeries9_P25 = generatedlistname_P25
			TSeries9_P25_Err = generatedlistname_P25_Err
			TSeries9_P75 = generatedlistname_P75
			TSeries9_P75_Err = generatedlistname_P75_Err
		elseif(i==9)
			TSeries10 = generatedlistname_Median
			TSeries10_ErrPos = generatedlistname_Median_ErrPos
			TSeries10_ErrNeg = generatedlistname_Median_ErrNeg
			TSeries10_P25 = generatedlistname_P25
			TSeries10_P25_Err = generatedlistname_P25_Err
			TSeries10_P75 = generatedlistname_P75
			TSeries10_P75_Err = generatedlistname_P75_Err
		else
			abort "nFactors Entered is above 10. Aborting."
		endif
	endfor
	
	//Now that we have all of our TSeries Strings we can use the number of factors to plot up the waves needed to make the graph
	//Set up the general graph to add on too.
	string GraphName = "PMF_Graph_"+graphchoice_str
	//Kill the current graph if there is one to avoid errors
	killWindow/Z $GraphName
	Display/N=$GraphName
	//x_axis set above
	string CurrAxis = "", FactorColor="", CurrTraces=""
	variable c1,c2,c3
	variable splitaxis = 100/nfactors
	variable a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,currlow,currhigh
	//Determine axis split first
	if(nFactors==1)
		//do nothing; can be full axis
	elseif(nFactors==2)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
	elseif(nFactors==3)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
	elseif(nFactors==4)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
	elseif(nFactors==5)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
		a9=splitaxis*4;a10=splitaxis*5 //F5		
	elseif(nFactors==6)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
		a9=splitaxis*4;a10=splitaxis*5 //F5	
		a11=splitaxis*5;a12=splitaxis*6 //F6	
	elseif(nFactors==7)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
		a9=splitaxis*4;a10=splitaxis*5 //F5	
		a11=splitaxis*5;a12=splitaxis*6 //F6
		a13=splitaxis*6;a14=splitaxis*7	//F7
	elseif(nFactors==8)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
		a9=splitaxis*4;a10=splitaxis*5 //F5	
		a11=splitaxis*5;a12=splitaxis*6 //F6
		a13=splitaxis*6;a14=splitaxis*7	//F7
		a15=splitaxis*7;a16=splitaxis*8	//F8
	elseif(nFactors==9)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
		a9=splitaxis*4;a10=splitaxis*5 //F5	
		a11=splitaxis*5;a12=splitaxis*6 //F6
		a13=splitaxis*6;a14=splitaxis*7	//F7
		a15=splitaxis*7;a16=splitaxis*8	//F8
		a17=splitaxis*8;a18=splitaxis*9	//F9
	elseif(nFactors==10)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
		a9=splitaxis*4;a10=splitaxis*5 //F5	
		a11=splitaxis*5;a12=splitaxis*6 //F6
		a13=splitaxis*6;a14=splitaxis*7	//F7
		a15=splitaxis*7;a16=splitaxis*8	//F8
		a17=splitaxis*8;a18=splitaxis*9	//F9
		a19=splitaxis*9;a20=splitaxis*10	//F10
	else
		Abort "Error in number of factors."
	endif
	
	for(i=0;i<nFactors;i++)
		//Get the TSeries Number of intrest with i
		CurrList = stringfromList(i,TSeriesList,";")
		//Go to that Time Series list (designated by CurrWave) and pluck out the first wave from it
		if(cmpstr(CurrList,"TSeries1")==0)
			wave currY = $stringfromlist(0,TSeries1,";")
			wave CurrY_ErrPos = $stringfromlist(0,Tseries1_ErrPos,";")
			wave Curry_ErrNeg = $stringfromlist(0,Tseries1_ErrNeg,";")
			wave curry_p25 = $stringfromlist(0,TSeries1_P25,";")
			wave CurrY_p25_Err = $stringfromlist(0,TSeries1_P25_Err,";")
			wave CurrY_P75 = $stringfromlist(0,TSeries1_P75,";")
			wave CurrY_P75_Err = $stringfromlist(0,TSeries1_P75_Err,";")
			CurrAxis = "Left"+num2str(i+1)
			FactorColor ="0,0,0"
			c1=0;c2=0;c3=0
			currlow = a1;currhigh = a2
		elseif(cmpstr(CurrList,"TSeries2")==0)
			wave currY = $stringfromlist(0,TSeries2,";")
			wave CurrY_ErrPos = $stringfromlist(0,TSeries2_ErrPos,";")
			wave Curry_ErrNeg = $stringfromlist(0,TSeries2_ErrNeg,";")
			wave curry_p25 = $stringfromlist(0,TSeries2_P25,";")
			wave CurrY_p25_Err = $stringfromlist(0,TSeries2_P25_Err,";")
			wave CurrY_P75 = $stringfromlist(0,TSeries2_P75,";")
			wave CurrY_P75_Err = $stringfromlist(0,TSeries2_P75_Err,";")
			CurrAxis = "Left"+num2str(i+1)
			FactorColor = "65535,16385,16385"
			c1=65535;c2=16385;c3=16385
			currlow = a3;currhigh = a4
		elseif(cmpstr(CurrList,"TSeries3")==0)
			wave currY = $stringfromlist(0,TSeries3,";")
			wave CurrY_ErrPos = $stringfromlist(0,TSeries3_ErrPos,";")
			wave Curry_ErrNeg = $stringfromlist(0,TSeries3_ErrNeg,";")
			wave curry_p25 = $stringfromlist(0,TSeries3_P25,";")
			wave CurrY_p25_Err = $stringfromlist(0,TSeries3_P25_Err,";")
			wave CurrY_P75 = $stringfromlist(0,TSeries3_P75,";")
			wave CurrY_P75_Err = $stringfromlist(0,TSeries3_P75_Err,";")
			CurrAxis = "Left"+num2str(i+1)
			FactorColor = "0,39321,0"
			c1=0;c2=39321;c3=0
			currlow = a5;currhigh = a6
		elseif(cmpstr(CurrList,"TSeries4")==0)
			wave currY = $stringfromlist(0,TSeries4,";")
			wave CurrY_ErrPos = $stringfromlist(0,TSeries4_ErrPos,";")
			wave Curry_ErrNeg = $stringfromlist(0,TSeries4_ErrNeg,";")
			wave curry_p25 = $stringfromlist(0,TSeries4_P25,";")
			wave CurrY_p25_Err = $stringfromlist(0,TSeries4_P25_Err,";")
			wave CurrY_P75 = $stringfromlist(0,TSeries4_P75,";")
			wave CurrY_P75_Err = $stringfromlist(0,TSeries4_P75_Err,";")
			CurrAxis = "Left"+num2str(i+1)
			FactorColor = "0,0,65535"
			c1=0;c2=0;c3=65535
			currlow = a7;currhigh = a8
		elseif(cmpstr(CurrList,"TSeries5")==0)
			wave currY = $stringfromlist(0,TSeries5,";")
			wave CurrY_ErrPos = $stringfromlist(0,TSeries5_ErrPos,";")
			wave Curry_ErrNeg = $stringfromlist(0,TSeries5_ErrNeg,";")
			wave curry_p25 = $stringfromlist(0,TSeries5_P25,";")
			wave CurrY_p25_Err = $stringfromlist(0,TSeries5_P25_Err,";")
			wave CurrY_P75 = $stringfromlist(0,TSeries5_P75,";")
			wave CurrY_P75_Err = $stringfromlist(0,TSeries5_P75_Err,";")
			CurrAxis = "Left"+num2str(i+1)
			FactorColor = "43321,0,31457"
			c1=43321;c2=0;c3=31457
			currlow = a9;currhigh = a10
		elseif(cmpstr(CurrList,"TSeries6")==0)
			wave currY = $stringfromlist(0,TSeries6,";")
			wave CurrY_ErrPos = $stringfromlist(0,TSeries6_ErrPos,";")
			wave Curry_ErrNeg = $stringfromlist(0,TSeries6_ErrNeg,";")
			wave curry_p25 = $stringfromlist(0,TSeries6_P25,";")
			wave CurrY_p25_Err = $stringfromlist(0,TSeries6_P25_Err,";")
			wave CurrY_P75 = $stringfromlist(0,TSeries6_P75,";")
			wave CurrY_P75_Err = $stringfromlist(0,TSeries6_P75_Err,";")
			CurrAxis = "Left"+num2str(i+1)
			FactorColor = "48059,48059,48059"
			c1=48059;c2=48059;c3=48059
			currlow = a11;currhigh = a12
		elseif(cmpstr(CurrList,"TSeries7")==0)
			wave currY = $stringfromlist(0,TSeries7,";")
			wave CurrY_ErrPos = $stringfromlist(0,TSeries7_ErrPos,";")
			wave Curry_ErrNeg = $stringfromlist(0,TSeries7_ErrNeg,";")
			wave curry_p25 = $stringfromlist(0,TSeries7_P25,";")
			wave CurrY_p25_Err = $stringfromlist(0,TSeries7_P25_Err,";")
			wave CurrY_P75 = $stringfromlist(0,TSeries7_P75,";")
			wave CurrY_P75_Err = $stringfromlist(0,TSeries7_P75_Err,";")
			CurrAxis = "Left"+num2str(i+1)
			FactorColor = "65535,32768,32768"
			c1=65535;c2=32768;c3=32768
			currlow = a13;currhigh = a14
		elseif(cmpstr(CurrList,"TSeries8")==0)
			wave currY = $stringfromlist(0,TSeries8,";")
			wave CurrY_ErrPos = $stringfromlist(0,TSeries8_ErrPos,";")
			wave Curry_ErrNeg = $stringfromlist(0,TSeries8_ErrNeg,";")
			wave curry_p25 = $stringfromlist(0,TSeries8_P25,";")
			wave CurrY_p25_Err = $stringfromlist(0,TSeries8_P25_Err,";")
			wave CurrY_P75 = $stringfromlist(0,TSeries8_P75,";")
			wave CurrY_P75_Err = $stringfromlist(0,TSeries8_P75_Err,";")
			CurrAxis = "Left"+num2str(i+1)
			FactorColor = "0,65535,0"
			c1=0;c2=65535;c3=0
			currlow = a15;currhigh = a16
		elseif(cmpstr(CurrList,"TSeries9")==0)
			wave currY = $stringfromlist(0,TSeries9,";")
			wave CurrY_ErrPos = $stringfromlist(0,TSeries9_ErrPos,";")
			wave Curry_ErrNeg = $stringfromlist(0,TSeries9_ErrNeg,";")
			wave curry_p25 = $stringfromlist(0,TSeries9_P25,";")
			wave CurrY_p25_Err = $stringfromlist(0,TSeries9_P25_Err,";")
			wave CurrY_P75 = $stringfromlist(0,TSeries9_P75,";")
			wave CurrY_P75_Err = $stringfromlist(0,TSeries9_P75_Err,";")
			CurrAxis = "Left"+num2str(i+1)
			FactorColor = "16385,65535,65535"
			c1=16385;c2=65535;c3=65535
			currlow = a17;currhigh = a18
		elseif(cmpstr(CurrList,"TSeries10")==0)
			wave currY = $stringfromlist(0,TSeries10,";")
			wave CurrY_ErrPos = $stringfromlist(0,TSeries10_ErrPos,";")
			wave Curry_ErrNeg = $stringfromlist(0,TSeries10_ErrNeg,";")
			wave curry_p25 = $stringfromlist(0,TSeries10_P25,";")
			wave CurrY_p25_Err = $stringfromlist(0,TSeries10_P25_Err,";")
			wave CurrY_P75 = $stringfromlist(0,TSeries10_P75,";")
			wave CurrY_P75_Err = $stringfromlist(0,TSeries10_P75_Err,";")
			CurrAxis = "Left"+num2str(i+1)
			FactorColor = "65535,32768,58981"
			c1=65535;c2=32768;c3=58981
			currlow = a19;currhigh = a20
		else
			abort "Error. Aborting."
		endif
		
		CurrLow/=100
		CurrHigh/=100
		
		//We have the current Tseries waves referenced append the nessesary waves to the graph
		appendtograph/W=$GraphName/L=$CurrAxis CurrY vs x_Diurnal
		appendtograph/W=$GraphName/L=$CurrAxis CurrY_P25 vs X_Diurnal
		appendtograph/W=$GraphName/L=$CurrAxis CurrY_P75 vs X_Diurnal
	
	
	//Modify and add error bars
		ModifyGraph/W=$GraphName mode($nameofwave(CurrY))=3,marker($nameofwave(CurrY))=9, rgb($nameofwave(CurrY))=(c1,c2,c3),axisEnab($CurrAxis)={currlow,currhigh},freePos($CurrAxis)=0,grid($CurrAxis)=2,gridRGB($Curraxis)=(0,0,0)
		ErrorBars/W=$GraphName/L=0 $nameofwave(CurrY) BOX,const=0.3,wave=($nameofwave(CurrY_ErrPos),$nameofwave(CurrY_ErrNeg))
	
		ModifyGraph/W=$GraphName mode($nameofwave(CurrY_P25))=2,rgb($nameofwave(CurrY_P25))=(c1,c2,c3),axisEnab($CurrAxis)={currlow,currhigh},freePos($CurrAxis)=0
		ErrorBars/W=$GraphName/T=0 $nameofwave(CurrY_P25) Y,wave=(,$nameofwave(CurrY_P25_Err))

		ModifyGraph/W=$GraphName mode($nameofwave(CurrY_P75))=2,rgb($nameofwave(CurrY_P75))=(c1,c2,c3),axisEnab($CurrAxis)={currlow,currhigh},freePos($CurrAxis)=0
		ErrorBars/W=$GraphName/T=0 $nameofwave(CurrY_P75) Y,wave=($nameofwave(CurrY_P75_Err),)
	endfor
	
	Label/W=$GraphName Left1 "Mass"
	ModifyGraph/W=$GraphName grid(bottom)=2, gridRGB(bottom)=(0,0,0), lblPos(Left1)=50
	
	setdatafolder StartDF
End


Function PMF_Imported_Plot_TSeries_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
//			doalert 1, "Are your PMF Factor waves named 'PMF1', 'PMF2'... etc?"
//			if(V_Flag==1)
//			elseif(V_flag==2)
//				Abort "User Aborted."
//			endif
			string folderpath_str = ""
			string graphchoice_str = "" 
			variable nfactors
			
			prompt folderpath_str, "Please enter the full path to the folder the waves are held."
//			prompt graphchoice_str, "Please enter 'Hour', 'DayofWeek', WeekDayEnd', or 'Month' to create the appropriate graph (assuming appropriate waves have been loaded in correctly)."
			prompt nfactors, "Please enter number of PMF factors. This code is meant to operate with 10 or less."
			doprompt "Please Enter the following infomation.", folderpath_str, nfactors
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			
			PMF_Imported_Plot_TSeries(folderpath_str,nfactors)
			
		case 2:
			break
		endswitch
end

Function PMF_Imported_Plot_TSeries(folderpath_str,nfactors)

	string folderpath_str
	variable nFactors
	
	//get datafolder curr and remember it
	DFREF StartDF = getdatafolderDFR()
	setdatafolder $folderpath_str
	DFREF PMFDF = getdatafolderDFR()
	
	wave t_start_localtime
	string FactorList = wavelist("*TSeries*",";","TEXT:0")
	variable i 
	string GraphName = "PMF_TSeries"
	
	variable splitaxis = 100/nfactors
	variable a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,currlow,currhigh,c1,c2,c3
	//Determine axis split first
	if(nFactors==1)
		//do nothing; can be full axis
	elseif(nFactors==2)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
	elseif(nFactors==3)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
	elseif(nFactors==4)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
	elseif(nFactors==5)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
		a9=splitaxis*4;a10=splitaxis*5 //F5		
	elseif(nFactors==6)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
		a9=splitaxis*4;a10=splitaxis*5 //F5	
		a11=splitaxis*5;a12=splitaxis*6 //F6	
	elseif(nFactors==7)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
		a9=splitaxis*4;a10=splitaxis*5 //F5	
		a11=splitaxis*5;a12=splitaxis*6 //F6
		a13=splitaxis*6;a14=splitaxis*7	//F7
	elseif(nFactors==8)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
		a9=splitaxis*4;a10=splitaxis*5 //F5	
		a11=splitaxis*5;a12=splitaxis*6 //F6
		a13=splitaxis*6;a14=splitaxis*7	//F7
		a15=splitaxis*7;a16=splitaxis*8	//F8
	elseif(nFactors==9)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
		a9=splitaxis*4;a10=splitaxis*5 //F5	
		a11=splitaxis*5;a12=splitaxis*6 //F6
		a13=splitaxis*6;a14=splitaxis*7	//F7
		a15=splitaxis*7;a16=splitaxis*8	//F8
		a17=splitaxis*8;a18=splitaxis*9	//F9
	elseif(nFactors==10)
		a1=0;a2=splitaxis*1	//F1
		a3=splitaxis*1;a4=splitaxis*2 //F2
		a5=splitaxis*2;a6=splitaxis*3 //F3
		a7=splitaxis*3;a8=splitaxis*4	 //F4
		a9=splitaxis*4;a10=splitaxis*5 //F5	
		a11=splitaxis*5;a12=splitaxis*6 //F6
		a13=splitaxis*6;a14=splitaxis*7	//F7
		a15=splitaxis*7;a16=splitaxis*8	//F8
		a17=splitaxis*8;a18=splitaxis*9	//F9
		a19=splitaxis*9;a20=splitaxis*10	//F10
	else
		Abort "Error in number of factors."
	endif
	
	
	display/N=$GraphName
	for(i=0;i<nFactors;i++)
		wave CurrY = $stringfromList(i,FactorList,";")
		string CurrAxis = "Left"+Num2str(i+1)
		appendtograph/W=$GraphName/L=$CurrAxis CurrY vs t_start_localtime
		if(i==0)
			c1=0;c2=0;c3=0
			currlow = a1;currhigh = a2
		elseif(i==1)
			c1=65535;c2=16385;c3=16385
			currlow = a3;currhigh = a4
		elseif(i==2)
			c1=0;c2=39321;c3=0
			currlow = a5;currhigh = a6
		elseif(i==3)
			c1=0;c2=0;c3=65535
			currlow = a7;currhigh = a8
		elseif(i==4)
			c1=43321;c2=0;c3=31457
			currlow = a9;currhigh = a10
		elseif(i==5)
			c1=48059;c2=48059;c3=48059
			currlow = a11;currhigh = a12
		elseif(i==6)
			c1=65535;c2=32768;c3=32768
			currlow = a13;currhigh = a14
		elseif(i==7)
			c1=0;c2=65535;c3=0
			currlow = a15;currhigh = a16
		elseif(i==8)
			c1=16385;c2=65535;c3=65535
			currlow = a17;currhigh = a18
		elseif(i==9)
			currlow = a19;currhigh = a20
			c1=65535;c2=32768;c3=58981
		else
			Abort "Inappropriate number of factors. Aborting."
		endif
		Currlow/=100
		currhigh/=100
		ModifyGraph/W=$GraphName rgb($nameofwave(CurrY))=(c1,c2,c3),axisEnab($CurrAxis)={currlow,currhigh},freePos($CurrAxis)=0,grid($CurrAxis)=2,gridRGB($Curraxis)=(0,0,0)
		
		
	endfor

	Label/W=$GraphName Left1 "Mass"
	ModifyGraph/W=$GraphName grid(bottom)=2, gridRGB(bottom)=(0,0,0), lblPos(Left1)=50
	
	setdatafolder StartDF
End

Function PMF_Imported_2D_to_1D_Waves_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
//			doalert 1, "Are your PMF Factor waves named 'PMF1', 'PMF2'... etc?"
//			if(V_Flag==1)
//			elseif(V_flag==2)
//				Abort "User Aborted."
//			endif
			string folderpath_str = ""
//			string graphchoice_str = "" 
			variable nfactors
			
			prompt folderpath_str, "Please enter the full path to the folder the waves are held."
//			prompt graphchoice_str, "Please enter 'Hour', 'DayofWeek', WeekDayEnd', or 'Month' to create the appropriate graph (assuming appropriate waves have been loaded in correctly)."
			prompt nfactors, "Please enter number of PMF factors. This code is meant to operate with 10 or less."
			doprompt "Please Enter the following infomation.", folderpath_str, nfactors
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			
			PMF_Imported_2D_to_1D_Waves(Folderpath_str,nfactors)
			
		case 2:
			break
		endswitch
end


Function PMF_Imported_2D_to_1D_Waves(Folderpath_str,nfactors)

	string folderpath_str
	variable nfactors
	
	
	//DF stuff
	DFREF startDF = getdatafolderDFR()
	setdatafolder $Folderpath_str
	DFREF PMFDF = getdatafolderDFR()
	
	//Get a wave list of the 2D waves
	string twoDwaves = wavelist("*",";","MINCOLS:1")
	
	variable i 
	
	for(i=0;i<nfactors;i++)
		wave Currwave = $stringfromlist(i,twoDwaves,";")
		string newWavename = stringfromlist(i,twoDwaves,";")+"_1D"
		Duplicate/O Currwave,tempwave
		wave tempwave 
		splitwave/N=$newWaveName tempwave
		rename $newWaveName+"0",$newWaveName 
	
	endfor
	
	killwaves tempwave

End

Function PMF_CorrelationGrapher_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert 1, "Before continuing ensure that all of the singal and PMF waves are in the same folder nd your signal waves (i.e. f44, rBC...etc) contain the characters 'y_axis'. This is what the code will look for when compiling its list. Also ensure that the PMF Factors TSeries solutions are labled in the style of 'PMF'+ 'factor number' + Solution number' + 'F'+ 'Factor number'; i.e. The 5th solution and 2nd factor would be 'PMF5SF2'."
			if(V_Flag==1)
			elseif(V_flag==2)
				Abort "User Aborted."
			endif
			string folderpath_str = ""
//			string graphchoice_str = "" 
			variable nfactors
			
			prompt folderpath_str, "Please enter the full path to the folder the waves are held."
//			prompt graphchoice_str, "Please enter 'Hour', 'DayofWeek', WeekDayEnd', or 'Month' to create the appropriate graph (assuming appropriate waves have been loaded in correctly)."
			prompt nfactors, "Please enter number of PMF factors. This code is meant to operate with 10 or less."
			doprompt "Please Enter the following infomation.", folderpath_str, nfactors
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			
			PMF_CorrelationGrapher(Folderpath_str,nfactors)
			
		case 2:
			break
		endswitch
end


Function PMF_CorrelationGrapher(Folderpath_str, nfactors)

	//Establish parameters
	string Folderpath_str
	variable nfactors	
	
	//Establish DFs
	Setdatafolder $FolderPath_Str
	DFREF StartDF = getdatafolderDFR()
	string newdfname = "PMF_Grapher_and_Correlation_Solution_"+num2str(nfactors)
	newdatafolder/O/S $newdfname
	DFREF PMFDF = getdatafolderDFR()
	setdatafolder StartDF
	
	//Get lists of nessesary waves
	string y_axis_list = wavelist("*y_axis*", ";", "Text:0")
	string x_axis_list = wavelist("*PMF*",";","Text:0")
	
	//Establish General Variables
	variable i, k, z 
	variable npnts = dimsize($stringfromList(0,x_axis_list,";"),0)
	
	//Test to make sure that the number of points are the same
	variable testPMF = dimsize($stringfromList(0,x_axis_list,";"),0)
	variable testSignal = dimsize($stringfromList(0,y_axis_list,";"),0)
	
	if(testPMF!=testSignal)
		abort "Waves are not equal in points. Aborting."
	endif
	
	//Create a list of bottom_axis_list for graphing
	string bottom_axis_list = "" 
	for(i=0;i<nfactors;i++)
		string currwavename = "PMF"+num2str(nfactors)+"SF"+num2str(i+1) //PMF4SF1
		bottom_axis_list += currwavename+";"
	Endfor
	currwavename = "" 

	//We now have our x-axis, y-axis and our bottom axis names
	
	//Next duplicate our waves to our new folder
	//The idea here is to duplicate our y_axis waves to ensure that we curve fit things well
	//i.e. f44 -> f44_PMF5SF1, f44_PMF5SF2 etc. This way we have seperate waves to curve fit too
	for(i=0;i<itemsinlist(y_axis_list,";");i++)
		wave tempwave = $stringfromlist(i,y_axis_list,";")
		string currwavename_yaxis = stringfromlist(i,y_axis_list,";")
		//Next loop through the number of PMFfactors we have
		for(k=0;k<nfactors;k++)
			wave tempwave = $stringfromlist(i,y_axis_list,";")
			string currwavename_xaxis = stringfromlist(k,x_axis_list,";")
			string dupwavename = currwavename_yaxis +"_"+ currwavename_xaxis
			duplicate/O tempwave, PMFDF:$Dupwavename
		endfor
	endfor

	//Now we have our duplicated y_waves in our PMF folder that are ready for graphing and correlations, so we need to duplicate our x_waves (PMF_TSeriesFactor waves)
	for(i=0;i<nfactors;i++)
		wave tempwave = $stringfromlist(i,x_axis_list,";")
		Dupwavename = stringfromlist(i,x_axis_list,";")
		duplicate/O tempwave, PMFDF:$Dupwavename
	
	endfor


	setdatafolder PMFDF

	//Okay, everything has been duplicated and moved over to the new data folder; so we are ready to do some graphing
	//and correlations. 
	//The idea here is to make a graph that has all of the different factors vs their PMF counterparts and then to 
	//establish a wave that will hold the correlations and slopes (as well as printing out some information on a textbox)
	//on the graph.
	
	
	//Matrix for R2 and slope
		variable nrows = itemsinlist(x_axis_list,";")
		variable ncolums = itemsinlist(y_axis_list,";")
		Make/O/D/N=(nrows,ncolums) Correlation_Matrix
		Note Correlation_Matrix, "Rows (top to bottom) are: " + x_axis_list
		Note Correlation_Matrix, "Columns(left to right) are: " + y_axis_list
		Make/O/D/N=(nrows,ncolums) Slope_Matrix
		Note Slope_Matrix, "Rows (top to bottom) are: " + x_axis_list
		Note Slope_Matrix, "Columns(left to right) are: " + y_axis_list
	
	
//	//Do all graphing through a loop to cover all of the factors we have
	for(i=0;i<itemsinlist(y_axis_list,";");i++)
		//Establish the name of the Graph to append things too
		string GraphName_y = stringfromlist(i,y_axis_list,";")
		string GraphName_x = "PMF"+num2str(nfactors)+"S"
		string GraphName = "ScatterPlot_"+GraphName_y+"_vs_"+GraphName_x
		
		//Establish waves that contain what we will be graphing 
		string graphlist_y_support = GraphName_y+"*"
		string graphlist_y = wavelist(graphlist_y_support,";","Text:0")
		string graphlist_x = x_axis_list	//TO help fight against wavelist not getting waves in the correct order
//		string graphlist_x = wavelist("PMF*",";","Text:0")
		
		//Find out how we should split the x_axis
		Variable Splitaxis = (100/nfactors)/100 //last /100 is to get it into decimal places
		variable Currhigh, currlow
		
		//Start Graphing (ensure we get rid of another window of the same type)
		Killwindow/Z $GraphName
		Display/N=$GraphName
		
		//Start a loop to begin the appending of traces
		for(k=0;k<nfactors;k++)
			//First establish the waves
			wave tempwave_x = $stringfromlist(k,graphlist_x, ";")
			wave tempwave_y = $stringfromlist(k,graphlist_y, ";")
			//Now append the waves
			Appendtograph/W=$GraphName/B=$stringfromlist(k,bottom_axis_list,";") tempwave_y vs tempwave_x
			//Now edit the graph to account for the fact we are putting multiple waves on it
			if(k==0)
				Currhigh = (Splitaxis*k)+SplitAxis //0*0.25+0.25 = 0.25; 1*0.25+0.25 = 0.5; 2*0.25+0.25 = 0.75 etc
				Currlow = Splitaxis*k	//0*0.25 = 0 ; 1*0.25 = 1; 2*0.25 = 0.5 etc
			elseif(k!=0)
				Currhigh = (Splitaxis*k)+SplitAxis //0*0.25+0.25 = 0.25; 1*0.25+0.25 = 0.5; 2*0.25+0.25 = 0.75 etc
				Currlow = (Splitaxis*k)+0.02	//0*0.25 = 0 ; 1*0.25 = 1; 2*0.25 = 0.5 etc + offset
			endif
			//Sometimes we will be a bit ahead of 1 which results in an error. 
			if(k==nfactors-1)
				Currhigh = 0.99
			Endif
			ModifyGraph/W=$GraphName mode($nameofwave(tempwave_y))=2,lsize($nameofwave(tempwave_y))=2,rgb($nameofwave(tempwave_y))=(0,0,0), AxisEnab($stringfromlist(k,bottom_axis_list,";"))={currlow,currhigh}, freePos($stringfromlist(k,bottom_axis_list,";"))=0
			//Label Appropriate axis
			Label/W=$GraphName $stringfromlist(k,bottom_axis_list,";") "\\Z08"+nameofwave(tempwave_x)
			string labelLeft_str = ReplaceString("y_axis_",GraphName_y,"")
			Label/W=$GraphName left "\\Z16"+labelLeft_str
			//Now make the curve fit
			CurveFit/Q line $nameofwave(tempwave_y) /X=$nameofwave(tempwave_x) /D 
			//Create the textbox and wave to store information
			TextBox/W=$GraphName/A=LT/F=2 "\\Z07\f01"+labelLeft_str+" vs "+nameofwave(tempwave_x)+"\rR\S2\M\\Z07\f01 = "+num2str(v_R2) + "\rSlope = " + num2str(v_sigb)
			//Update our slope and correlation matrix
			Correlation_Matrix[k][i] = v_R2
			Slope_Matrix[k][i] = v_sigb
			
		endfor	
	Endfor
	
	string Tablename = "MatrixTable_"+GraphName_x
	Killwindow/Z $TableName
	Edit/N=$Tablename 
	Appendtotable/W=$TableName Correlation_Matrix
	Appendtotable/W=$TableName Slope_Matrix 
	
	setdatafolder StartDF
	doalert/T="Code Completion Message" 0, "The code has been ran, ensure that the correlations seem sound as sometimes there are errors in organizing the string list of PMF factors. If so then drag the waves to the root and then back into the folder."
End




Function PMF_ElementalRatios_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert 1, "Before continuing ensure that the Profile Factor waves have a common marker to identify them."
			if(V_Flag==1)
			elseif(V_flag==2)
				Abort "User Aborted."
			endif
			string folderpath_str = ""
			string MSS_Base_str = "" 
			string Identify_str = "" 
			variable nfactors
			
			prompt folderpath_str, "Please enter the full path to the folder the waves are held."
			prompt Identify_Str, "What is the common marker to identify these waves?"
			prompt MSS_Base_str, "Please enter the path to the MSS_Base wave to use."
			prompt nfactors, "Please enter number of PMF factors. This code is meant to operate with 10 or less."
			doprompt "Please Enter the following infomation.", folderpath_str,Identify_Str, MSS_Base_str,nfactors
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave MSS_base = $MSS_Base_str
			PMF_ElementalRatios(Folderpath_str,Identify_Str,MSS_base, nfactors)
			
		case 2:
			break
		endswitch
end




Function PMF_ElementalRatios(Folderpath_Str,Identify_Str, MSS_Base, nfactors)

	//Establish Function Parameters
	string FolderPath_Str,Identify_Str
	wave MSS_Base
	variable nfactors
	
	//Establish Local Parameters
	string IDHelper = Identify_Str+"*"
	string Identify_List = wavelist(IDHelper, ";", "TEXT:0")
	variable nwaves = itemsinlist(Identify_List,";")
	variable pos_43 //Position for fCHO 
	variable pos_44 //Position for fCO2
	variable ratio_OC, ratio_HC, OxState	
	
	//Establish strings for naming things
	string namelist = "", namebase = "PMF", name_sf = "SF"
	variable i 
	for(i=0;i<nfactors;i++)
		string name2add =nameofwave($stringfromlist(i,Identify_List,";"))
//		string name2add = namebase+num2str(nfactors)+name_sf+num2str(i+1) //PMF;9;SF;1
		namelist+=name2add+";"
	endfor

	//Now we have the namelist establish waves to store outputs
	make/o/d/n=(nfactors) O2C = NaN
	note O2C, "O:C ratio from Canagaratna et al. 2015."
	note O2C, "For HR: Calcualted as: O:C = 0.75*(1.26-0.623*fCO2+2.28*fCHO)"
	note O2C, "For UMR: Calcualted as: O:C = 0.079+4.31*(fCO2); where fCO2 is f44"
	make/o/d/n=(nfactors) H2C = NaN
	note H2C, "H:C ratio from Canagaratna et al. 2015."
	note H2C, "For HR: Calcualted as: H:C = 0.91*(1.07+1.07*fCHO); where fCHO is f43"
	note H2C, "For UMR: Calcualted as: H:C = 1.12+7.74*fCHO-17.77*fCHO^2"
	make/o/d/n=(nfactors) OSc = NaN
	note OSc,"OSc ratio from Canagaratna et al. 2015."
	note OSc, "Calcualted as: OSc ~ 2*(O:C-H:C)"
	make/o/d/n=(nfactors)/T Sol_Factor_Name
	note Sol_Factor_Name, "Solution and Factor designation."
	
	//Triangle Plot Waves
	Make/o/d/n=(nfactors) MS_OA = NaN
	note MS_OA, "Total (Summed) Signal of MS OA for each PMF Factor"
	Make/o/d/n=(nfactors) f44 = NaN
	note f44, "Signal at m/z 44 normalized by the total OA signal from the wave "+nameofWave(MS_OA)+"."
	Make/o/d/n=(nfactors) f43 = NaN
	note f43, "Signal at m/z 43 normalized by the total OA signal from the wave "+nameofWave(MS_OA)+"."
	Make/o/d/n=(2) fCurve0 
	note fCurve0, "This is the curve in the 44/OA vs 44/43 space from figure 4 of the Ng et al. (2010) paper."
	note fCurve0, "Slope and intercept are -6.0204 and 0.4154 which is valid for 0.069 ≤ x ≤0.18, and y ≤ 0.295"
	Make/o/d/n=(2) fCurve1
	note fCurve1, "This is the curve in the 44/OA vs 44/43 space from figure 4 of the Ng et al. (2010) paper."
	note fCurve1, "Slope and intercept are −1.8438 and 0.3319 which is valid for 0.069 ≤ x ≤0.18, and y ≤ 0.295"
	fCurve0[0]=0.295;fCurve1[0] = 0.295
	fCurve0[1]=0;fCurve1[1] = 0
	SetScale/I x 0.01985,0.069,"", fCurve0
	SetScale/I x 0.01985,0.18,"", fCurve1
//	variable ScaleColor = 257
//	make/o/d/n=(10,10) TrianglePlot_ColorWave
//	TrianglePlot_ColorWave[][p] = 17*p*(ScaleColor) 
//	
	
	for(i=0;i<nfactors;i++)
		//Establish the tempwave to operate on as well as the positions of f29 and f44
		wave tempwave = $stringfromlist(i,Identify_List,";")
		pos_43 = binarysearch(MSS_Base, 43)
		pos_44 = binarysearch(MSS_Base, 44)
		//Perform Calculations
		//THESE ARE FOR HR-AMS MEASURMENTS
//		ratio_OC = 0.75*(1.26-0.623*tempwave[pos_44]+2.28*tempwave[pos_29])
//		ratio_HC = 0.91*(1.07+1.07*tempwave[Pos_29])
//		OxState = 2*ratio_OC-ratio_HC
		//BELOW IS FOR UMR 
		ratio_OC = 0.079+4.31*tempwave[pos_44]
		ratio_HC = 1.12+6.74*tempwave[pos_43]-17.77*tempwave[pos_43]^2
//		OxState = 2*(ratio_OC-ratio_HC)	//Thought there was a () but there isn't
		OxState = 2*ratio_OC-ratio_HC
		//Assign outputs to proper waves
		O2C[i] = ratio_OC
		H2C[i] = ratio_HC
		OSc[i] = OxState
		Sol_Factor_Name[i] = stringfromlist(i,namelist,";")
		
		//Store Triangle Plot Variables/Waves
		MS_OA[i] = sum(tempwave)
		f44[i] = tempwave[pos_44] 
		f43[i] = tempwave[pos_43]
	
	Endfor
	
	//Make Triangle Plot	
	String Graphname = "Triangle_Plot_PMF"+num2str(nfactors)+"S"
	killWindow/Z $Graphname
	Display/N=$Graphname f44 vs f43
	ModifyGraph mode(f44)=3,textMarker(f44)={Sol_Factor_Name,"default",1,0,5,0.00,0.00},lsize=10
	ModifyGraph fStyle=3,fSize=18;DelayUpdate
	Label left "f44";DelayUpdate
	Label bottom "f43"
	ModifyGraph ZColor($nameofwave(f44)) = {$nameofwave(OSc),*,*,Classification,0}
	ColorScale/C/N=O2C_CS/A=RC "Oxidation State"
	Appendtograph fCurve0, fCurve1
	ModifyGraph rgb(fCurve0)=(0,0,0)
	ModifyGraph rgb(fCurve1)=(0,0,0)
	
	//Make Elemental Ratios Table
	string tablename = "ElementalRatios_PMF"+num2str(nfactors)+"S"
	killWindow/Z $tablename
	Edit/N=$tablename
	appendtotable/W=$tablename Sol_Factor_Name,O2C,H2C,OSc
	


End









Function PMF_FracDom(twave, nfactors)	//This fuction will take PMF factors and calculate which % domination for each wrt time
	wave twave
	variable nfactors
	
	string Base_PMF_Name = "Percentage_Contribution_"
	variable npnts = dimsize(twave,0)
	variable i, j 
	j = 0 
	
	//Determine PMF waves
	DFREF CurrDF = GetdataFolderDFR()
	variable nwaves = countObjectsDFR(CurrDF, 1)
	string PMFwList = ""
	string PMFNameStr = "" 
	prompt PMFNameStr, "What does the PMF waves of intrest start with?"
	doprompt "Please Enter the Following Information", PMFNameStr
	if(V_Flag==1)
		Abort "User Cancelled"
	Endif
	PMFNameStr += "*"
	PMFwList = wavelist(PMFNameStr, ";", "Text:0")
	string tempwavenumber = "tempwave"+num2str(i)
	wave tempwave1 = $stringfromlist(0,PMFwList,";")
	wave tempwave2 = $stringfromlist(1,PMFwList,";")
	wave tempwave3 = $stringfromlist(2,PMFwList,";")
	wave tempwave4 = $stringfromlist(3,PMFwList,";")
	wave tempwave5 = $stringfromlist(4,PMFwList,";")
	wave tempwave6 = $stringfromlist(5,PMFwList,";")
	wave tempwave7 = $stringfromlist(6,PMFwList,";")
	wave tempwave8 = $stringfromlist(7,PMFwList,";")
	wave tempwave9 = $stringfromlist(8,PMFwList,";")
	wave tempwave10 = $stringfromlist(9,PMFwList,";")
	
	//establish all % contribution waves from nfactors
	for(i=1;i<nfactors+1;i++)
		string PMFwavename = Base_PMF_Name+stringfromlist(j,PMFwList,";")
		make/o/d/n=(npnts) $PMFwavename = NaN
		j++
	endfor
	make/o/d/n=(npnts) PMF_Total
	
	string PercentageList = wavelist("Percentage_Contribution_*",";","Text:0")
//	variable NPercentageList = itemsInList(PercentageList, ";")
	
	wave pwave1 = $stringfromlist(0,PercentageList,";")
	wave pwave2 = $stringfromlist(1,PercentageList,";")
	wave pwave3 = $stringfromlist(2,PercentageList,";")
	wave pwave4 = $stringfromlist(3,PercentageList,";")
	wave pwave5 = $stringfromlist(4,PercentageList,";")
	wave pwave6 = $stringfromlist(5,PercentageList,";")
	wave pwave7 = $stringfromlist(6,PercentageList,";")
	wave pwave8 = $stringfromlist(7,PercentageList,";")
	wave pwave9 = $stringfromlist(8,PercentageList,";")
	wave pwave10 = $stringfromlist(9,PercentageList,";")
	
	//Select what waves to apply calcualtion too
	
	string highnumbwave = stringfromList(nfactors-1,PercentageList,";")
	if(nfactors==10)
		for(i=0;i<npnts;i++)
			PMF_Total[i] = tempwave1[i]+tempwave2[i]+tempwave3[i]+tempwave4[i]+tempwave5[i]+tempwave6[i]+tempwave7[i]+tempwave8[i]+tempwave9[i]+tempwave10[i]
			pwave1[i] = (tempwave1[i]/PMF_Total[i])*100
			pwave2[i] = (tempwave2[i]/PMF_Total[i])*100
			pwave3[i] = (tempwave3[i]/PMF_Total[i])*100
			pwave4[i] = (tempwave4[i]/PMF_Total[i])*100
			pwave5[i] = (tempwave5[i]/PMF_Total[i])*100
			pwave6[i] = (tempwave6[i]/PMF_Total[i])*100
			pwave7[i] = (tempwave7[i]/PMF_Total[i])*100
			pwave8[i] = (tempwave8[i]/PMF_Total[i])*100
			pwave9[i] = (tempwave9[i]/PMF_Total[i])*100
			pwave10[i] = (tempwave10[i]/PMF_Total[i])*100
		Endfor
	elseif(nfactors==9)
		for(i=0;i<npnts;i++)
			PMF_Total[i] = tempwave1[i]+tempwave2[i]+tempwave3[i]+tempwave4[i]+tempwave5[i]+tempwave6[i]+tempwave7[i]+tempwave8[i]+tempwave9[i]
			pwave1[i] = (tempwave1[i]/PMF_Total[i])*100
			pwave2[i] = (tempwave2[i]/PMF_Total[i])*100
			pwave3[i] = (tempwave3[i]/PMF_Total[i])*100
			pwave4[i] = (tempwave4[i]/PMF_Total[i])*100
			pwave5[i] = (tempwave5[i]/PMF_Total[i])*100
			pwave6[i] = (tempwave6[i]/PMF_Total[i])*100
			pwave7[i] = (tempwave7[i]/PMF_Total[i])*100
			pwave8[i] = (tempwave8[i]/PMF_Total[i])*100
			pwave9[i] = (tempwave9[i]/PMF_Total[i])*100
		Endfor
	elseif(nfactors==8)
		for(i=0;i<npnts;i++)
			PMF_Total[i] = tempwave1[i]+tempwave2[i]+tempwave3[i]+tempwave4[i]+tempwave5[i]+tempwave6[i]+tempwave7[i]+tempwave8[i]
			pwave1[i] = (tempwave1[i]/PMF_Total[i])*100
			pwave2[i] = (tempwave2[i]/PMF_Total[i])*100
			pwave3[i] = (tempwave3[i]/PMF_Total[i])*100
			pwave4[i] = (tempwave4[i]/PMF_Total[i])*100
			pwave5[i] = (tempwave5[i]/PMF_Total[i])*100
			pwave6[i] = (tempwave6[i]/PMF_Total[i])*100
			pwave7[i] = (tempwave7[i]/PMF_Total[i])*100
			pwave8[i] = (tempwave8[i]/PMF_Total[i])*100
		Endfor
		elseif(nfactors==7)
		for(i=0;i<npnts;i++)
			PMF_Total[i] = tempwave1[i]+tempwave2[i]+tempwave3[i]+tempwave4[i]+tempwave5[i]+tempwave6[i]+tempwave7[i]
			pwave1[i] = (tempwave1[i]/PMF_Total[i])*100
			pwave2[i] = (tempwave2[i]/PMF_Total[i])*100
			pwave3[i] = (tempwave3[i]/PMF_Total[i])*100
			pwave4[i] = (tempwave4[i]/PMF_Total[i])*100
			pwave5[i] = (tempwave5[i]/PMF_Total[i])*100
			pwave6[i] = (tempwave6[i]/PMF_Total[i])*100
			pwave7[i] = (tempwave7[i]/PMF_Total[i])*100
		Endfor
	elseif(nfactors==6)
		for(i=0;i<npnts;i++)
			PMF_Total[i] = tempwave1[i]+tempwave2[i]+tempwave3[i]+tempwave4[i]+tempwave5[i]+tempwave6[i]
			pwave1[i] = (tempwave1[i]/PMF_Total[i])*100
			pwave2[i] = (tempwave2[i]/PMF_Total[i])*100
			pwave3[i] = (tempwave3[i]/PMF_Total[i])*100
			pwave4[i] = (tempwave4[i]/PMF_Total[i])*100
			pwave5[i] = (tempwave5[i]/PMF_Total[i])*100
			pwave6[i] = (tempwave6[i]/PMF_Total[i])*100
		Endfor
	elseif(nfactors==5)
		for(i=0;i<npnts;i++)
			PMF_Total[i] = tempwave1[i]+tempwave2[i]+tempwave3[i]+tempwave4[i]+tempwave5[i]
			pwave1[i] = (tempwave1[i]/PMF_Total[i])*100
			pwave2[i] = (tempwave2[i]/PMF_Total[i])*100
			pwave3[i] = (tempwave3[i]/PMF_Total[i])*100
			pwave4[i] = (tempwave4[i]/PMF_Total[i])*100
			pwave5[i] = (tempwave5[i]/PMF_Total[i])*100
		Endfor
	elseif(nfactors==4)
		for(i=0;i<npnts;i++)
			PMF_Total[i] = tempwave1[i]+tempwave2[i]+tempwave3[i]+tempwave4[i]
			pwave1[i] = (tempwave1[i]/PMF_Total[i])*100
			pwave2[i] = (tempwave2[i]/PMF_Total[i])*100
			pwave3[i] = (tempwave3[i]/PMF_Total[i])*100
			pwave4[i] = (tempwave4[i]/PMF_Total[i])*100
		Endfor
	elseif(nfactors==3)
		for(i=0;i<npnts;i++)
			PMF_Total[i] = tempwave1[i]+tempwave2[i]+tempwave3[i]
			pwave1[i] = (tempwave1[i]/PMF_Total[i])*100
			pwave2[i] = (tempwave2[i]/PMF_Total[i])*100
			pwave3[i] = (tempwave3[i]/PMF_Total[i])*100
		Endfor
	elseif(nfactors==2)
		for(i=0;i<npnts;i++)
			PMF_Total[i] = tempwave1[i]+tempwave2[i]
			pwave1[i] = (tempwave1[i]/PMF_Total[i])*100
			pwave2[i] = (tempwave2[i]/PMF_Total[i])*100
		Endfor
	elseif(nfactors==1)
		for(i=0;i<npnts;i++)
			PMF_Total[i] = tempwave1[i]
			pwave1[i] = (tempwave1[i]/PMF_Total[i])*100
		Endfor
	endif
		
	killwaves/Z PMF_Total
	
End



/////////////////////////////////////////////////////////////////////
//////////////////////////Do X with Nans/////////////////////////////
/////////////////////////////////////////////////////////////////////


//Button that runs a code that will sum a single wave when that wave has NaNs.
Function SumWNans_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			//Inital Check: Is the user in a good Data Folder?
			doalert/T="Initial Check" 2, "Are you in the Data folder that holds the waves to be used?"
			if(V_Flag ==1)
			elseif(V_Flag==2)
				abort "User is not in a good Data Folder to run the code. Aborting."
			elseif(V_Flag==3)
				abort "User is not in a good Data Folder to run the code. Aborting."
			else
				abort "Unknown Input. Aborting."
			endif
		
			string w_str = ""
	
			prompt w_str, "Please enter the name of the wave to be used."
			doprompt "Please Enter the following infomation.", w_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave w = $w_str
			if(waveexists(w)==1)
				SumNaNs(w)
			elseif(waveexists(w)==0)
				abort "Wave inputted does not exist. Aborting."
			endif
			
		case 2:
			break
		endswitch
end

//This function will sum a wave that the user provides, and if the wave contains NaNs then it will not account for those values, instead provided an accurate sum instead of 'NaN'
//This function was designed to be called in other functions, so it has the /D flag to return a double precision number. It will also print the sum. 
function/D SumNaNs(w) //Sums a single wave w/ nans
	
	wave w //wave of intrested that user inputs
	variable p1,p2
	
	variable npnts = dimsize(w,0) //How many points are in wave w
	variable i //indexing variable
	variable Total //Holds sum of wave
	
	for(i=0;i<npnts;i++)	//starting at zero, for all points in the wave if the value at any given point is NaN then skip it (not adding it to the total) if it is a number, then add it to the total. 
		if(numtype(w[i]) == 2)
		elseif(numtype(w[i]) != 2)
			total+=w[i]
		endif	
	Endfor
	
//	print total
	return Total
End


//Button that runs the SumWNaNs code
Function SumWavesNans_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string w1_str = ""
			string w2_str = ""
	
			prompt w1_str, "Please enter the name of the first wave to be used."
			prompt w2_str, "Please enter the name of the second wave to be used."
			doprompt "Please Enter the following infomation.", w1_str, w2_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave w1 = $w1_str
			wave w2 = $w2_str
			SumWNaNs(w1,w2)
			
		case 2:
			break
		endswitch
end

//Button that runs the mulitply2wnans code
Function MultiplyWavesNans_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string w1_str = ""
			string w2_str = ""
	
			prompt w1_str, "Please enter the name of the first wave to be used."
			prompt w2_str, "Please enter the name of the second wave to be used."
			doprompt "Please Enter the following infomation.", w1_str, w2_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave w1 = $w1_str
			wave w2 = $w2_str
			multiply2wwnans(w1,w2)
			
		case 2:
			break
		endswitch
end

//This function will multiply two waves that are provided by the user, providing the sum while also accounting for NaNs
Function/D multiply2wwnans(w1,w2)
	//Establish parameters
	wave w1, w2
	
	//Establish variables
	variable total
	variable npnts = numpnts(w1)
	variable i
	
	//Duplicate the first wave so we can have a wave of the same length that can hold all of the values as the code runs
	duplicate w1, Temp_Multiply2Waves
	//Establish a wave reference (tempwave) to the duplicated wave
	wave tempwave = Temp_Multiply2Waves
	
	
	for(i=0;i<npnts;i++)
		if(numtype(w1[i]) == 0 && (numtype(w2[i]) ==0)) // If the first and second wave are real numbers, then proceed with the multiplication. 
			total+=(w1[i]*w2[i])
			tempwave[i] = (w1[i]*w2[i])
		else	//else do nothing and continue proceeding throught the loop
		endif
	endfor
	print total
	return total
End


Function PointsinWave2NaN_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string w_str = ""
			variable p1,p2
	
			prompt w_str, "Please enter the name of the first wave to be used."
			prompt p1, "Please enter the first point to be used."
			prompt p2, "Please enter the last point to be used."
			doprompt "Please Enter the following infomation.", w_str, p1,p2
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave w = $w_str
			Pointsinwave2NAN(w, p1, p2)
			
		case 2:
			break
		endswitch
end

Function Pointsinwave2NAN(w, p1, p2)	//sets points in a wave to NaN from point 1 to point 2
 wave w
 variable p1, p2
 variable i 
 for(i=p1;i<=p2;i+=1)
 	W[i] = NaN
 Endfor
End




//Function will sum 2 waves without having a NaN in one wave result in the summed waves being equal to NaN at that index
function SumWNaNs(w1,w2)
	
	wave w1,w2 //waves to sum together
	
	
	//get informations from the waves
	variable nptns_w1 = dimsize(w1,0)
	variable npnts_w2 = dimsize(w2,0)
	//Check to see they are both the same dimensions
	if(nptns_w1 != npnts_w2)
		doalert 0, "The waves inputted are not the same dimensions!"
		return -1
	else
	Endif
	//Duplicate the first wave inputted to have a third wave of the same dimension to hold the summed values
	duplicate/O w1, Temp_Summed_Wave
	Temp_Summed_Wave = NaN
	
	//set up variables
	variable i, nt_w1, nt_w2
	
	//Set up loop with conditionals
	for(i=0;i<nptns_w1;i++)
	nt_w1 = numtype(w1[i])
	nt_w2 = numtype(w2[i])
		if(nt_w1 == 2) //If we detect a NaN at index i in wave 1
			Temp_Summed_Wave[i] = w2[i]
		elseif(nt_w2 == 2) //If we detect a NaN at Index i in wave 2
			Temp_Summed_Wave[i] = w1[i]
		elseif(nt_w1 == 2 && nt_w2 == 2) //If we detect both of these waves are NaN at index i
			Temp_Summed_Wave[i] = w1[i] +w2[i]
		elseif(nt_w1 == 0 && nt_w2 == 0) //If we detect both of these waves are not NaN at index i
			Temp_Summed_Wave[i] = w1[i] + w2[i]
		endif	
	endfor
End


/////////////////////////////////////////////////////////////////////
///////////////////////Make Interval Time Wave///////////////////////
/////////////////////////////////////////////////////////////////////

//Button that runs the twave_interval function
Function IntervalTwave_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up

			
			variable y,m,d,h,mi,s,npnts, interval
	
			prompt y, "Please enter the year to be used."
			prompt m, "Please enter the month to be used."
			prompt d, "Please enter the day to be used."
			prompt h, "Please enter the hour to be used."
			prompt mi, "Please enter the minute to be used."
			prompt s, "Please enter the seconds to be used."
			prompt npnts, "Please enter the number of point to extend the created time wave."
			prompt interval, "Please enter the interval to increase the time wave by in seconds."
			doprompt "Please Enter the following infomation.", y,m,d,h,mi,s,npnts, interval
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			Twave_Interval(y,m,d,h,m,s,npnts, interval)
			
		case 2:
			break
		endswitch
end


//This function will create a timewave with the starting point and interval of the points in the wave decided by the user. 
Function Twave_Interval(y,m,d,h,mi,s,npnts, interval)
	//Establish Parameters
	variable y,m,d,h,mi,s,npnts, interval
	
	//Establish variables
	variable ymd = date2secs(y,m,d)
	variable hms = (h*3600)+(m*60)+s
	variable t_start = ymd+hms

	//Establish the name of the wave 
	string twavename = "Time_Wave_Interval_"+num2str(interval)+"_Seconds"	

	//Make the wave name
	make/o/d/n=(npnts) $twavename
	wave timewave = $twavename
	timewave[0] = t_start
	
	//Run the for loop to fill out the time wave
	variable i 
	for(i=1;i<npnts;i++)
		timewave[i] = (t_start)+(i*interval)
	Endfor

	//Change the wave to the date ("dat") format
	setscale d, 0,0, "dat", Timewave

End

/////////////////////////////////////////////////////////////////////
///////////////////////Time Stats Function///////////////////////////
/////////////////////////////////////////////////////////////////////


Function Time_Stats_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string twave_str = ""
			string sigwave_str = ""
			variable interval
			
			prompt sigwave_str, "Please enter name of the signal wave to be used."
			prompt twave_str, "Please enter time wave to be used."
			prompt interval, "Please enter the interval of inspection in seconds to be used."
			doprompt "Please Enter the following infomation.", sigwave_str, twave_str, interval
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			wave sigwave = $sigwave_str
			wave twave = $twave_str
			time_stats(twave,sigwave, interval)
			
		case 2:
			break
		endswitch
end

function time_stats(twave,sigwave, tinterval) //Function to calculate stats for a certain wave based on a time interval; tinterval in seconds
	wave twave, sigwave
	variable tinterval
	
	variable mintdiff 
	mintdiff = min_t_diff(twave)
	if(tinterval<= mintdiff)
		doalert/T="Time Error Alert!" 0, "Time interval entered is less than the smallest interval of time in the inputted time series. Code cannot progress!"
		abort "Due to Time Error, function will abort."
	else
	
	variable npnts = dimsize(twave,0)
	
	make/free/o/d/n=(npnts) Stats_Holder_Avg = NaN
	make/free/o/d/n=(npnts) Stats_Holder_Median = NaN
	make/free/o/d/n=(npnts) Stats_Holder_Stddev = NaN
	make/free/o/d/n=(npnts) Time_Holder_Midpoint = NaN
	make/free/o/d/n=(npnts) Time_Holder_Startpoint = NaN
	make/free/o/d/n=(npnts) Time_Holder_Endpoint = NaN
	
	string stats_wave_name_Starttime = nameofwave(sigwave) + "_Stats_"+ num2str(tinterval)+"_StartTime"
	string stats_wave_name_Stoptime = nameofwave(sigwave) + "_Stats_"+ num2str(tinterval)+"_StopTime"
	string stats_wave_name_Midtime = nameofwave(sigwave) + "_Stats_"+ num2str(tinterval)+"_MidTime"
	string time_stats_wave_name_avg = nameofwave(sigwave) + "_Time_Stats_"+ num2str(tinterval)+"_Avg"
	string time_stats_wave_name_med = nameofwave(sigwave) + "_Time_Stats_"+ num2str(tinterval)+"_Median"
	string time_stats_wave_name_stddev = nameofwave(sigwave) + "_Time_Stats_"+ num2str(tinterval)+"_StdDev"

	variable i, j, a, starttime, endtime, currtime 
	starttime = twave[0]
	endtime = starttime + tinterval
	currtime = twave[0]
	j=0
	a=0
	
	for(i=0;i<npnts;i++)
		currtime = twave[i]
		if(starttime <= currtime && currtime < endtime)	//If we have a current time greater than the beginning time and less than the end time, proceed
			//all is well, continue
		elseif(starttime < currtime && currtime > endtime)	//If we have a current time greater than the beginnign time and also greater than the end time, change interval and do stuff
			wavestats/Q/R=[j,i] sigwave
			if(numtype(V_Avg) == 0 && numtype(V_Sdev) == 0)
				Stats_Holder_Avg[a] = V_Avg
				Stats_Holder_Median[a] = median(sigwave, pnt2x(sigwave,j),pnt2x(sigwave,i))	//pnt2x to ensure pointindexing and not x scaling if wave has any x scaling
				Stats_Holder_Stddev[a] = V_sdev
				Time_Holder_Midpoint[a] = (Starttime + Endtime)/2
				Time_Holder_Startpoint[a] = Starttime
				Time_Holder_Endpoint[a] = Endtime
				starttime = endtime
				endtime = starttime + tinterval
				j = i 
				i-=1
				a+=1
				continue
			elseif(numtype(V_Avg) == 0 && numtype(V_Sdev) == 2)	//If we happen to have a time overlap where we have 1 point of valid time and stdev cannot be calculated
				Stats_Holder_Avg[a] = NaN
				Stats_Holder_Median[a] = NaN
				Stats_Holder_Stddev[a] = NaN	//Make stddev stand out a lot
				Time_Holder_Midpoint[a] = (Starttime + Endtime)/2
				Time_Holder_Startpoint[a] = Starttime
				Time_Holder_Endpoint[a] = Endtime
				starttime = endtime
				endtime = starttime + tinterval
				j = i 
				a+=1
			else //In any other case
				Stats_Holder_Avg[a] = V_Avg
				Stats_Holder_Median[a] = median(sigwave,j,i)
				Stats_Holder_Stddev[a] = V_Sdev
				Time_Holder_Midpoint[a] = (Starttime + Endtime)/2
				Time_Holder_Startpoint[a] = Starttime
				Time_Holder_Endpoint[a] = Endtime
				starttime = endtime
				endtime = starttime + tinterval
				j = i 
				a+=1
			Endif
		endif
	
	endfor
	
	variable restofpnts = npnts - a
	DeletePoints a,restofpnts, Stats_Holder_Avg
	DeletePoints a,restofpnts, Stats_Holder_Median
	DeletePoints a,restofpnts, Stats_Holder_Stddev
	DeletePoints a,restofpnts, Time_Holder_Midpoint
	DeletePoints a,restofpnts, Time_Holder_Startpoint
	DeletePoints a,restofpnts, Time_Holder_Endpoint
	
	
	Duplicate/O Stats_Holder_Avg, $time_stats_wave_name_avg
	Duplicate/O Stats_Holder_Median, $time_stats_wave_name_med
	Duplicate/O Stats_Holder_Stddev, $time_stats_wave_name_StdDev
	Duplicate/O Time_Holder_Startpoint, $stats_wave_name_Starttime
	wave tempwave1 = $stats_wave_name_Starttime
	Duplicate/O Time_Holder_Endpoint, $stats_wave_name_Stoptime
	wave tempwave2 = $stats_wave_name_Stoptime
	Duplicate/O Time_Holder_Midpoint, $stats_wave_name_Midtime
	wave tempwave3 = $stats_wave_name_Midtime
	
//	concatenate/O {Stats_Holder_Avg,Stats_Holder_Median,Stats_Holder_Stddev}, $Stats_wave_name
//	concatenate/O {Time_Holder_Startpoint,Time_Holder_Endpoint,Time_Holder_Midpoint} ,$time_stats_wave_name
//	wave tempwave = $stats_wave_name
//	wave tempwave1 = $time_stats_wave_name
//	note tempwave1, "Rows 0-2 are Startime, Endtime, Midpoint Time, respectively"
//	note tempwave, "A value of -9999 for the Standard Deviation means that the time period in which stats were performed was not condusive to provide a standard deviation. i.e. too little points."
//	note tempwave, "Rows 0-2 are Mean, Median, and Sdev, respectively"

	setscale d, 0,0, "dat", tempwave1
	setscale d, 0,0, "dat", tempwave2
	setscale d, 0,0, "dat", tempwave3
	

	endif
End



/////////////////////////////////////////////////////////////////////
///////////////////////Excel Time Converstions///////////////////////
/////////////////////////////////////////////////////////////////////




Function Excel2Igor(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string wname = ""
			prompt wname, "What is the name of the wave containing the Excel Datetimes?"
			doprompt "Please enter the following:", wname 
			if(V_Flag==1)
				abort "The name of the wave containing the Excel Datetimes was not entered."
			endif
			wave t_Excel = $wname	
			Excel2Igor_Time(t_Excel)
		case 2:
			break
		endswitch
		
End


Function Igor2Excel(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string wname = ""
			prompt wname, "What is the name of the wave containing the Igor Datetimes?"
			doprompt "Please enter the following:", wname 
			if(V_Flag==1)
				abort "The name of the wave containing the Igor Datetimes was not entered."
			endif
			wave t_Igor = $wname			
			Igor2Excel_Time(t_Igor)
		case 2:
			break
		endswitch
		
End


Function Excel2Igor_Time(t_Excel)

	wave t_Excel
	string newname = nameofwave(t_Excel) + "_IgorDT"
	duplicate/O t_Excel, $newname
	wave tempwave = $newname
	tempwave *=(24*3600)	//Adjust time in years (Ignore leaps years and whatnot)
	tempwave -= (365.5*4*24*3600)	//Fix single day and 4 year offset (fix time discrepancys)
	setscale d 0,0,"dat" tempwave
End

Function Igor2Excel_Time(t_Igor)
	wave t_Igor
	string newname = nameofwave(t_Igor) + "_ExcelDT"
	duplicate/O t_Igor, $newname
	wave tempwave = $newname
	tempwave += (365.5*4*24*3600) //Fixed single day and 4 year offset
	tempwave/=(24*3600) //Goes from Igor Time to Excel Time
	setscale d 0, 0, "Excel_DateTime (@ custom Format)" tempwave
	
End


Function ExcelTextWave2IgorDT_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string wname = ""
			variable v
			prompt wname, "What is the name of the wave?"
//			prompt v, "What is the value to change to a NaN?"
			doprompt "Please enter the following:", wname//, v
			if(V_Flag==1)
				abort "Aborting."
			endif
			wave w = $wname			
			ExcelTextWave2IgorDT(w)
		case 2:
			break
		endswitch
End

//AJD+RL 3/20/2025: This function will take an excel DT in the form of YYYY-MM-DD.HH:MM and convert it into an Igor friendly format
Function ExcelTextWave2IgorDT(w)

	//Establish Function Parameters
	wave/T w	//Igor reads this wave as a text wave (containing strings not variables) so make sure you indicate that the wave is registered as a text wave by using the /T flag for Text wave
	
	//Establish Local Parameters
	variable i; string column = ""	//Looping variable and reading string (for breakpoint analysis help)
	variable month; variable day; variable year; variable hour; variable minute	//These variables will store the converted (from string to number) values generated from the sscanf function below
	variable npnts = dimsize(w,0)	//Get the number of rows in the inputted wave (not the function numpnts will also work here; I am just used to using dimsize due to working with matrices aka 2D waves
	variable currDatetime, currDayTime	//These variables will hold the seconds from 1/1/1904 in the form of year, month, and day (currDateTime) and then hour and minute (currDayTime)
	
	//Make date wave to append too
	string newwavename = nameofwave(w)+"_IgorDT_Readable"	//This string will serve as the name of the generated wave; the 'nameofwave' function is very helpful to create a function that provides good generated wave names
	make/o/d/n=(npnts) $newwavename	//Because newwavename is a string I am going to use the $ to refrence the string as 'not a string'
	wave IgorDT_Wave = $newwavename	//This line will allow us to put in a wave refrence to the generated wave so we do not have to refrence the wave through $newwavename for the rest of the function
	setscale d,0,0,"dat" IgorDT_Wave	//Set the scaling of this new wave to 'dat' which will allow us to always have datetime units associated with this wave
		
	//Isolate seperate string statments
	for(i=0;i<npnts;i++)
		column = w[i]	//Just so you can see what is being looked at by the sscanf function easier
		sscanf w[i], "%4d-%2d-%2d.%2d:%2d", year, month, day, hour, minute //The sscanf function will take the string from wave w at point i (w[i]) and...
		//read through the text wave for 4 spaces and then move onto two spaces and then 2 and then 2
		//The formatting looks weird but I will break it down below
		//"% -> initate a scan of the text wave (the " is just the start of the string the function needs
		//4 -> scan for 4 characters (our year)
		//d -> take the scanned string and convert it to a decimal formatted number
		//- -> this is the separator between this field/group of characters and the next
		//%2d- -> again we initate a scan this time of two characters (our month) and convert them to a decimal number and then look for a '-' to seperate this search with the next
		//%2d. -> initate a scan of two characters (our day) and convert them to a decimal number and then look for a '.' to seperate this search with the next
		//%2d: -> initate a scan of two characters (our hour) and convert them to a decimal number and then look for a ':' to seperate this search with the next
		//%2d" -> initate a scan of two characters (our minutes) and convert them to a decimal number and then stop looking at the string is ended
		
		//The variables after the string "%4d-%2d-%2d.%2d:%2d" are where we are assigning the converted numbers too
		//Change any of these things or make the function more capable of handling different scenarios by implimenting if statements and changing the parameters of the sscanf string search parameter
	
	
		currDatetime = date2secs(year, month, day)	//Use the date2secs funciton to take our generated year, month, and day variables to get the number of seconds since 1/1/1904
		currDayTime = (hour*3600)+(minute*60)	//Use dimensional analysis to convert hour and minute variables generated to seconds
		IgorDT_Wave[i] = currDatetime+currDayTime	//Now add the generated numerical numbers together to get the seconds that lead us up to the day and how far along in the day we are and assign that to our generated wave.
	//As always feel free to highlight any built in Igor functions and right click-> 'Help for xxx' to get more information about how these functions work.
	
	endfor
	
end

function EPtime_to_igor_time_RL()
wave/t dateW,timeW
variable day, monthStr, year, hour, minute,seconds

//duplicate/o/t dateW temp
variable num=numpnts(dateW),i
//temp=dateW+" "+timeW
make/o/d/n=(numpnts(dateW)) date_igor
make/o/d/n=(numpnts(dateW)) fluxtime_igor
	
   for(i=0;i<(numpnts(dateW));i+=1)

 //   sscanf temp[i], "%4d-%2d-%2d %d:%d", year, monthStr, day, hour,minute
    sscanf dateW[i], "%1d/%2d/%2d", monthStr,day,year
    print 20+year, monthStr, day
    sscanf timeW[i], "%2d:%2d:%2d", hour,minute,seconds
    print hour,minute
    
    date_igor[i]=date2secs(20+year, monthStr, day)

    fluxtime_igor[i]=date_igor[i]+(3600*hour + 60*minute)

   endfor

end




Function Value2NaN_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string wname = ""
			variable v
			prompt wname, "What is the name of the wave?"
			prompt v, "What is the value to change to a NaN?"
			doprompt "Please enter the following:", wname, v
			if(V_Flag==1)
				abort "The name of the wave containing the Igor Datetimes was not entered."
			endif
			wave w = $wname			
			Value2NaN(w, v)
		case 2:
			break
		endswitch
End


function Value2NaN(w,v)
	//establish parameters
	wave w
	variable v
	
	//get nessesary things
	variable npnts = dimsize(w,0)
	variable i 
	string dupwavename = nameofwave(w)+"_"+num2str(v)+"_toNaN"
	duplicate w, $dupwavename
	wave tempwave = $dupwavename
	for(i=0;i<npnts;i++)
		if(tempwave[i] == v)
			tempwave[i] = NaN
		else
		endif	
	endfor



end


/////////////////////////////////////////////////////////////////////
////////////////////////////SP2 Functions////////////////////////////
/////////////////////////////////////////////////////////////////////


Function GetVED_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			variable mass, density
			prompt mass, "What is the mass in fg?"
			prompt density, "What is the density of the material in kg/m3?"
			doprompt "Please enter the following:", mass, density 
			if(V_Flag==1)
				abort "User Abort"
			endif
			getVED (mass, density)
		case 2:
			break
		endswitch
		
End

Function getVED (mass, density)
	Variable mass, density
	Variable VED, MED	
	
	MED = (((6*(mass*1*10^-18))/(pi*density))^(1/3))*(1*10^9)
	VED =(((6*(mass*1*10^-18))/(pi*density))^(1/3))*(1*10^9)
	Print "VED = " + num2str(VED)// +" and MED = " + num2str(MED)
End

Function rBCmobility2Mass_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			variable Dmob
			string fittype
			prompt Dmob, "What is the mobility diameter? (Note: Effective density provided from 71-824 nm)"
			prompt fittype, "Input 'Linear' for a linear fit or 'Poly' a polynominal fit (5 terms)"
			doprompt "Please enter the following:", Dmob, fittype
			if(V_Flag==1)
				abort "User Abort"
			endif
			rBCmobility2Mass(dMob, fittype)
		case 2:
			break
		endswitch
		
End

Function/D rBCmobility2Mass(dMob,fittype)
	//Establish Function Parameters	
	Variable dMob
	string fittype
	
	//Access AdamToolkit
	DFREF StartDF = getdatafolderDFR()
	Setdatafolder root:AdamToolkit
	DFREF AJDDF = getdatafolderDFR()
	
	
	//Establish local paramters
	variable MassfromDmobandDeff, dEff
	wave Gysel_dEff_Density, Gysel_dEff_Diameter, Gysel_dEff_Mass
	
	//Thought process; AdamToolkit has the effective density data from Gysel et al. (2011) SI in the form of 
	//Diameter, Density and Mass waves, we have diameter from (SMPS/DMA) and they supply an effective density so we run
	//a linear parameterization through those to find a linear equation that will allow us to put in a diameter and derive mass
	//This is done via the equation: 
	//Mass = (deff*pi*Dmob^3/ 6)	-> this is Gysel et al. (2011) Equation rearranged to solve for mass
	//So we want to solve for mass, and we have Dmob and we need dEff which Gysel et al. (2011) provides
	//We will get dEff at the diameter we want through a curve fit of Density vs Dmob
	//Ethan uses a linear parameterization which results in r2 = 0.797 and y = 918.42+-0.93061x
	//note: Igor outputs: fit_Wavename = W_coef[0]+W_coef[1]*x which is their y = b+xm (y=mx+b) !!!IGOR's SLOPE is their b and thier inteprcept is their a!!!


	//With all of this said I think that the response is non-linear and a polynomial relationship of the 5th order is a better fit that minimizes
	//the risk of overfitting the data.
	
	
	//TODO: Make the linear fit function between two points that we know i.e. for given diam of 81 nm then just fit linear between 71 and 91 nm that we know
	
	
	
	//Below are options for both linear fitting and plolynomial fitting
	
	
	if(stringmatch(fittype,"Linear")==1)
		
		//Impliment the linear CurveFit
		CurveFit/Q line Gysel_dEff_Density /X=Gysel_dEff_Diameter /D 
		wave W_coef, W_sigma
		
		//Assign CurveFit outputs
		dEff = W_coef[0]+W_coef[1]*Dmob
		
		//Solve equation to get mass
		MassfromDmobandDeff = ((dEff*pi*(Dmob^3))/(6)) * 1E-9 //kg/m3 * nm3 with conversion factor of 1E-9 (1E18/1E27) = mass in fg
			
	elseif(stringmatch(fittype, "Poly")==1)
		CurveFit/Q poly 5, Gysel_dEff_Density /X=Gysel_dEff_Diameter /D
		wave W_coef, W_sigma
		//Poly fit wit 5 terms Igor has a built in function to handle this called Poly which requries W_Coef wave and your x value
		dEff = poly(W_Coef,DMob)
	
		//Solve equation to get mass
		MassfromDmobandDeff = ((dEff*pi*(Dmob^3))/(6)) * 1E-9 //kg/m3 * nm3 with conversion factor of 1E-9 (1E18/1E27) = mass in fg
	
	else
		//Set DF back to starting one and abort
		setdatafolder StartDF
		abort "Fit input not reconized."
	endif
	
	Print "For a mobility density of "+num2str(Dmob)+ " nm, rBC Mass based on Gysel et al. (2011) effective denisty is = " + num2str(MassfromDmobandDeff)+" fg"// +" and MED = " + num2str(MED)

	//Return to data folder
	setdatafolder StartDF
	return MassfromDmobandDeff
End

Function rBCmobility2MassWave_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string Dmob_str
			string fittype
			prompt Dmob_str, "What is the mobility diameter wave name? (Note: Effective density provided from 71-824 nm)"
			//prompt fittype, "Input 'Linear' for a linear fit or 'Poly' a polynominal fit (5 terms)"
			doprompt "Please enter the following:", Dmob_str//, fittype
			if(V_Flag==1)
				abort "User Abort"
			endif
			wave dMob_Wave = $dmob_Str
			rBCmobility2Mass_Wave(dMob_Wave)
		case 2:
			break
		endswitch
		
End

Function rBCmobility2Mass_Wave(dMob_Wave)
	
	//Establish Function Parameters
	wave dMob_Wave
	
	//Establish local parameters
	variable npnts = dimsize(dMob_Wave,0)
	variable i, DMob_linear, Dmob_poly, Dmob
	
	Make/o/d/n=(npnts) rBCMassfromDmob_Linear = NaN
	Make/o/d/n=(npnts) rBCMassfromDmob_Poly = NaN
	
	for(i=0;i<npnts;i++)
		Dmob =  dMob_Wave[i]
		DMob_linear = rBCmobility2Mass(Dmob,"linear")
		Dmob_poly = rBCmobility2Mass(Dmob,"poly")
		rBCMassfromDmob_Linear[i] = DMob_linear
		rBCMassfromDmob_Poly[i] = Dmob_poly
	endfor


end

Function AJD_Extract_LEO_Waves(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string LEO_DF_Str = ""
//			Variable Time_Extract
			prompt LEO_DF_Str, "Please enter the full path to the LEO folder"
//			prompt Time_Extract, "Please enter the amount of seconds that the data should be averaged too."
			doprompt "Please Enter the following infomation.", LEO_DF_Str//, Time_Extract
			if(v_Flag==0)
			elseif(V_flag==1)
			Abort "Data Folder not provided"
			endif
			Extract_LEO_Waves(LEO_DF_Str)
		case 2:
			break
		endswitch
end


//Function to extract all nessesary LEO waves (and waves that support LEO functions)

Function Extract_LEO_Waves(LEO_DF_Str)
	String LEO_DF_str
	Variable Time_Extract
	String LEO_Trace_Str = LEO_DF_Str + "TraceFit:"
	String LEO_Main_Str = LEO_DF_Str + "Main:"
	
	setdatafolder LEO_DF_str
	DFREF LEO_DF = getdatafolderDFR()
	Setdatafolder LEO_Trace_Str
	DFREF LEO_Trace = getdatafolderDFR()
	setdatafolder LEO_Main_Str 
	DFREF LEO_Main = getdatafolderDFR()
	
	setdatafolder Root:
//	
	//Establish names of PBP and Raw DFs (including INI)
	string savedDF = ""
	string Base_DF_String = AJD_SP2_getFolder(startingDF=savedDF, type="raw", includeAll=1)
	setdatafolder Base_DF_String
	DFREF Base_DF = GetdatafolderDFR()
	
	//Get INI root:'20240130x002_SP2':INI:
	string INI_String = Base_DF_String + "INI"
	setdatafolder INI_String
	DFREF INI_DF = GetdatafolderDFR()
	
	string PBP_DF_String = AJD_SP2_getFolder(startingDF=savedDF, type="PBP", includeAll=1)
	setdatafolder PBP_DF_String
	DFREF PBP_DF = GetdatafolderDFR()
	
	string SDTser = AJD_SP2_getFolder(StartingDF=SavedDF,type="SDTser", includeAll=1)
	setdatafolder SDTser
	DFREF SDTser_DF = getdatafolderDFR()
	
	string ConcTser = AJD_SP2_getFolder(StartingDF=SavedDF,type="ConcTser", includeAll=1)
	setdatafolder ConcTser
	DFREF ConcTser_DF = getdatafolderDFR()
	
	//Establish AJD_DF
	setdatafolder root:
	If(dataFolderExists("AJD_DF")==1)	//it does exist
		setdatafolder AJD_DF
		DFREF Main_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_DF")==0)	//it does not exist
		newdataFolder/S AJD_DF
		DFREF Main_DF = getdatafolderDFR()
	endif
	
	//Establish Output Folder
	setdatafolder Main_DF
	If(dataFolderExists("Output")==1)	//it does exist
		setdatafolder Output
		DFREF Output_DF = getdatafolderDFR()
	elseif(datafolderexists("Output")==0)	//it does not exist
		newdatafolder/S Output
		DFREF Output_DF = getdatafolderDFR()
	endif
	
	//Establish PBP, ConcTser, LEO, and SizeDistTser Folders
	setdatafolder Output_DF
	If(dataFolderExists("AJD_PBP")==1)	//it does exist
		setdatafolder AJD_PBP
		DFREF AJD_PBP_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_PBP")==0)	//it does not exist
		newdatafolder/S AJD_PBP
		DFREF AJD_PBP_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
	If(dataFolderExists("AJD_LEO")==1)	//it does exist
		setdatafolder AJD_LEO
		DFREF AJD_LEO_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_LEO")==0)	//it does not exist
		newdatafolder/S AJD_LEO
		DFREF AJD_LEO_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
		If(dataFolderExists("AJD_SizeDistTser")==1)	//it does exist
		setdatafolder AJD_SizeDistTser
		DFREF AJD_SizeDistTser_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_SizeDistTser")==0)	//it does not exist
		newdatafolder/S AJD_SizeDistTser
		DFREF AJD_SizeDistTser_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
		If(dataFolderExists("AJD_Raw")==1)	//it does exist
		setdatafolder AJD_Raw
		DFREF AJD_Raw_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_Raw")==0)	//it does not exist
		newdatafolder/S AJD_Raw
		DFREF AJD_Raw_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
		If(dataFolderExists("AJD_ConcTser")==1)	//it does exist
		setdatafolder AJD_ConcTser
		DFREF AJD_ConcTser_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_ConcTser")==0)	//it does not exist
		newdatafolder/S AJD_ConcTser
		DFREF AJD_ConcTser_DF = getdatafolderDFR()
	endif
	
	//extract waves from PBP Folder
	//AJD: 10/21/2024->Extract More waves
	string extract_waves = ""
	setdatafolder PBP_DF
	//Get a waves list 
	extract_waves = WaveList("*Diam*",";","TEXT:0")	//Extract all information related to diameter, number and mass distributions, including log_normal fits
	extract_waves += WaveList("*Distr*", ";", "TEXT:0")
	extract_waves += WaveList("*Mass*", ";", "TEXT:0")
	extract_waves += WaveList("*Numb*", ";", "TEXT:0")
	extract_waves += WaveList("*saturated*", ";", "TEXT:0")
	variable nwaves = itemsinList(extract_waves)
	variable i 
	for(i=0;i<nwaves;i++)
		wave tempwave = $stringfromlist(i,extract_waves)
		string newname_prefix = "AJD_"
		string newname = newname_prefix+ nameofwave(tempwave)
		duplicate/O tempwave, AJD_PBP_DF:$newname
	Endfor

	//Clear the wave string
	extract_waves = "" 
	
	
	//extract waves from raw folder
	setdatafolder Base_DF
	extract_waves = WaveList("*Time*",";","TEXT:0") //Extract information on Timedate, sample volume and YAG power
	extract_waves +=  WaveList("*Sample*",";","TEXT:0")
	extract_waves +=  WaveList("*SampleInterval*",";","TEXT:0")
	nwaves = itemsinList(extract_waves)
	for(i=0;i<nwaves;i++)
		wave tempwave = $stringfromlist(i,extract_waves)
		newname_prefix = "AJD_"
		newname = newname_prefix+ nameofwave(tempwave)
		duplicate/O tempwave, AJD_Raw_DF:$newname
	Endfor
	
	//Clear the wave string
	extract_waves = "" 
	
	
	//extract waves from raw folder (INI subfolder)
	setdatafolder INI_DF
	extract_waves = WaveList("*OneofEvery*",";","TEXT:0") //Extract information on Oneof and Scan Length
	extract_waves += WaveList("*ScanLength*",";","TEXT:0")
	nwaves = itemsinList(extract_waves)
	for(i=0;i<nwaves;i++)
		wave tempwave = $stringfromlist(i,extract_waves)
		newname_prefix = "AJD_"
		newname = newname_prefix+ nameofwave(tempwave)
		duplicate/O tempwave, AJD_Raw_DF:$newname
	Endfor
	
	//Clear the wave string
	extract_waves = ""
	
	//extract waves from LEO folder (Part 1)
	setdatafolder LEO_Trace
	extract_waves = WaveList("*OptDiamAll*",";","TEXT:0") //Extract information on Optdiam, fits,saturated, classification
	extract_waves +=  WaveList("*Classification*",";","TEXT:0")
	extract_waves +=  WaveList("*Saturated*",";","TEXT:0")
	extract_waves +=  WaveList("*Fit",";","TEXT:0")
	nwaves = itemsinList(extract_waves)
	for(i=0;i<nwaves;i++)
		wave tempwave = $stringfromlist(i,extract_waves)
		newname_prefix = "AJD_"
		newname = newname_prefix+ nameofwave(tempwave)
		duplicate/O tempwave, AJD_LEO_DF:$newname
	Endfor
	
	//Clear the wave string
	extract_waves = ""
	
	//extract waves from LEO folder (Part2)
	setdatafolder LEO_Main
	extract_waves = WaveList("*BCcoatingThickness*",";","TEXT:0") //Extract information on CTthickness and Volumefraction
	extract_waves +=  WaveList("*BCcoatingThicknHist*",";","TEXT:0")
	extract_waves +=  WaveList("*BCvolumeFraction*",";","TEXT:0")
	extract_waves +=  WaveList("*DelayTimeHist*",";","TEXT:0")
	nwaves = itemsinList(extract_waves)
	for(i=0;i<nwaves;i++)
		wave tempwave = $stringfromlist(i,extract_waves)
		newname_prefix = "AJD_"
		newname = newname_prefix+ nameofwave(tempwave)
		duplicate/O tempwave, AJD_LEO_DF:$newname
	Endfor
	
	//Clear the wave string
	extract_waves = ""
	
	//extract waves from Size Distribution Tseries 
	setdatafolder SDTser_DF
	extract_waves = WaveList("*",";","TEXT:0") //Extract information on everything as I am unsure what I need rn
	nwaves = itemsinList(extract_waves)
	for(i=0;i<nwaves;i++)
		wave tempwave = $stringfromlist(i,extract_waves)
		newname_prefix = "AJD_"
		newname = newname_prefix+ nameofwave(tempwave)
		duplicate/O tempwave, AJD_SizeDistTser_DF:$newname
	Endfor
	
	
	
	//Clear the wave string
	extract_waves = ""
	
	//extract waves from Concentration Time Series
	setdatafolder ConcTser_DF
	extract_waves = WaveList("*",";","TEXT:0") //Extract information on everything
	nwaves = itemsinList(extract_waves)
	for(i=0;i<nwaves;i++)
		wave tempwave = $stringfromlist(i,extract_waves)
		newname_prefix = "AJD_"
		newname = newname_prefix+ nameofwave(tempwave)
		duplicate/O tempwave, AJD_ConcTser_DF:$newname
	Endfor
	
	
	//Deal with code glitch that overshoots conc when saving by a number of particles. 
	//Idea: Saved 1/n particles results in concentrations that are overinflated by n. 
	//Solution: Determine the 'n' value used and apply that to the portions of data
	//To get there we need the TimeWave from the mass concentration (AJD_TimeCtr) so we can take the total 
	//number of points and divide it by the time segments (number of rows in AJD_OneofEverySaved).
	Setdatafolder Main_DF //Go to 'AJD_DF' to create a 'code fixing' folder
	If(dataFolderExists("AJD_CodeFixing")==1)	//it does exist
		setdatafolder AJD_CodeFixing
		DFREF AJD_CodeFixing_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_CodeFixing")==0)	//it does not exist
		newdatafolder/S AJD_CodeFixing
		DFREF AJD_CodeFixing_DF = getdatafolderDFR()
	endif
	
	//Now get waves nessesary	//NOTE: Might need to extend this to the SizeDistTser folder too
	//Raw DF first
	Setdatafolder AJD_Raw_DF
	extract_waves = "" //Use extract waves because it already exists
	extract_waves = WaveList("AJD_One*",";","TEXT:0") //Extract information on OneofEvery...
	nwaves = itemsinList(extract_waves)
	for(i=0;i<nwaves;i++)
		wave tempwave = $stringfromlist(i,extract_waves)
		newname_prefix = "CodeFix_"
		newname = newname_prefix+ nameofwave(tempwave)
		duplicate/O tempwave, AJD_CodeFixing_DF:$newname
	Endfor
	
	//Now the ConcTser
	setdatafolder AJD_ConcTser_DF
	extract_waves = "" //Use extract waves because it already exists
	extract_waves = WaveList("*MassConc*",";","TEXT:0") //Extract information Massconc and timectr
	extract_waves += WaveList("*TimeCtr*",";","TEXT:0")
	nwaves = itemsinList(extract_waves)
	for(i=0;i<nwaves;i++)
		wave tempwave = $stringfromlist(i,extract_waves)
		newname_prefix = "CodeFix_"
		newname = newname_prefix+ nameofwave(tempwave)
		duplicate/O tempwave, AJD_CodeFixing_DF:$newname
	Endfor
	
	//Now that we have our waves go to the codefixing Datafolder
	setdatafolder AJD_CodeFixing_DF
	wave CodeFix_AJD_BBHG_MassConc, CodeFix_AJD_BBLG_MassConc, CodeFix_AJD_BHBL_MassConc, CodeFix_AJD_NBHG_MassConc, CodeFix_AJD_NBLG_MassConc, CodeFix_AJD_OneOfEverySaved, CodeFix_AJD_OneOfEveryLoaded, CodeFix_AJD_TimeCtr
	variable npnts_dt = dimsize(CodeFix_AJD_timeCtr,0)
	variable npnts_saved = dimsize(CodeFix_AJD_OneofEverySaved,0)
	variable timechunks = round(npnts_dt/npnts_saved)
	
	if(npnts_dt<npnts_saved)
		abort "TimeCtr has less points that OneOfEverySaved. Will not proceed with CodeFixing."
	endif
	
	//TimeChunks represents the distribution of the time series compiled into the chunks that should be affected by the SaveOnOfEvery
	String Change_Conc = "" 
	Change_Conc = Wavelist("*Conc*", ";", "TEXT:0")
	nwaves = itemsinlist(Change_Conc)
	variable pstart = 0 
	variable pend = 0 
	variable adjustment, j, endpnt
	if(npnts_dt>npnts_saved)
		endpnt = npnts_saved
	endif
	//For loop thought process: for every row in 'OneOfEverySaved' take the adjustment and divide the concentration waves by this number (within the range of the affected data). 
	For(i=0;i<npnts_saved;i++)
		pstart = i*timechunks
		pend = pstart+timechunks-1
		if(pend>npnts_dt)
			break
		endif
		if(i==npnts_saved-1)
			pend = npnts_dt-1
		endif
		adjustment = CodeFix_AJD_OneOfEverySaved[i] 
		for(j=0;j<nwaves;j++)
			if(pend==npnts_dt)
				abort "Ending point will be out of MassConc range, aborting."
			endif
			wave tempwave = $stringfromlist(j,Change_Conc)
			tempwave[pstart,pend] /= adjustment
		Endfor
	Endfor
	print "Save one of every n particles accounted for as best as can, ensure sucsessful reduction in mass concentration via manual checking."
	setdatafolder root:
End

Function AJD_Time_Avg_Extracted_Waves(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			
			Variable Time_Extract
			
			prompt Time_Extract, "Please enter the amount of seconds that the data should be averaged too."
			doprompt "Please Enter the following infomation.", Time_Extract
			Time_Averging_Extracted_Waves(Time_Extract)
		case 2:
			break
		endswitch
end

Function Time_Averging_Extracted_Waves(Time_Extract)

	variable Time_Extract
	
	
	//Establish AJD_DF
	setdatafolder root:
	If(dataFolderExists("AJD_DF")==1)	//it does exist
		setdatafolder AJD_DF
		DFREF Main_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_DF")==0)	//it does not exist
		newdataFolder/S AJD_DF
		DFREF Main_DF = getdatafolderDFR()
	endif
		setdatafolder Main_DF
	If(dataFolderExists("Output")==1)	//it does exist
		setdatafolder Output
		DFREF Output_DF = getdatafolderDFR()
	elseif(datafolderexists("Output")==0)	//it does not exist
		newdataFolder Output
		DFREF Output_DF = getdatafolderDFR()
	endif
	setdatafolder Main_DF

	setdatafolder Output_DF
	If(dataFolderExists("AJD_PBP")==1)	//it does exist
		setdatafolder AJD_PBP
		DFREF AJD_PBP_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_PBP")==0)	//it does not exist
		newdatafolder/S AJD_PBP
		DFREF AJD_PBP_DF = getdatafolderDFR()
	endif
	
	
	//Establish All DF in Output_DF and the CodeFixing DF
	setdatafolder Output_DF
	If(dataFolderExists("AJD_LEO")==1)	//it does exist
		setdatafolder AJD_LEO
		DFREF AJD_LEO_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_LEO")==0)	//it does not exist
		newdatafolder/S AJD_LEO
		DFREF AJD_LEO_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
		If(dataFolderExists("AJD_SizeDistTser")==1)	//it does exist
		setdatafolder AJD_SizeDistTser
		DFREF AJD_SizeDistTser_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_SizeDistTser")==0)	//it does not exist
		newdatafolder/S AJD_SizeDistTser
		DFREF AJD_SizeDistTser_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
		If(dataFolderExists("AJD_Raw")==1)	//it does exist
		setdatafolder AJD_Raw
		DFREF AJD_Raw_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_Raw")==0)	//it does not exist
		newdatafolder/S AJD_Raw
		DFREF AJD_Raw_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
		If(dataFolderExists("AJD_ConcTser")==1)	//it does exist
		setdatafolder AJD_ConcTser
		DFREF AJD_ConcTser_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_ConcTser")==0)	//it does not exist
		newdatafolder/S AJD_ConcTser
		DFREF AJD_ConcTser_DF = getdatafolderDFR()
	endif

	Setdatafolder Main_DF 
	If(dataFolderExists("AJD_CodeFixing")==1)	//it does exist
		setdatafolder AJD_CodeFixing
		DFREF AJD_CodeFixing_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_CodeFixing")==0)	//it does not exist
		newdatafolder/S AJD_CodeFixing
		DFREF AJD_CodeFixing_DF = getdatafolderDFR()
	endif


	//Thought process: we have a lot of DataFolders with a lot of Data to sort through, do a massive loop of all of the time series averaging for every wave in all the datafolders
	//Get the variables needed to do this
	variable nDF = countObjectsDFR(Output_DF,4)
	variable nwaves,i,j,k,npnts,timeframe //Establish here and use later.
	string DF_WaveList, DF_name
	
	
	//Big for loop starts here
	for(i=0;i<nDF;i++) //For all of the datafolders in output
		//First establish all of the nessesary waves in the folder
		string DF_list = GetindexedObjNameDFR(Output_DF,4,i)
		string DF = getindexedObjName(DF_List,4,i)
		nwaves = countObjects(DF,1)
		DF_WaveList = AJD_EstablishNonTextWaveListinDF(DF, DF_WaveList)
		

		//DUE TO CODE CHANGES CURRENTLY WE ARE EXPORTING THE WAVES THAT HAVE BEEN TIME AVERAGED BY THE PSI SP2 TOOLKIT SO THIS IS 
		//NOT NESSESARY RIGHT NOW

		
//
//		//Perform Time_Extraction_Averaging to reduce the length of waves -> must do this until memory issue is resolved
//		j=1
//		k=0
//		npnts = dimsize(TimeDate_AJD,0)
//		variable t_start, t_end
//		t_start = TimeDate_AJD[0] //First index of the TimeDate wave should be the first starting point
//		t_end = t_start+Time_Extract	//established first timeframe
//	
//		variable forstart, forend
//		forstart = Timedate_AJD[0]
//	forend = Timedate_AJD[inf]
//	
//		variable p_start, p_end //point's for times
//		p_start = 0 //we are starting at x = 0 here
//	
//		make/o/d/n=1 Avg_BBLG_BCdiam
//		make/o/d/n=1 Avg_SCLG_BCcoatingThickness
//		make/o/d/n=1 Avg_SCLG_BCvolumeFraction
//		make/o/d/n=1 Avg_OptDiamAll
//		make/o/d/n=1 Avg_TimeDate__Midpoint
//		make/o/d/n=1 Avg_SampleVolume
//	
//		For(forstart = Timedate_AJD[0];forstart<=forend;forstart=t_end)	//All about overall time frame
//			//Establish current timeframe
//			if(timeframe == 0)	//If we are in the first timeframe of intrest
//				t_start = TimeDate_AJD[0]
//				
//				t_end = t_start+Time_Extract	//established first timeframe
//			else
//			endif
//				//Find points for point start and point end
//				//Because we are missing points in the first timeframe we have to do something a little different
//				if(timeframe==0)
//					p_start=0 
//					p_end = binarysearch(TimeDate_AJD, t_end)
//				else
//					p_start = binarysearch(TimeDate_AJD, t_start)
//					p_end = binarysearch(TimeDate_AJD, t_end)
//				endif
//				//Get stats from range of points to apply to waves
//			
//				//Average BBLG_BC_Diameter
//				redimension/N=(j) Avg_BBLG_BCDiam
//				WaveStats/Q/R=[p_start,p_end] BBLG_BCdiam_AJD
//				Avg_BBLG_BCDiam[k] = V_Avg
//				//Average Optical Paritcle Diameter from LEO-fits
//				redimension/N=(j) Avg_OptDiamAll
//				WaveStats/Q/R=[p_start,p_end] SCLG_OptDiamAll_AJD
//				Avg_OptDiamAll[k] = V_Avg
//				//Average BCvolumeFraction 
//				redimension/N=(j) Avg_SCLG_BCvolumeFraction
//				WaveStats/Q/R=[p_start,p_end] SCLG_BCvolumeFraction_AJD
//				Avg_SCLG_BCvolumeFraction[k] = V_Avg
//				//Average BC_coatingThickness
//				redimension/N=(j) Avg_SCLG_BCcoatingThickness
//				WaveStats/Q/R=[p_start,p_end] SCLG_BCcoatingThickness_AJD
//				Avg_SCLG_BCcoatingThickness[k] = V_Avg
//				//'Average' Datetime	
//				redimension/N=(j) Avg_TimeDate__Midpoint
//				Avg_TimeDate__Midpoint[k] = (TimeDate_AJD[p_start] + TimeDate_AJD[p_end])/2
//				//'Average' SampleVolume
//				redimension/N=(j) Avg_SampleVolume
//				Avg_SampleVolume[k] = (SampleVolume_AJD[p_start] + SampleVolume_AJD[p_end])/2
//				
//				setscale d 0, 0, "dat" Avg_TimeDate__Midpoint 
//				
//				
//				//Update start and end times as well as the timeframe we are in
//				t_start = t_end
//				t_end = t_start+Time_Extract
//				timeframe++	
//				j++
//				k++
//	Endfor
//	
//	
//	//Create mass conc
//	Duplicate/O Avg_SampleVolume, Avg_MassConc_BC
//	Avg_MassConc_BC = (((pi/6)*((Avg_BBLG_BCdiam*1E-9)^3)*1800)*1E9)/Avg_SampleVolume		//ug/m3
//	
//	
//	
//	setdatafolder root:
//	
	//End Massive ForLoop
	Endfor

End


Function AJD_rBCcontParticle_DenistyButt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Are you in the Folder containing the Optical Diameter and rBC core waves?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			String OptDiam_Str = "", rBCCore_Str = ""
			prompt OptDiam_Str, "Please enter the name of the Optical Diameter Wave."
			prompt rBCCore_Str, "Please enter the name of either the rBC core Wave."
			doprompt "Please Enter the following infomation.", OptDiam_Str, rBCCore_Str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave OptDiam = $OptDiam_Str
			wave rBCCore = $rBCCore_Str
			rBCContParticleDensity(OptDiam, rBCCore)
		case 2:
			break
		endswitch
end

//This function will determine the % of the rBC-Containing Particle that is occupied by the Core and the Coating, and then assign a weighted density to the particle. 

Function rBCContParticleDensity(OptDiam, rBCCore)

//	Establish Function Parameters
	wave OptDiam, rBCCore
	
//	Establish local Parameters
	variable i, Weighted_OptDiam, Weighted_Core, npnts, DAssumed_Coating, DAssumed_Core
	npnts = dimsize(OptDiam,0)
	DAssumed_Coating = 1.5 //g/cm3
	DAssumed_Core = 1.8 //g/cm3
	string newwavename = "rBCCT_DEff"
	duplicate OptDiam, $newwavename
	wave tempwave = $newwavename
	tempwave = NaN
	
	
//	Establish Loop
	for(i=0;i<npnts;i++)
		Weighted_Core = (rBCCore[i])/(rBCCore[i]+OptDiam[i])
		Weighted_OptDiam = (OptDiam[i])/(rBCCore[i]+OptDiam[i])
		tempwave[i] = (Weighted_Core*DAssumed_Core) + (Weighted_OptDiam*DAssumed_Coating)/(Weighted_Core+Weighted_OptDiam)
	endfor	
	
	
end


//AJD acess waves on 2 different time scales and create a CT wave where other signal wave (PMF % contribution) is above 35% and below 35% ( or another percent)
Function PBP_CT_Chop_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Are the Folder containing the Coating signal and DT wave as well as the other signal and DT wave?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			String CT_Str = "", Signal_Str = "", SignalDT_str = "", CTDT_Str = ""
			variable cutoff
			prompt CT_Str, "Please enter the name of the PBP CT Wave."
			prompt Signal_Str, "Please enter the name of either the % contribution or mass concnetration signal wave."
			prompt SignalDT_str, "Please enter the name of time wave that corresponds with the signal wave."
			prompt CTDT_Str, "Please enter the name of the time wave that correspodns with the CT wave."
			prompt cutoff, "What is the signal cuttoff variable"
			doprompt "Please Enter the following infomation.", CT_Str,CTDT_Str, Signal_Str,SignalDT_Str, cutoff
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave CT = $CT_Str
			wave Signal = $Signal_Str
			wave CTDT = $CTDT_Str
			wave SignalDT = $SignalDT_Str
			PBP_CT_Chop(CT, Signal,CTDT,SignalDT, cutoff)
		case 2:
			break
		endswitch
end


Function PBP_CT_Chop(CT, Signal,CTDT,SignalDT, cutoff)

	//Establish Function parameters
	Wave CT, Signal, SignalDT, CTDT
	Variable Cutoff
	
	//Establish Local Parameters
	Variable DTCT_Start, DTCT_End,i,npnts, k, PBPDT_Start, PBPDT_End, SigVal, npntsPBP
	npnts = dimsize(SignalDT,0)
	npntsPBP = dimsize(CT,0)
	
	//Duplicate waves
	string abovewavename = "PBPCT_"+nameofwave(Signal)+"_aboveorequalthreshold_"+num2str(cutoff)
	string belowwavename = "PBPCT_"+nameofwave(Signal)+"_beloworequalthreshold_"+num2str(cutoff)
	duplicate/O CT, $abovewavename
	duplicate/O CT, $belowwavename
	wave AboveWave = $abovewavename
	wave BelowWave = $belowwavename
	AboveWave=NaN;BelowWave=NaN
	//Begin Time loop
	
	//Find the time values of our signal time wave at point 0 and point 1
	for(i=0;(i<npnts-1);i++)
		//Establish Timeframe for signal wave (slower time frame)
		DTCT_Start = SignalDT[i]
		DTCT_End = SignalDT[i+1]
		SigVal = signal[i]
		//Find point range from singal DT wave in PBP DT
		PBPDT_Start = binarySearch(CTDT,DTCT_Start)
		PBPDT_End = binarySearch(CTDT,DTCT_End)
		//Binarysearch checks
		if(PBPDT_Start == -1) //If our PBPDT_Start falls before the first point of the SignalDT set it equal to the first point in our PBPDT wave
			PBPDT_Start = 0
		elseif(PBPDT_End == -2) //If our PBPDT_End falls after the last point of the SignalDT set it equal to the lastpoint in our PBPDT wave
			PBPDT_End = (dimsize(CT,0))-1
		endif
		//Start PBP time wave loop starts with k = PBPDT_Start
		k = PBPDT_Start //Ensure k starts
		For(k=k;k<PBPDT_End;k++)	//Fix
			if(SigVal>=Cutoff)	//If for the slower time frame we have a value above our cutoff
				AboveWave[k] = CT[k]
				BelowWave[k] = NaN
			elseif(SigVal<Cutoff)	//If for the slower time frame we have a value below our cutoff
				AboveWave[k] = NaN
				BelowWave[k] = CT[k]
			endif
		endfor
	
	endfor
	
	//NaN generated waves to cut down on space
	Wavetransform ZapNaNs AboveWave
	Wavetransform ZapNaNs BelowWave
	
	//Quick calc
	variable nAbove, nBelow, perAbove, perBelow
	nAbove = dimsize(abovewave,0)
	nBelow = dimsize(BelowWave,0)
	duplicate/o/FREE CT, CTZapnan
	wavetransform zapnans CTZapnan
	variable zappedTotal = dimsize(CTZapnan,0)
	perAbove = (nAbove/zappedTotal)*100
	perBelow = (nBelow/zappedTotal)*100

	print "For the wave "+nameofwave(Signal)+ " coatings throuhgout the inputted data are above the threshold of "+num2str(cutoff)+" "+ num2str(perAbove)+"% of the time and below the threshold "+num2str(perBelow)+"% of the time."


End


//AJD acess waves on 2 different time scales and create a CT wave where other signal wave (PMF % contribution) is above 35% and below 35% ( or another percent)
//But in this case with a list
Function PBP_CT_ChopList_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Are the Folder containing the Coating signal and DT wave as well as the other signal and DT wave?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			String CT_Str = "", SignalList = "", SignalDT_str = "", CTDT_Str = ""
			variable cutoff
			prompt CT_Str, "Please enter the name of the PBP CT Wave."
			prompt SignalList, "Please enter the identifying string of either the % contribution or mass concnetration signal waves."
			prompt SignalDT_str, "Please enter the name of time wave that corresponds with the signal wave."
			prompt CTDT_Str, "Please enter the name of the time wave that correspodns with the CT wave."
			prompt cutoff, "What is the signal cuttoff variable"
			doprompt "Please Enter the following infomation.", CT_Str,CTDT_Str, SignalList,SignalDT_Str, cutoff
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave CT = $CT_Str
			wave CTDT = $CTDT_Str
			wave SignalDT = $SignalDT_Str
			PBP_CT_ChopList(CT, SignalList,CTDT,SignalDT, cutoff)
		case 2:
			break
		endswitch
end

function PBP_CT_ChopList(CT, SignalList,CTDT,SignalDT, cutoff)

	//Establish function parameters
	wave CT, CTDT, SignalDT
	string SignalList
	Variable Cutoff
	
	//Establish Local Parameters
	variable i
	
	//Find waves
	String wlisthelper = "*"
	string MString = wlisthelper+SignalList+wlisthelper
	string WList = wavelist(MString, ";","TEXT:0")
	variable nwaves = itemsInList(Wlist,";")
	
	//Loop through code and determine how much time it takes
	StopAllTimers()
	variable Timer = startMSTimer
	
	for(i=0;i<nwaves;i++)
		wave signal = $stringfromlist(i,WList,";")
		PBP_CT_Chop(CT, Signal,CTDT,SignalDT, cutoff)
	endfor
	
	Timer = StopMSTimer(0)
	variable ElapsedTime = Timer/1E6/60
	doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
	


End


Function AJD_MLRStats(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Are the Folder containing the Coating and either rBC Core or Optical Diameter set as the current data folder?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			String W_Coef_Str = "", SizeWave_Str = "", W_Sigma_Str = "", W_ParamConfidenceInterval_Str = "", WoW_Str = ""
			prompt W_Coef_Str, "Please enter the name of the coefficent wave."
			prompt SizeWave_Str, "Please enter the name of the wave containing the size of all independent variables."
			prompt W_Sigma_Str, "Please enter the name of the  Sigma wave."
			prompt W_ParamConfidenceInterval_Str, "Please enter the name of the ParamConfidenceInterval wave."
			prompt WoW_Str, "Please enter the wave of wave containing the dependent variable (y), and all of the independent variables (x)."
			doprompt "Please Enter the following infomation.", 
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave W_Coef = $W_Coef_Str
			wave W_Sigma = $W_Sigma_Str
			wave W_ParamConfidenceInterval = $W_ParamConfidenceInterval_Str
			wave SizeWave = $SizeWave_Str
			wave WoW = $WoW_Str
			MLRStats(W_Coef,W_Sigma,W_ParamConfidenceInterval, SizeWave, WoW)
		case 2:
			break
		endswitch
end

//AJD 10/7/25: This function will calcualte nessesary stats of a MLR analysis that is not intrinsic to the Igor analysis package like Excel and R have
//This was designed with 2 variables in mind; and assumes all waves are equal in size
Function MLRStats(W_Coef,W_Sigma,W_ParamConfidenceInterval, SizeWave,WoW)

	//Establish Function Parameters
	Wave W_Coef,W_Sigma,W_ParamConfidenceInterval, SizeWave
	wave/Wave WoW
	
	//Establish Local parameters
	variable npnts = SizeWave[0]
	variable i 
		
	//Frst generate the ANOVA table
	//Sum of Square for Regression, Residual (error), and total
	variable SSR, SSE, SST
	variable R2, R, MSR,MSE,MST,FStatistic,FX0,FX1,FX2,FX3,FX4,TStat_Intercept,TStat_X0,TStat_X1,TStat_X2,TStat_X3,TStat_X4
	variable Obs, idps
	prompt Obs, "How many observations?"
	prompt idps, "How many independent variables?"
	Doprompt "Enter the following.", Obs, idps
	variable dfSSR = idps //p (where p is the number of independent variables)
	variable dfSSE = Obs-idps-1 // n-p-1 (observations - indepvars-1
	variable dfSST = Obs //n-1
	make/o/d/free/n=(npnts) SSR_ypred
	make/o/d/free/n=(npnts) SSR_2Sum
	make/o/d/free/n=(npnts) wSSE
	WaveStats/Q WoW[0]
	variable yavg = v_Avg
	
	//Use MLR equation to generate predicted y output
	for(i=0;i<npnts;i++)
		wave depwave = WoW[0]
		wave indepwave0 = WoW[1]
		wave indepwave1 = WoW[2]
		wave indepwave2 = WoW[3]
		wave indepwave3 = WoW[4]
		wave indepwave4 = WoW[5]
		variable x0var = indepwave0[i]
		variable X1var = indepwave1[i]
		variable x2Var = indepwave2[i]
		variable x3var = indepwave3[i]
		variable x4var = indepwave4[i]
		SSR_ypred[i] = indepwave0[i]*W_Coef[0] + W_Coef[1]*indepwave1[i] * W_Coef[2]*indepwave2[i] * W_Coef[3]*indepwave3[i] * W_Coef[4]*indepwave4[i] + w_Coef[5]
		SSR_2Sum[i] = (SSR_ypred[i] - yavg)^2
	endfor
	SSR = SUM(SSR_2Sum)
	wSSE = (depwave-SSR_ypred)^2
	SSE = SUM(wSSE)
	SST = SSR + SSE
	R2 = SSR/SST
	R = Sqrt(R2)
	MSR =SSR/dfSSR
	MSE = SSE/dfSSE
	MST = SST/dfSST
	FStatistic = MSR/MSE
	FX0 = W_Sigma[0]/MSE
	FX1 = W_Sigma[1]/MSE
	FX2 = W_Sigma[2]/MSE
	FX3 = W_Sigma[3]/MSE
	FX4 = W_Sigma[4]/MSE
	TStat_Intercept = W_Coef[2]/W_Sigma[2]
	TStat_X0 = w_Coef[0]/w_Sigma[0]
	TStat_X1 = w_Coef[1]/w_Sigma[1]
	TStat_X2 = w_Coef[2]/w_Sigma[2]
	TStat_X3 = w_Coef[3]/w_Sigma[3]
	TStat_X4 = w_Coef[4]/w_Sigma[4]
	//https://www.statology.org/t-score-p-value-calculator/ -> hard to incorperate a p-value formula rn; user should go to a calc or stat table (t-table)
//	Make/o/d/n=(idps) IndependentVars_FScore, IndependentVars_TStat
//	IndependentVars_FScore[0] = FX0
//	IndependentVars_FScore[1] = FX1
//	IndependentVars_FScore[2] = FX2
//	IndependentVars_FScore[3] = FX3
//	IndependentVars_FScore[4] = FX4
//	
	Make/o/d/n=(idps) IndependentVars_TStat
	IndependentVars_TStat[0] = TStat_X0
	IndependentVars_TStat[1] = TStat_X1
	IndependentVars_TStat[2] = TStat_X2
	IndependentVars_TStat[3] = TStat_X3
	IndependentVars_TStat[4] = TStat_X4

End

Function AJD_FilterCTs(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Are the Folder containing the Coating and either rBC Core or Optical Diameter set as the current data folder?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			Variable Time_Extract, savevar
			String CT_Str = "", Signal_Str = ""
			variable range_low, range_high
			String Filter_Type = "" 
			prompt CT_Str, "Please enter the name of the Coatings Wave."
			prompt Signal_Str, "Please enter the name of either the rBC core or Optical Diameter Wave."
			prompt range_low, "What is the bottom range to include in the filter (applied to filter choice)?"
			prompt range_high, "What is the top range to include in the filter (applied to filter choice)?"
			prompt Filter_type, "Enter 'Core' or 'OptDiam' to filter by rBC core diameter or Optdiam diameter."
			doprompt "Please Enter the following infomation.", CT_Str, Signal_Str, range_low, range_high, Filter_Type
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave CT = $CT_Str
			wave Signal = $Signal_Str
			Filter_CTs(CT, Signal, range_low, range_high, Filter_Type)
		case 2:
			break
		endswitch
end

//2024_11_28: AJD filter coatings function, will filter out waves based on range inputted by user
Function Filter_CTs(CT, Signal, range_low, range_high, Filter_Type)
	//Estabish Parameters
	wave CT, Signal
	variable range_low, range_high
	string Filter_Type
	
	//Establish important variables
	variable npnts = dimsize(CT,0) //Assume Optdiam wave is the same number of points as CT
	variable i //Looping variables
	
	//Duplicate waves to new DF
	DFREF StartDF = getdatafolderDFR()
	string FilterCT_DF_name = "Filter_CT_Range_"+num2str(range_low)+"nm_"+num2str(range_high)+"nm"
	newdatafolder/S $FilterCT_DF_Name
	DFREF CTDF = getdatafolderDFR()
	
	//Duplicate important waves in old DF to new DF based on filter type
	//Filter Type is Core Diameter
	if(stringmatch(Filter_Type,"Core")==1)
		setdatafolder StartDF
		string DupCTname = "CT_Range_"+num2str(range_low)+"nm_"+num2str(range_high)+"nm"
		string DupCorename = "rBCCore_Range_"+num2str(range_low)+"nm_"+num2str(range_high)+"nm"
		duplicate CT, CTDF:$DupCTname
		duplicate Signal, CTDF:$DupCorename
		setdatafolder CTDF
		note/K $DupCTname, "Coating's with the filter of "+num2str(range_low)+"nm to "+num2str(range_high)+" nm applied to the corresponding rBC Core wave."
		note/K $DupCorename, "Coating's with the filter of "+num2str(range_low)+"nm to "+num2str(range_high)+" nm applied."
		//set up for loop to cycle through wave
		wave tempwave_CT = $DupCTname
		wave tempwave_Core = $DupCorename
		for(i=0;i<npnts;i++)
			if(tempwave_Core[i] > range_high)	//if higher than our highest point
				tempwave_CT[i] = NaN
				tempwave_Core[i] = NaN
			elseif(tempwave_Core[i] < range_low) //if lower than our lowest point
				tempwave_CT[i] = NaN
				tempwave_Core[i] = NaN
			else //If not lower than low or higher than high then do nothing
			endif	
		endfor
	elseif(stringmatch(Filter_Type,"OptDiam")==1)
	setdatafolder StartDF
		DupCTname = "CT_Range_"+num2str(range_low)+"nm_"+num2str(range_high)+"nm"
		string DupOptDiamname = "OptDiam_Range_"+num2str(range_low)+"nm_"+num2str(range_high)+"nm"
		duplicate CT, CTDF:$DupCTname
		duplicate Signal, CTDF:$DupOptDiamname
		setdatafolder CTDF
		note/K $DupCTname, "Coating's with the filter of "+num2str(range_low)+"nm to "+num2str(range_high)+" nm applied to the corresponding Optical Diameter wave."
		note/K $DupOptDiamname, "Coating's with the filter of "+num2str(range_low)+"nm to "+num2str(range_high)+" nm applied."
		//set up for loop to cycle through wave
		wave tempwave_CT = $DupCTname
		wave tempwave_OptDiam = $DupOptDiamname
		for(i=0;i<npnts;i++)
			if(tempwave_OptDiam[i] > range_high)	//if higher than our highest point
				tempwave_CT[i] = NaN
				tempwave_OptDiam[i] = NaN
			elseif(tempwave_OptDiam[i] < range_low) //if lower than our lowest point
				tempwave_CT[i] = NaN
				tempwave_OptDiam[i] = NaN
			else //If not lower than low or higher than high then do nothing
			endif	
		endfor
	else
		Abort "Invalid input for filter type. Aborting."
	endif

end


Function AJD_TimeAvgWave(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Wave Organization" 2, "Is the signal wave and time wave in the same datafolder?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			Variable Time_Extract
			String SigWave_Str = "", TWave_Str = "" 
			prompt Time_Extract, "Please enter the amount of seconds that the data should be averaged too."
			prompt SigWave_Str, "Please Enter the name of the Signal Wave."
			prompt TWave_Str, "Please Enter the name of the Time Wave."
			doprompt "Please Enter the following infomation.", Time_Extract, SigWave_Str, TWave_Str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave SigWave = $SigWave_Str
			wave Twave = $TWave_Str
			TimeAvgWave(Time_Extract, SigWave,TWave)
		case 2:
			break
		endswitch
end

Function TimeAvgWave(Time_Extract, SigWave,TWave)

	//Enter Parameters
	variable Time_Extract
	Wave SigWave, TWave
	
	//Establish Variables 
	variable timeframe, i, j, k, npnts

//		//Perform Time_Extraction_Averaging to reduce the length of waves -> must do this until memory issue is resolved
		j=1
		k=0
		npnts = dimsize(TWave,0)
		variable t_start, t_end
		t_start = TWave[0] //First index of the TimeDate wave should be the first starting point
		t_end = t_start+Time_Extract	//established first timeframe
	
		variable forstart, forend
		forstart = TWave[0]
		forend = TWave[inf]
	
		variable p_start, p_end //point's for times
		p_start = 0 //we are starting at x = 0 here
		
		String DateStr = secs2Date(Twave[0],-2,"_")+"_"
	
		string Avg_SigWave_Str = DateStr+Nameofwave(SigWave)+"_Avg2_"+num2str(Time_Extract)+"s"
		make/o/d/n=1 $Avg_SigWave_Str
		wave AvgSigWave = $Avg_SigWave_Str
		
		string Avg_TWave_Str = DateStr+Nameofwave(TWave)+"_Avg2_"+num2str(Time_Extract)+"s"
		make/o/d/n=1 $Avg_Twave_Str
		wave AvgTWave = $Avg_Twave_Str
		
		string Median_SigWave_Str = DateStr+Nameofwave(SigWave)+"_Meidan2_"+num2str(Time_Extract)+"s"
		make/o/d/n=1 $Median_SigWave_Str
		wave MedianWave = $Median_SigWave_Str
		
		string SDev_SigWave_Str = DateStr+Nameofwave(SigWave)+"_StdDev2_"+num2str(Time_Extract)+"s"
		make/o/d/n=1 $SDev_SigWave_Str
		wave SDevWave = $SDev_SigWave_Str
		
		string LIQR_SigWave_Str = DateStr+Nameofwave(SigWave)+"_LIQR2_"+num2str(Time_Extract)+"s"
		make/o/d/n=1 $LIQR_SigWave_Str
		wave LIQRWave = $LIQR_SigWave_Str
		
		string UIQR_SigWave_Str = DateStr+Nameofwave(SigWave)+"_UIQR2_"+num2str(Time_Extract)+"s"
		make/o/d/n=1 $UIQR_SigWave_Str
		wave UIQRWave = $UIQR_SigWave_Str
		
		
		setscale d 0, 0, "dat" Twave 
	
		For(forstart = TWave[0];forstart<=forend;forstart=t_end)	//All about overall time frame
			//Establish current timeframe
			if(timeframe == 0)	//If we are in the first timeframe of intrest
				t_start = TWave[0]
				
				t_end = t_start+Time_Extract	//established first timeframe
			else
			endif
				//Find points for point start and point end
				//Because we are missing points in the first timeframe we have to do something a little different
				if(timeframe==0)
					p_start=0 
					p_end = binarysearch(TWave, t_end)
				else
					p_start = binarysearch(TWave, t_start)+1
//					string timecheckpstart = secs2Time(t_start,3)
					p_end = binarysearch(TWave, t_end)
//					string timecheckpend = secs2Time(t_end,3)
				endif
				
				//Test to see if there is a massive time skip
				variable tdiff = TWave[p_end] - TWave[p_start]
				variable loopEr
				if(tdiff == 0)
					loopEr+=1	//set this equal to more than 1 
				elseif(tdiff !=0)
					loopEr=0	//reset back to zero 
				endif
				//if tdiff == zero then we might have a change to repeat the loop more than we want, continue the loop in this case
				//Running into a problem where we have more than 1 of these tdiffs so we still get stuck in this loop. 
				if(tdiff == 0)
					if(LoopEr>=2) //If we have ran into a second loop; don't add on to the avg wave 
						t_start = t_end
						t_end = t_start+Time_Extract
						string checktstart = secs2Time(t_start,3)
						string checktend = secs2Time(t_end,3)
						timeframe++	
						continue
					elseif(LoopEr<2) //If this is our first loop
						redimension/N=(j) AvgSigWave, SDevWave, MedianWave, LIQRWave, UIQRWave
						WaveStats/Q/R=[p_start,p_end] SigWave
						AvgSigWave[k] = V_Avg
						SDevWave[k] = V_Sdev
						Duplicate/O/R=[p_start,p_end]/FREE SigWave, TempStatsWave4IQR
						StatsQuantiles/Z/iNaN/Q TempStatsWave4IQR
						MedianWave[k] = V_Median
						LIQRWave[k] = V_Q25
						UIQRWave[k] = V_Q75
						redimension/N=(j) AvgTWave
						AvgTWave[k] = (TWave[p_start] + TWave[p_end])/2
						t_start = t_end
						t_end = t_start+Time_Extract
						checktstart = secs2Time(t_start,3)
						checktend = secs2Time(t_end,3)
						timeframe++	
						j++
						k++
						continue
					endif						
				endif
				
				//Get stats from range of points to apply to waves
					if(tdiff < (3*Time_Extract))
						redimension/N=(j) AvgSigWave, SDevWave, MedianWave, LIQRWave, UIQRWave
						WaveStats/Q/R=[p_start,p_end] SigWave
						AvgSigWave[k] = V_Avg
						SDevWave[k] = V_Sdev
						Duplicate/O/R=[p_start,p_end]/FREE SigWave, TempStatsWave4IQR
						StatsQuantiles/Z/iNaN/Q TempStatsWave4IQR
						MedianWave[k] = V_Median
						LIQRWave[k] = V_Q25
						UIQRWave[k] = V_Q75
						redimension/N=(j) AvgTWave
						AvgTWave[k] = (TWave[p_start] + TWave[p_end])/2
					elseif(tdiff>(3*Time_Extract))// We have a massive jump
						redimension/N=(j) AvgSigWave, SDevWave, MedianWave, LIQRWave, UIQRWave
						WaveStats/Q/R=[p_start,p_end] SigWave
						AvgSigWave[k] = V_Avg
						SDevWave[k] = V_Sdev
						Duplicate/O/R=[p_start,p_end]/FREE SigWave, TempStatsWave4IQR
						StatsQuantiles/Z/iNaN/Q TempStatsWave4IQR
						MedianWave[k] = V_Median
						LIQRWave[k] = V_Q25
						UIQRWave[k] = V_Q75
						redimension/N=(j) AvgTwave
						AvgTwave[k] = TWave[p_end]
					endif
				
				
				//Update start and end times as well as the timeframe we are in
				t_start = t_end
				t_end = t_start+Time_Extract
				checktstart = secs2Time(t_start,3)
				checktend = secs2Time(t_end,3)
				timeframe++	
				j++
				k++
				V_Avg=NaN
				V_Sdev=NaN
				V_median=NaN
				V_Q25=NaN
				V_Q75=NaN
	Endfor

	setscale d 0, 0, "dat" AvgTwave 
	killwaves/Z W_StatsQuantiles
End

Function AJD_MakeBCCoreSD(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			string WaveMatch_Str = ""
			string BdrMatch_Str = "" 
			prompt WaveMatch_Str, "Please enter the identifying string for the 2D wave (i.e. BHBL_MassDistr, BBLG_NumbDistr)."
			prompt BdrMatch_Str, "Please enter the identifying string for the DiamBdr (i.e. BHBL_DiamBdr, BBLG_NumbDistr)."
			doprompt "Please Enter the following infomation.", WaveMatch_Str, BdrMatch_Str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			BCCoreSD(WaveMatch_Str, BdrMatch_Str)			
			
		case 2:
			break
		endswitch
end


Function BCCoreSD(WaveMatch_Str, BdrMatch_Str)

	//Establish Function Parameters
	string WaveMatch_Str, BdrMatch_Str
	
	//Find Waves
	string WaveMatch_help_Str = "*"+WaveMatch_Str+"*"
	string BdrMatch_help_Str = "*"+BdrMatch_Str+"*"
	
	string identifyWave = wavelist(WaveMatch_help_Str, ";", "TEXT:0")
	string identifyBdr = wavelist(BdrMatch_help_Str,";","TEXT:0")
	wave TwoDWave = $stringfromlist(0,identifyWave,";")
	wave BdrWave = $stringfromlist(0,identifyBdr,";")
	
	
	//Establish Variables and other things
	string AvgName = "Average_"+nameofwave(TwoDWave)
	string ErrorName = "Average_"+nameofwave(TwoDWave)+"_err"
	variable nrows = dimsize(TwoDWave,0)
	variable ncolumns = dimsize(TwoDWave,1)
	variable i, j
	string CtrWave = "DiamCtr_"+nameofwave(TwoDWave)
	Make/O/N=(ncolumns)/D $CtrWave
	wave Diam = $CtrWave
	
	//Make CtrWave
	for(i=0;i<ncolumns;i++)
		Diam[i] = (BdrWave[i]+BdrWave[i+1])/2
	endfor
	
	//Get rid of NaNs
	Duplicate/FREE TwoDWave, TwoDWave_noNaNs
	ZapNanRows(TwoDWave_noNaNs)

	//Create Average Matrix 
	MatrixOP/O $AvgName = AverageCols(TwoDWave_noNaNs)
	wave MatrixWave = $AvgName
	Duplicate/O $AvgName, $ErrorName
	wave errMatrix = $ErrorName
	errMatrix = 3*(0.05)^2 + (0.05^2)	//3*(kSP2_relErrDiam)^2 + kSP2_relErrDensity^2) Error Diam = 0.05 and Error Density = 0.05; need to figure out how to include poisson based error
	redimension/n=(ncolumns) MatrixWave
	redimension/n=(ncolumns) errMatrix
	
	//Graph
	String GraphName = "Mass_Distribution_"+AvgName
	KillWindow/Z $GraphName
	Display/N=$GraphName $nameofwave(MatrixWave) vs $nameofwave(BdrWave)
	ErrorBars $nameofwave(MatrixWave) SHADE= {0,0,(0,0,0,0),(0,0,0,0)},wave=($nameofwave(errMatrix),$nameofwave(errMatrix))
	Label left "Average BC Core Mass Size Distribution\rdMdlogD\\BMEV\\M [µg m\\S-3\\M]"
	ModifyGraph log(bottom)=1;DelayUpdate
	Label bottom "BC core mass equivalent diameter D\\BMEV\\M [nm]"
	ModifyGraph grid=1,gridRGB=(0,0,0)
	
	

end


Function AJD_ReBin_SD_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			string WaveMatch_Str = "", BdrMatch_Str = "", dlogDp_str = ""
			variable MinCut, MaxCut
			prompt WaveMatch_Str, "Please enter the identifying string for the 2D wave (i.e. BHBL_MassDistr, BBLG_NumbDistr)."
			prompt BdrMatch_Str, "Please enter the identifying string for the DiamBdr (i.e. BHBL_DiamBdr, BBLG_NumbDistr)."
			prompt MinCut, "Please enter the minimum range for the diameter."
			prompt MaxCut, "Please enter the maximum range for the diameter."
//			prompt dlogDp_str, "Please enter the identifying string for the dlogDp wave."
			doprompt "Please Enter the following infomation.", WaveMatch_Str, BdrMatch_Str,Mincut,MaxCut//, TimeMatch_str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			AJD_Rebin(WaveMatch_Str, BdrMatch_Str,MinCut,MaxCut)//,dlogDp_str,)
		case 2:
			break
		endswitch
end


//With a new diameter range rebin a SD
Function AJD_Rebin(WaveMatch_Str, BdrMatch_Str,MinCut,MaxCut)//,dlogDp_str,)

	//Establish Function Parameters
	string WaveMatch_Str, BdrMatch_Str//, dlogDp_str
	variable MinCut, MaxCut
	
	//Find waves
	string WaveMatch_help_Str = "*"+WaveMatch_Str+"*"
	string BdrMatch_help_Str = "*"+BdrMatch_Str+"*"
//	string dlogDp_help_str = "*"+dlogDp_Str+"*"
		
	string identifyWave = wavelist(WaveMatch_help_Str, ";", "TEXT:0")
	string identifyBdr = wavelist(BdrMatch_help_Str,";","TEXT:0")
//	string identifydlogDp = wavelist(dlogDp_str,";","TEXT:0")
	
	wave TwoDWave = $stringfromlist(0,identifyWave,";")
	wave BdrWave = $stringfromlist(0,identifyBdr,";")
//	wave dlogDp = $stringfromlist(0,identifydlogDp,";")
	
	
	//Establish Local Parameters
	variable nrows = dimsize(TwoDWave,0)
	variable ncols = dimsize(TwoDWave,1)
	variable i,j
	variable pMin, pMax, range
	Duplicate/O TwoDWave, TEMPSD
	
	//Use Diam_Bdr and cuts to find where we should adjust the SD
//	FindLevel/Q BdrWave, MinCut
	pMin = binarySearch(BdrWave,MinCut)
//	if(V_Flag==1)
//		killwaves/Z TEMPSD
//		abort "Diameter Minimum not within size range."
//	elseif(V_Flag==0)
//		pMin = V_LevelX
//	endif
	
//	FindLevel/Q BdrWave, MaxCut
	pMax = binarySearch(BdrWave,MaxCut)
//	if(V_Flag==1)
//		killwaves/Z TEMPSD
//		abort "Diameter Maximum not within size range."
//	elseif(V_Flag==0)
//		pMax = V_LevelX
//	endif	
	
	range = pMax-pMin
	
	//Find dlogDp
	Duplicate/O BdrWave, dlogDp
	redimension/n=(ncols) dlogDp
	for(i=0;i<ncols;i++)
		dlogDp[i] = log(BdrWave[i+1])-log(BdrWave[i])	
	endfor
	
	
	//Create for loop 1 -> undo dlogDp		dX/dlogDp * dlogDp
	//Assuming that the the SD progresses with rows and the distribution is in columns.  
	for(i=0;i<nrows;i++)
		for(j=0;j<ncols;j++)
			TEMPSD[i][j] *= dlogDp[j]
		endfor		 
	endfor
	
	//Now we have our SD out of dlogdp (dX -> number, area, volume, mass divided by sample flow in cm3, m3 etc.)
	Duplicate/O/RMD=[][pmin,pmax] TEMPSD, TEMPSD1
	Duplicate/O/R=(pMin,pMax) dlogDp, dlogDp_adjusted
	
	//Create for loop 2 -> redo dlogDp	dX / dlogDp
	for(i=0;i<nrows;i++)
		for(j=0;j<range;j++)
			TEMPSD1[i][j] /= dlogDp_adjusted[j]
		endfor		 
	endfor
	
	//Rename waves
	string Rebin2D_Name = nameofwave(TwoDWave)+"_rebinned_"+num2str(MinCut)+"_"+num2str(MaxCut)
	string RebinBdr_Name = nameofwave(BdrWave)+"_rebinned_"+num2str(MinCut)+"_"+num2str(MaxCut)
	
	duplicate/O/R=[pMin,pMax+1] BdrWave, TEMPBdr
	rename TEMPSD1, $Rebin2D_Name
	rename TEMPBdr, $RebinBdr_Name

	AJD_SDStats(Rebin2D_Name, RebinBdr_Name)
	
End




///////////////////////////////////////////////////////////////////////
///////////AJD PBP Time averaged Histogram matrix creator//////////////
///////////////////////////////////////////////////////////////////////
////////////////////////////3/30/2025//////////////////////////////////
///////////////////////////////////////////////////////////////////////


//Idea: Take a time wave (designed for the SP2's Particle by Particle Coating Data (PBP CT Data) and average the points
//associated with the time wave (signal wave) to the timeframe inputted in by the user and then crate a matrix of histograms. 


Function TimeAvgHistMatrix_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			string SigMatch_Str = "", TimeMatch_Str = "";variable TimeFrameAvg; variable nBins
			prompt SigMatch_Str, "Please enter the identifying string for the signal wave."
			prompt TimeMatch_Str, "Please enter the identifying string for the time wave."
			prompt TimeFrameAvg, "Please enter the averaging timeframe in seconds."
			prompt nBins, "Please enter in the number of Bins in each histogram."
			doprompt "Please Enter the following infomation.", SigMatch_Str, TimeMatch_Str,TimeFrameAvg, nBins
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave SignalWave = $SigMatch_Str
			wave TimeWave = $TimeMatch_Str
			TimeAvgHist(SignalWave, TimeWave, TimeFrameAvg, nBins)
		case 2:
			break
		endswitch
end



Function TimeAvgHist(SignalWave, TimeWave, TimeFrameAvg, nBins)

	//Establish Function Parameters
	wave SignalWave, TimeWave
	Variable TimeFrameAvg, nBins
	
	//Establish Local Parameters
	Variable i, k, pDiff, HoldReal, HoldImaginary
	Variable/C HoldCmplx
	String MatrixNameFlip = nameofwave(SignalWave)+"_HistMatrix_FlipMe"
	String MatrixName = nameofwave(SignalWave)+"_HistMatrix"
	variable TimeFrame_Start, TimeFrame_End
	variable npnts_Signal = dimsize(SignalWave,0)
	
	//Establish DataFolder Connections
	DFREF StartDF = EstablishCurrDF()
	
	//CreateMatrix
	Make/o/d/n=(nBins,npnts_Signal) $MatrixNameFlip
	Wave HoldingMatrix = $MatrixNameFlip
	
	//Establish HistWave for an X-Axis plot
	Variable minSigWave = wavemin(SignalWave)
	Variable maxSigWave = wavemax(SignalWave)
	Variable SignalRange = MaxSigWave-MinSigWave
	Make/o/d/n=(SignalRange) $nameofwave(SignalWave)+"_HistXWave"
	Wave HistX =  $nameofwave(SignalWave)+"_HistXWave"
	variable binwidth = signalrange/nbins
	
	//Make a wave to show the diameters
	Make/o/d/n=(nbins) HistBinWave_Midpnt = minSigWave+(binwidth*p)
	duplicate/O HistBinWave_Midpnt, HistBinWave_Bdr
	makeedgeswave(HistBinWave_Midpnt, HistBinWave_Bdr)
	
	//Establish Time Wave
	Make/o/d/n=(npnts_signal) HistTimeWave_Midpnt
	setscale d,0,0,"dat" HistTimeWave_Midpnt
	
	
	
	//Initate the loop and find the difference in points
	HoldCmplx = UpdateLoopTimeFrame(TimeWave[0], TimeWave[0]+TimeFrameAvg, TimeWave)
	HoldReal = real(HoldCmplx)
	HoldImaginary = imag(HoldCmplx)
	pDiff = HoldImaginary-HoldReal 
	variable DateOffSet = TimeWave[0]
	HistTimewave_Midpnt[0] = (TimeWave[HoldImaginary]-TimeWave[HoldReal])/2 + (DateOffSet)
			
	//Impliment do-while loop here for ease of loop updating
	do
	//Make Holding Wave
	make/o/d/n=(pDiff)/Free TempWave4Hist=NaN
	
	//Fill TempWave4Hist wave with data from the signalwave; set i = to the lower time point in the wave for the timeframe to it updates properly (we don't start at i=0 for the time wave every iteration)
	for(i=HoldReal;i<HoldImaginary;i++)
		TempWave4Hist[i-HoldReal] = SignalWave[i]	//subtract the offset of holdreal for indexing
	EndFor	
		
	//Create the Hist and append the generated hist wave to the matrix
	Make/O/N=(nBins) W_Hist = NaN
	Histogram/B={minSigWave,binwidth,nbins} TempWave4Hist, W_Hist
	HoldingMatrix[0,nBins-1][k] = W_Hist[x+0]
	
	//Update the loop
	HoldCmplx = UpdateLoopTimeFrame(TimeWave[HoldImaginary], TimeWave[HoldImaginary]+TimeFrameAvg, TimeWave)
	HoldReal = real(HoldCmplx)
	HoldImaginary = imag(HoldCmplx)
	pDiff = HoldImaginary-HoldReal
	DateOffSet = Timewave[HoldReal]
	HistTimewave_Midpnt[k+1] = (TimeWave[HoldImaginary-1]-TimeWave[HoldReal])/2+(DateOffSet)
	
	//Check to see if we are at the end of the timewave
	if(HoldImaginary == npnts_Signal)
		break
	endif
	
	k++
	while(k<npnts_Signal) //This should work for now
	
	//Tidy up Matrix.
	Redimension/N=(nbins,k) HoldingMatrix
	MatrixOp $MatrixName = HoldingMatrix^t
	
	//Make time bdr wave
	Redimension/N=(k) HistTimewave_Midpnt
	duplicate/O HistTimewave_Midpnt,HistTimewave_Bdr
	MakeEdgeswave(HistTimewave_Midpnt,HistTimewave_Bdr)
	
	killwaves/Z W_Hist
	Killwaves/Z HoldingMatrix
	Killwaves/Z TempWave4Hist
	Killwaves/Z HistX
End



//Supporting Function: Establish CurrDF
Function/DF EstablishCurrDF()

	DFREF DF_REF = getdatafolderDFR()
	
	Return DF_REF

End

//Supporting Function: Establish/Update TimeFrame for loop
Function/C UpdateLoopTimeFrame(StartVar, EndVar, TimeWave)

	//Establish Function Parameters
	Variable StartVar, EndVar
	Wave TimeWave
	
	//EStablish Local Parameters
	variable/C p_StartEnd = cmplx(0,0)	//In order to have a function be able to provide 2 variables use a complex number
	Variable pStart, pEnd
	//Establish Beginning time frame
//	Findvalue/V=(floor(StartVar)) TimeWave
//	pStart = V_Value
	pStart = binarysearch(Timewave,StartVar)
	//Establish other route if binary search fails
	if(pStart == -1) //If the result of BinarySeaerch returns a value that would be before p0 in the wave
		pStart = TimeWave[0]
	elseif(pStart == -2)
		Abort "Error in 'UpdateLoopTimeFrame' supporting code. Timeframe start occurs after the last ending time. Aborting."
	elseif(pStart == -3)
		Abort "Yer wave hath no points. Perish mortal."
	endif
	
//	Findvalue/V=(ceil(EndVar)) TimeWave
//	pEnd = V_Value
	pEnd = binarysearch(TimeWave,Endvar)
	//Establish other route if binary search fails
	if(pEnd == -1) //If the result of BinarySeaerch returns a value that would be before p0 in the wave
		pEnd = TimeWave[0]
	elseif(pEnd == -2)
		pEnd = dimsize(TimeWave,0)
	elseif(pEnd == -3)
		Abort "Yer wave hath no points. Perish mortal."
	endif
	
	if(pStart==pEnd)
		//Breakpoint analysis point
//		make/o/d/n=1 deleteme 
	endif
	p_StartEnd = cmplx(pStart,pEnd)
	return p_StartEnd

end



//1/14/2025 Generate Stats from SD; this is code is heavily inspired from Lauren Garafolo's TSIStatistics Function in the Farmer Group SMPS Data Processor
// Based on Appendix C of AIM Aerosol Instrument Manager® Software for Scanning Mobility Particle Sizer™  
// (SMPS™) Spectrometer User’s Manual P/N 1930038, Revision H April 2010 
// https://cires1.colorado.edu/jimenez-group/Manuals/AIM_SMPS_manual.pdf

Function AJD_SDStats_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			string WaveMatch_Str = ""
			string BdrMatch_Str = "" 
//			String TimeMatch_Str = ""
			prompt WaveMatch_Str, "Please enter the identifying string for the 2D wave (i.e. BHBL_MassDistr, BBLG_NumbDistr)."
			prompt BdrMatch_Str, "Please enter the identifying string for the DiamBdr (i.e. BHBL_DiamBdr, BBLG_NumbDistr)."
//			prompt TimeMatch_Str, "Please enter the identifying string for the Time Wave."
			doprompt "Please Enter the following infomation.", WaveMatch_Str, BdrMatch_Str//, TimeMatch_str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			AJD_SDStats(WaveMatch_Str, BdrMatch_Str)//, TimeMatch_Str)
		case 2:
			break
		endswitch
end

Function AJD_SDStats(WaveMatch_Str, BdrMatch_Str)//, TimeMatch_Str)

	//Establish Function Parameters
	string WaveMatch_Str, BdrMatch_Str//, TimeMatch_Str
	
	//Establish Waves
	string WaveMatch_help_Str = "*"+WaveMatch_Str+"*"
	string BdrMatch_help_Str = "*"+BdrMatch_Str+"*"
//	string TimeMatch_help_Str = "*"+TimeMatch_Str+"*"
	
	string identifyWave = wavelist(WaveMatch_help_Str, ";", "TEXT:0")
//	string identifyTime = wavelist(TimeMatch_help_Str, ";", "TEXT:0")
	string identifyBdr = wavelist(BdrMatch_help_Str,";","TEXT:0")
	wave TwoDWave = $stringfromlist(0,identifyWave,";")
//	wave TimeWave = $stringfromlist(0,identifyTime,";")
	wave BdrWave = $stringfromlist(0,identifyBdr,";")
	
	//Establish DF to move Stats
	DFREF CurrentDF = getdatafolderDFR()
	String Stats_DF_Name = "Stats_"+nameofwave(TwoDWave)
	NewDataFolder/O/S $Stats_DF_Name
	DFREF Stats_DF = getdatafolderDFR()
	
	Setdatafolder CurrentDF
	
	
	//Establish other Variables
	variable npnts_bdr = dimsize(BdrWave,0)
	variable npnts_dlogDp = npnts_bdr-1
	variable i, j
	variable nrows = dimsize(TwoDWave,0)
	variable ncolumns = dimsize(TwoDwave,1)
	variable GeoMean, GeoSD, TotalConc, Avg, Modee, Median_Var
	variable sumnum, sumdenom
	
	//Tranpose Matrix for Ease of Access
	MatrixOP/FREE TransposeTwoDWave = TwoDWave^t
	
	//Make Stats Waves
	Make/O/N=(numpnts(BdrWave)-1) GM_num
	Make/O/N=(numpnts(BdrWave)-1) GM_den
	Make/O/N=(numpnts(BdrWave)-1) Diam
	Make/O/N=(numpnts(BdrWave)-1) M_Num
	Make/O/N=(numpnts(BdrWave)-1) M_Den
	
	Make/O/N=(dimsize(TwoDWave,0)) Geometric_Mean
	Make/O/N=(dimsize(TwoDWave,0)) Geometric_SD
	Make/O/N=(dimsize(TwoDWave,0)) Total_Concentration
	Make/O/N=(dimsize(TwoDWave,0)) Average
	Make/O/N=(dimsize(TwoDWave,0)) Mode
	Make/O/N=(dimsize(TwoDWave,0)) Median_
	
//	Make/O/N=5/T StatsName
//	string StatsString = "Geometric Mean;Geometric SD;Total Concentration;Average;Mode"
//	for(i=0;i<5;i++)
//		StatsName[i] = Stringfromlist(i,StatsString,";")
//	endfor
	for(i=0;i<npnts_dlogDp;i++)
		Diam[i] = (BdrWave[i]+BdrWave[i+1])/2
	endfor
	
	//Get dlogDp
	Make/O/N=(numpnts(BdrWave)-1) dlogDp
	dlogDp = NaN
	for(i=0;i<npnts_dlogDp;i++)
		dlogDp[i] = Log(BdrWave[i+1])-Log(BdrWave[i])
	endfor
	
	
	//Perform Calculations on 2D Wave
	for(i=0;i<nrows;i++)
	
		MatrixOP/O HoldRow = col(TransposeTwoDWave,i)
		//Make sure there is no NaN in the Matrix as this will cause an error that will stop the code from running
		if(numtype(HoldRow[0])==2) //test the first point
			//Update Stats Waves
			Geometric_Mean[i] = NaN
			Geometric_SD[i] = NaN
			Total_Concentration[i] = NaN
			Average[i] = NaN
			Mode[i] = NaN	
			Median_[i] = NaN
			continue
		endif
		
		HoldRow*=dlogDp	//Get out of dlogDp
		
		
		//Geometric Mean
		GM_num = HoldRow * ln(diam)
		GM_den = HoldRow
		sumnum = SumNaNs(GM_num)
		sumdenom = SumNaNs(GM_den)
		GeoMean = exp(sumnum/sumdenom)
		
//		Print "Geometric Mean is " + num2str(GeoMean)
		
		//Geometric Standard Deviation
		GM_num = HoldRow * ( ln(diam)-ln(GeoMean) )^2
		GM_den = HoldRow
		GeoSD = exp(sqrt(SumNaNs(GM_num)/SumNaNs(HoldRow)))
//		Print "Geometric Standard Devation is " + num2str(GeoSD)
		
		//Total Concentration
		TotalConc = SumNaNs(HoldRow)
	//	Print "Total Num Conc is " + num2str(Sum(W))
		
		//Mean
		//Sum(HoldRow*Diam)
		WaveStats/Q HoldRow
		M_Num = (HoldRow*Diam)
		M_Den	= HoldRow
		Avg = (SumNaNs(M_num)/SumNaNs(M_den))
		
		
		//Mode
		Modee = Diam[V_MaxLoc]
		
		//Median;; This deviates from TSI way because their way is confusing to me
		//TSI Way -> Dp[N/2];; makes zero sense to me. N = Total Concentration and Dp = channel midpoint boundry
		//Median -> Half of the particles are smaller and half are larger.
		//My approach uses the Particle Size Distribution cumulative concentration
		//Cumulative Concentration = mass[i] + mass[i-1] + mass[i-2] ... mass[0]
		Duplicate/O HoldRow, CumulativeMass
		CumulativeMass = NaN
		variable StackingMass = 0
		for(j=0;j<(numpnts(HoldRow));j++)
			StackingMass += HoldRow[j]
			CumulativeMass[j] = StackingMass
		endfor
		variable d50 = TotalConc/2
		FindLevel/Q CumulativeMass, d50
		variable levelup, leveldown, medinterp
		//If all 0's then v_levelX is NaN
		if(numtype(v_LevelX)==2)
			Geometric_Mean[i] = NaN
			Geometric_SD[i] = NaN
			Total_Concentration[i] = NaN
			Average[i] = NaN
			Mode[i] = NaN	
			Median_[i] = NaN
		else
		
			levelup = ceil(v_LevelX)
			leveldown = floor(v_LevelX)
			medinterp = (diam[levelup]+diam[leveldown])/2
			
			Median_Var = medinterp
			
			//Update Stats Waves
			Geometric_Mean[i] = GeoMean
			Geometric_SD[i] = GeoSD
			Total_Concentration[i] = TotalConc
			Average[i] = Avg
			Mode[i] = Modee	
			Median_[i] = Median_Var
		
		endif
			
		killwaves/Z HoldRow
		killwaves/Z SortedRow
	endfor
	
	string StatsWaveList = wavelist("Geometric_Mean",";","TEXT:0")
	StatsWaveList += wavelist("Geometric_SD",";","TEXT:0")
	StatsWaveList += wavelist("Total_Concentration",";","TEXT:0")
	StatsWaveList += wavelist("Average",";","TEXT:0")
	StatsWaveList += wavelist("Mode",";","TEXT:0")
	StatsWaveList += wavelist("Median_",";","TEXT:0")
	
	variable nwaves = itemsinlist(StatsWaveList,";")
	for(i=0;i<nwaves;i++)
		wave tempwave = $StringFromList(i,StatsWaveList,";")
		string movewavename = StringFromList(i,StatsWaveList,";")
		movewave tempwave, Stats_DF
	endfor
	
	setdatafolder Stats_DF
	//Create Table
	string tablename = "StatsTable_"+nameofwave(TwoDWave)
	KillWindow/Z $tablename
	Edit/N=$tablename
	Appendtotable Geometric_Mean, Geometric_SD, Total_Concentration, Average, Mode, Median_
	
	setdatafolder CurrentDF
	
	Killwaves/Z HoldRow
	KillWaves/Z M_WaveStats
	Killwaves/Z SortedRow
	Killwaves/Z Diam
	Killwaves/Z dlogDp
	Killwaves/Z GM_den
	Killwaves/Z GM_num
	Killwaves/Z M_Den
	Killwaves/Z M_Num
	Killwaves/Z CumulativeMass
	

end




Function AJD_SP2HeatMap_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			string WaveMatch_Str = ""
			string BdrMatch_Str = "" 
			String TimeMatch_Str = ""
			prompt WaveMatch_Str, "Please enter the identifying string for the 2D wave (i.e. BHBL_MassDistr, BBLG_NumbDistr)."
			prompt BdrMatch_Str, "Please enter the identifying string for the DiamBdr (i.e. BHBL_DiamBdr, BBLG_NumbDistr)."
			prompt TimeMatch_Str, "Please enter the identifying string for the Time Wave."
			doprompt "Please Enter the following infomation.", WaveMatch_Str, BdrMatch_Str, TimeMatch_str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			AJD_SP2_HeatMap(WaveMatch_Str, BdrMatch_Str, TimeMatch_Str)
		case 2:
			break
		endswitch
end


function AJD_SP2_HeatMap(WaveMatch_Str, BdrMatch_Str, TimeMatch_Str)

	//establish function parameters
	string WaveMatch_Str, BdrMatch_Str, TimeMatch_Str
	
	string WaveMatch_help_Str = "*"+WaveMatch_Str+"*"
	string BdrMatch_help_Str = "*"+BdrMatch_Str+"*"
	string TimeMatch_help_Str = "*"+TimeMatch_Str+"*"
	
	string identifyWave = wavelist(WaveMatch_help_Str, ";", "TEXT:0")
	string identifyTime = wavelist(TimeMatch_help_Str, ";", "TEXT:0")
	string identifyBdr = wavelist(BdrMatch_help_Str,";","TEXT:0")
	wave TwoDWave = $stringfromlist(0,identifyWave,";")
	wave TimeWave = $stringfromlist(0,identifyTime,";")
	wave BdrWave = $stringfromlist(0,identifyBdr,";")
	
	
	string GraphName = "HeatMap_"+WaveMatch_Str
	Display/N=$GraphName
	AppendImage/W=$GraphName TwoDWave vs {TimeWave,BdrWave};DelayUpdate
	ModifyImage/W=$GraphName $nameofwave(TwoDWave) ctab= {*,*,Geo,0}
	Label left "Diameter (nm)";DelayUpdate
	Label bottom "DateTime (Local)"
	ModifyGraph axisEnab(bottom)={0,0.9}
	ColorScale/C/N=text0/A=MC image=$nameofwave(TwoDWave);DelayUpdate
	ColorScale/C/N=text0 "dMdlogD\\Bc\\M (µg/m\\S3\\M)"

end






Function AJD_SP2LastBin2NaN_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
//			Variable P1, P2, Adjustment
//			prompt P1, "Please enter the start point in the waves"
//			prompt P2,  "Please enter the start point in the waves"
//			prompt Adjustment, "Please enter the amount to adjust (divide by)."
//			doprompt "Please Enter the following infomation.", P1,P2,Adjustment
//			if(V_Flag==1)
//				abort "User Aborted."
//			endif
			AJD_SP2_FixLastBin()
		case 2:
			break
		endswitch
end

function AJD_SP2_FixLastBin()

	string SDList = Wavelist("*Distr*",";","TEXT:0")
	variable i,j
	variable nrows = dimsize($stringfromlist(0,SDList,";"),0)
	variable ncolumns = dimsize($stringfromlist(0,SDList,";"),1)
	variable nwaves = itemsinlist(SDList,";")
	
	for(i=0;i<nwaves;i++)
		wave tempwave = $stringfromlist(i,SDList,";")
		nrows = dimsize(tempwave,0)
		ncolumns = dimsize(tempwave,1)
		for(j=0;j<nrows;j++)
			if(numtype(tempwave[j][ncolumns-2])==2)
				tempwave[j][ncolumns-1]=NaN
			elseif(numtype(tempwave[j][ncolumns-2])==0)
				tempwave[j][ncolumns-1]=0
			endif
		endfor
	
	endfor

end




Function AJD_SP2CodeGlitchFix_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			Variable P1, P2, Adjustment
			prompt P1, "Please enter the start point in the waves"
			prompt P2,  "Please enter the start point in the waves"
			prompt Adjustment, "Please enter the amount to adjust (divide by)."
			doprompt "Please Enter the following infomation.", P1,P2,Adjustment
			if(V_Flag==1)
				abort "User Aborted."
			endif
			SP2CodeGlitchFix(P1,P2,Adjustment)
		case 2:
			break
		endswitch
end


function SP2CodeGlitchFix(P1,P2,Adjustment)

	//establish function parameters
	variable P1, P2, Adjustment
	
	DFREF startDF = getdatafolderDFR()
	setdatafolder :ConcTSer
	DFREF ConcDF = getdatafolderDFR()
	setdatafolder startDF
	setdatafolder SDTser
	DFREF SDTSerDF = getdatafolderDFR()
	setdatafolder ConcDF
	
	string twave = wavelist("*Ctr*",";","TEXT:0")
	setdatafolder ConcDF
	string cwavesConc = wavelist("*Conc*",";","TEXT:0") 
	string swavesConc = wavelist("*Distr*",";","TEXT:0")
	Setdatafolder SDTSerDF
	string cwavesSDTser= wavelist("*Conc*",";","TEXT:0")
	string swavesSDTser = wavelist("*Distr*",";","TEXT:0")
	
	
	//ConcTSer
	setdatafolder ConcDF
	variable i 
	variable nwavesC = itemsinlist(cwavesConc,";")
	variable nwavesSD = itemsinlist(swavesConc,";")
	
	for(i=0;i<nwavesC;i++)
		wave tempwave = $stringfromlist(i,cwavesConc,";")
		tempwave[P1,P2]/=Adjustment
	endfor
	
//	for(i=0;i<nwavesSD;i++)
//		wave tempwave = $stringfromlist(i,swavesConc,";")
//		tempwave[P1,P2]/=Adjustment
//	endfor

	//SDTser
	Setdatafolder SDTserDF
	nwavesC = itemsinlist(cwavesSDTser,";")
	nwavesSD = itemsinlist(swavesSDTser,";")
	for(i=0;i<nwavesC;i++)
		wave tempwave = $stringfromlist(i,cwavesSDTser,";")
		tempwave[P1,P2]/=Adjustment
	endfor
	
	for(i=0;i<nwavesSD;i++)
		wave tempwave = $stringfromlist(i,swavesSDTser,";")
		tempwave[P1,P2]/=Adjustment
	endfor
	
	setdatafolder StartDF


End



Function AJD_TimeAvgFolderWaves(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			Variable Time_Extract
			String SigWave_Str = "", TWave_Str = "" 
			prompt Time_Extract, "Please enter the amount of seconds that the data should be averaged too."
			prompt TWave_Str, "Please Enter the name of the Time Wave."
			doprompt "Please Enter the following infomation.", Time_Extract, TWave_Str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave SigWave = $SigWave_Str
			wave Twave = $TWave_Str
			TimeAvgFolderWave(Time_Extract,TWave)
		case 2:
			break
		endswitch
end

Function TimeAvgFolderWave(Time_Extract,TWave)

	//Enter Parameters
	variable Time_Extract
	Wave TWave
		
	string IDWave = "!"+nameofwave(TWave)
	string All_Signal_Waves = wavelist(IDWave,";","TEXT:0")
	
	variable nwaves = itemsinlist(All_Signal_Waves,";")
	variable i 
	
	for(i=0;i<nwaves;i++)
		Wave TempSig = $stringfromlist(i,All_Signal_Waves,";")
		TimeAvgWave(Time_Extract,TempSig,TWave)
	endfor
	
	
End




Function AJD_ExportBinaryWaveList_ba(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="DataFolder Check" 2, "Are you in the datafolder that contains all of the waves?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Waves not generated. Aborting procedure."
			endif
			string CaptureWave = ""
			prompt CaptureWave, "What is the common string that all of the desired waves has? Or if you want to export all of the waves in the folder then leave blank."
			doprompt "Please enter the following information", CaptureWave
			AJD_ExportBinaryWaveList(CaptureWave)
		case 2:
			break
		endswitch
end


Function AJD_ExportBinaryWaveList(CaptureWave)

	//Establish Parameters
	string CaptureWave
	
	//Check to see if entry is blank
	if(stringmatch(CaptureWave,"")==1)
		string wList = wavelist("*",";","TEXT:0")
		variable nWaves = itemsinlist(wList, ";")
		variable i 
		string pathname = "TEMP_ExportBinary"
	
	else
	
		//Establish code specifc variables and strings
		string CaptureWave_HelpStr = "*"+CaptureWave+"*"
		wList = wavelist(CaptureWave_HelpStr, ";", "TEXT:0")
		nWaves = itemsinlist(wList, ";")
		pathname = "TEMP_ExportBinary"
	
	endif
	
	//Establish folder to save waves
	string CurrPath = AJD_SavePath(pathname)
	//Save the waves (through the wavelist DF_WaveList)
	save/O/B/C/M="\r\m"/P=$pathname wList //No 'as name' here due to Binary Nature of Saving
	//Kill the current path to prep 
	Killpath/Z $CurrPath
	
	
End
















Function AJD_Time_Avg_LEO_Waves(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Are the Folders containing the imported SP2 Data organized?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			Variable Time_Extract, savevar
			String ImportedDF = "" 
			prompt Time_Extract, "Please enter the amount of seconds that the data should be averaged too."
			prompt ImportedDF, "Please Enter the Full Path to the Folder Containing all of the extracted Data."
			prompt savevar, "Enter 0 to save Coatings, 1 to save optdiam."
			doprompt "Please Enter the following infomation.", Time_Extract, ImportedDF, savevar
			if(V_Flag==1)
				abort "User Aborted."
			endif
			Time_Averging_LEO_Waves(Time_Extract, ImportedDF,savevar)
		case 2:
			break
		endswitch
end


Function Time_Averging_LEO_Waves(Time_Extract,ImportedDF,savevar)

	variable Time_Extract, savevar
	string ImportedDF 
	
	//Establish a DFREF for the starting DF
	SetDatafolder $ImportedDF
	DFREF StartDF = GetDataFolderDFR()
	
	
	variable nDataFolders_General
	string GeneralDataFolderList = "" 
	variable i, j, k , npnts
	
	//Get some information and run a loop
	nDataFolders_General = countobjectsDFR(StartDF,4) //Get the number of datafolders
	
	//For Loop to get all of the General Data Folders
	for(i=0;i<nDataFolders_General;i++)
		GeneralDataFolderList += getindexedObjNameDFR(StartDF,4,i)+";"
	endfor
	i=0
	
	
	//Assumes no chunk on first data set
	string findnwaves_LEO_str
	variable findnwaves_LEO_var
	setdatafolder $stringfromlist(0,GeneralDatafolderList,";")
	findnwaves_LEO_str = getindexedObjName("", 4,2) //Get the LEO of the first point
	setdatafolder $Findnwaves_LEO_str
	findnwaves_LEO_var = countObjects("",1)
	
	setdatafolder StartDF
	//Setup Concatenation DF for LEO
	if(Datafolderexists("SP2_Waves_Concat")==0) //If it does exist
		//Set the Concat DF and make the sub DF
		SetDatafolder "SP2_Waves_Concat"
		newdatafolder/O/S LEO_Concat
		DFREF LEO_ConcatDF = getdatafolderDFR()
		
	elseif(Datafolderexists("SP2_Waves_Concat")==1) //If it does not exist
		//Make the Concat DF and then set up the sub DF
		newdatafolder/O/S SP2_Waves_Concat
		DFREF Concat_General = getdatafolderDFR()
		newdatafolder/O/S LEO_Concat
		DFREF LEO_ConcatDF = getdatafolderDFR()	
		
	endif
	
	//Now that we have the concat DF Loop through all of the folders and look for the LEO CT waves to time avg (currently AJD_SCLG_BCcoatingThickness, AJD_SCLG_OptDiamAll and TimeDate [I think the AJD got cut from this]) 
	
		//Employ Wave Identifying Strings to take advantage of stringmatch later in the code
		string wIdentify_BCcT = "AJD_SCLG_BCcoatingThickness"
		string wIdentify_OptDiam = "AJD_SCLG_OptDiamAll"
		string wIdentify_DT = "TimeDate"
		
		
		string reportedwave = "", currwavelist = "", ConcatwaveList = ""
		
	for(j=0;j<findnwaves_LEO_var;j++)
		for(i=0;i<nDataFolders_General;i++) //We are acessing the subfolders with this
			//Set the datafolder back to the start for smooth tranition to next one
			setdatafolder StartDF
			//Set the datafolder to the first on the list found above
			String CurrDF = stringfromlist(i,GeneralDataFolderList,";")
			if(stringmatch(CurrDF, "SP2_Waves_Concat")==1)
				Continue
			else
			endif
	  		setdatafolder $CurrDF 
	  		
//	  		TserDF = getindexedObjName("", 4,1) //Get the ConcTser of the first point; should cover chunks too
			String LEODF = getindexedObjName("",4,2)	//Get LEO DF too; If only 2 chunks returns "" 
			if(cmpstr(LEODF,"") == 0) //IF LEODF is equal to "" (a blank string)
				LEODF = getindexedObjName("",4,0) // Should set up to chunk 1
			endif
			
			string Fullpath2Folder = Getdatafolder(1)+LEODF
	  		
	  		//Get the numer of subfolders in the datafolder 
	//		nDatafolders_Layer1 = Countobjects("",4)
			
			//If this is a datafolder that contains chunks we need to go a bit deeper
			if(stringmatch(LEODF,"*Chunk*")==1) //If it does contain chunks
				variable chunknumber = countObjects("",4)	//How many chunk folders are there?
				
				DFREF TempChunkDFREF = GetdatafolderDFR()	//Sets the DF to the data DF (DF that holds the Chunk DFs)
				for(k=0;k<chunknumber;k++)
					setdatafolder TempChunkDFREF	//Return back to 'home base'
					string currchunk = getindexedObjNameDFR(TempChunkDFREF,4,k)	//Find the chunk folder at index k
					setdatafolder $currchunk
					LEODF = getindexedObjName("", 4,2) //Get the ConcTser of the first point; should cover chunks too
					Fullpath2Folder = Getdatafolder(1)+LEODF
					//Get wave
					string Currwave = getindexedobjName(Fullpath2Folder,1,j)
						//Check to make sure its one our our 3 waves of intrest
					if(savevar==0)
						If(cmpStr(Currwave,wIdentify_BCcT) == 0)	//If currwave == the BCcT wave 
							wave tempwave = $Fullpath2Folder+":"+Currwave
							//$stringfromlist(0,Currwave)
							string dupwavename = nameofwave(tempwave)+num2str(i)+"_"+num2str(k)
							//Get the full path DF+Wave
							ReportedWave = getdatafolder(1)+CurrWave+";"
							
							
							//Combine them to create our list
							CurrWavelist += ReportedWave
							//Add on to builidng wave
							Duplicate/O tempwave,LEO_ConcatDF:$dupwavename
							
						elseif(cmpStr(Currwave,wIdentify_DT)==0)
							wave tempwave = $Fullpath2Folder+":"+Currwave
							//$stringfromlist(0,Currwave)
							dupwavename = nameofwave(tempwave)+num2str(i)+"_"+num2str(k)
							//Get the full path DF+Wave
							ReportedWave = getdatafolder(1)+CurrWave+";"
							
							
							//Combine them to create our list
							CurrWavelist += ReportedWave
							//Add on to builidng wave
							Duplicate/O tempwave,LEO_ConcatDF:$dupwavename	
							
						else
							continue
						endif
					elseif(savevar==1)
					if(cmpStr(Currwave,wIdentify_OptDiam) == 0)//If currwave == the BCcT wave 
						wave tempwave = $Fullpath2Folder+":"+Currwave
						//$stringfromlist(0,Currwave)
						dupwavename = nameofwave(tempwave)+num2str(i)+"_"+num2str(k)
						//Get the full path DF+Wave
						ReportedWave = getdatafolder(1)+CurrWave+";"
						
						
						//Combine them to create our list
						CurrWavelist += ReportedWave
						//Add on to builidng wave
						Duplicate/O tempwave,LEO_ConcatDF:$dupwavename
						
						
						
					elseif(cmpStr(Currwave,wIdentify_DT)==0)
						wave tempwave = $Fullpath2Folder+":"+Currwave
						//$stringfromlist(0,Currwave)
						dupwavename = nameofwave(tempwave)+num2str(i)+"_"+num2str(k)
						//Get the full path DF+Wave
						ReportedWave = getdatafolder(1)+CurrWave+";"
						
						
						//Combine them to create our list
						CurrWavelist += ReportedWave
						//Add on to builidng wave
						Duplicate/O tempwave,LEO_ConcatDF:$dupwavename	
					
					else
						continue
					endif
					
				endif
					
				
//					wave tempwave = $Fullpath2Folder+":"+Currwave
//					//Get the full path DF+Wave
//					ReportedWave = getdatafolder(1)+CurrWave+";"
//					
//					CurrWavelist += ReportedWave
//					string dupwavename = nameofwave(tempwave)+num2str(i)+"_"+num2str(k)
//					Duplicate/O tempwave,LEO_ConcatDF:$dupwavename

				endfor
				
				
			
	
			
			elseif(stringmatch(LEODF,"*Chunk*")==0) //If it does not contain chunks
				//Find the first wave
				Currwave = getindexedobjName(LEODF,1,j)
				//Check to make sure its one our our 3 waves of intrest
			if(savevar==0)
				If(cmpStr(Currwave,wIdentify_BCcT) == 0)	//If currwave == the BCcT wave 
					wave tempwave = $Fullpath2Folder+":"+Currwave
					//$stringfromlist(0,Currwave)
					dupwavename = nameofwave(tempwave)+num2str(i)
					//Get the full path DF+Wave
					ReportedWave = getdatafolder(1)+CurrWave+";"
					
					
					//Combine them to create our list
					CurrWavelist += ReportedWave
					//Add on to builidng wave
					Duplicate/O tempwave,LEO_ConcatDF:$dupwavename
					
					
					
				elseif(cmpStr(Currwave,wIdentify_DT)==0)
					wave tempwave = $Fullpath2Folder+":"+Currwave
					//$stringfromlist(0,Currwave)
					dupwavename = nameofwave(tempwave)+num2str(i)
					//Get the full path DF+Wave
					ReportedWave = getdatafolder(1)+CurrWave+";"
					
					
					//Combine them to create our list
					CurrWavelist += ReportedWave
					//Add on to builidng wave
					Duplicate/O tempwave,LEO_ConcatDF:$dupwavename	
					
					
					
				else
					continue
				endif
					
			elseif(Savevar==1)	
				if(cmpStr(Currwave,wIdentify_OptDiam) == 0)//If currwave == the BCcT wave 
					wave tempwave = $Fullpath2Folder+":"+Currwave
					//$stringfromlist(0,Currwave)
					dupwavename = nameofwave(tempwave)+num2str(i)
					//Get the full path DF+Wave
					ReportedWave = getdatafolder(1)+CurrWave+";"
					
					
					//Combine them to create our list
					CurrWavelist += ReportedWave
					//Add on to builidng wave
					Duplicate/O tempwave,LEO_ConcatDF:$dupwavename
					
					
				elseif(cmpStr(Currwave,wIdentify_DT)==0)
					wave tempwave = $Fullpath2Folder+":"+Currwave
					//$stringfromlist(0,Currwave)
					dupwavename = nameofwave(tempwave)+num2str(i)
					//Get the full path DF+Wave
					ReportedWave = getdatafolder(1)+CurrWave+";"
					
					
					//Combine them to create our list
					CurrWavelist += ReportedWave
					//Add on to builidng wave
					Duplicate/O tempwave,LEO_ConcatDF:$dupwavename	
				else
					continue
				endif
	
				
				endif
			Endif
		endfor	
		
//		Need to break these up due to memory issues
		
		if(savevar==0)
			If(cmpStr(Currwave,wIdentify_BCcT) == 0)	//If currwave == the BCcT wave 
				
				setdatafolder LEO_ConcatDF
				Currwave +="_Concat"
				ConcatwaveList = wavelist("!*Concat",";","TEXT:0")
				Concatenate/O/NP/Kill ConcatWaveList, $Currwave
				
			elseif(cmpStr(Currwave,wIdentify_DT) == 0)
				setdatafolder LEO_ConcatDF
				Currwave +="_Concat"
				ConcatwaveList = wavelist("!*Concat",";","TEXT:0")
				Concatenate/O/NP/Kill ConcatWaveList, $Currwave	
				
				
			endif
		elseif(savevar==1)	
			if(cmpStr(Currwave,wIdentify_OptDiam) == 0) 
				setdatafolder LEO_ConcatDF
				Currwave +="_Concat"
				ConcatwaveList = wavelist("!*Concat",";","TEXT:0")
				Concatenate/O/NP/Kill ConcatWaveList, $Currwave
				
			elseif(cmpStr(Currwave,wIdentify_DT) == 0)
				setdatafolder LEO_ConcatDF
				Currwave +="_Concat"
				ConcatwaveList = wavelist("!*Concat",";","TEXT:0")
				Concatenate/O/NP/Kill ConcatWaveList, $Currwave	
					
			endif	
		Endif	
	Endfor
	
	setdatafolder LEO_ConcatDF
	
	
//		Define waves from concatenation part of code


	wIdentify_BCcT = "AJD_SCLG_BCcoatingThickness_Concat"
	wIdentify_OptDiam = "AJD_SCLG_OptDiamAll_Concat"
	wIdentify_DT = "TimeDate_Concat"

	wave TimeDate_AJD = $wIdentify_DT
	wave BCcT = $wIdentify_BCcT
	wave OptDiam = $wIdentify_OptDiam	 
	
	variable timeframe

//		//Perform Time_Extraction_Averaging to reduce the length of waves -> must do this until memory issue is resolved
		j=1
		k=0
		npnts = dimsize(TimeDate_AJD,0)
		variable t_start, t_end
		t_start = TimeDate_AJD[0] //First index of the TimeDate wave should be the first starting point
		t_end = t_start+Time_Extract	//established first timeframe
	
		variable forstart, forend
		forstart = Timedate_AJD[0]
		forend = Timedate_AJD[inf]
	
		variable p_start, p_end //point's for times
		p_start = 0 //we are starting at x = 0 here
	
		make/o/d/n=1 Avg_BCcT
		make/o/d/n=1 Avg_OptDiam
		make/o/d/n=1 Avg_DT
		setscale d 0, 0, "dat" Avg_DT 
	
		For(forstart = Timedate_AJD[0];forstart<=forend;forstart=t_end)	//All about overall time frame
			//Establish current timeframe
			if(timeframe == 0)	//If we are in the first timeframe of intrest
				t_start = TimeDate_AJD[0]
				
				t_end = t_start+Time_Extract	//established first timeframe
			else
			endif
				//Find points for point start and point end
				//Because we are missing points in the first timeframe we have to do something a little different
				if(timeframe==0)
					p_start=0 
					p_end = binarysearch(TimeDate_AJD, t_end)
				else
					p_start = binarysearch(TimeDate_AJD, t_start)//+1
//					string timecheckpstart = secs2Time(t_start,3)
					p_end = binarysearch(TimeDate_AJD, t_end)
//					string timecheckpend = secs2Time(t_end,3)
				endif
				
				//Test to see if there is a massive time skip
				variable tdiff = TimeDate_AJD[p_end] - TimeDate_AJD[p_start]
				variable loopEr
				if(tdiff == 0)
					loopEr+=1	//set this equal to more than 1 
				elseif(tdiff !=0)
					loopEr=0	//rset back to zero 
				endif
				//if tdiff == zero then we might have a change to repeat the loop more than we want, continue the loop in this case
				//Running into a problem where we have more than 1 of these tdiffs so we still get stuck in this loop. 
				if(tdiff == 0)
					if(LoopEr>=2) //If we have ran into a second loop; don't add on to the avg wave 
						if(savevar==0)
							t_start = t_end
							t_end = t_start+Time_Extract
							string checktstart = secs2Time(t_start,3)
							string checktend = secs2Time(t_end,3)
							timeframe++	
							continue
						elseif(savevar==1)
							t_start = t_end
							t_end = t_start+Time_Extract
							checktstart = secs2Time(t_start,3)
							checktend = secs2Time(t_end,3)
							timeframe++	
							continue
						endif
					elseif(LoopEr<2) //If this is our first loop
						if(savevar==0)
							redimension/N=(j) Avg_BCcT
							WaveStats/Q/R=[p_start,p_end] BCcT
							Avg_BCcT[k] = V_Avg
							redimension/N=(j) Avg_DT
							Avg_DT[k] = (TimeDate_AJD[p_start] + TimeDate_AJD[p_end])/2
							t_start = t_end
							t_end = t_start+Time_Extract
							checktstart = secs2Time(t_start,3)
							checktend = secs2Time(t_end,3)
							timeframe++	
							j++
							k++
							continue
						elseif(savevar==1)
							redimension/N=(j) Avg_OptDiam
							WaveStats/Q/R=[p_start,p_end] OptDiam
							Avg_OptDiam[k] = V_Avg
							redimension/N=(j) Avg_DT
							Avg_DT[k] = (TimeDate_AJD[p_start] + TimeDate_AJD[p_end])/2
							t_start = t_end
							t_end = t_start+Time_Extract
							checktstart = secs2Time(t_start,3)
							checktend = secs2Time(t_end,3)
							timeframe++	
							j++
							k++
							continue
						endif
					endif
						
				endif
				
				//Get stats from range of points to apply to waves
				
				if(j>1258)
					//stop here
					print ""
				endif
			
				//Average BC_coatingThickness
				if(savevar==0)
					if(tdiff < (3*Time_Extract))
						redimension/N=(j) Avg_BCcT
						WaveStats/Q/R=[p_start,p_end] BCcT
						Avg_BCcT[k] = V_Avg
						redimension/N=(j) Avg_DT
						Avg_DT[k] = (TimeDate_AJD[p_start] + TimeDate_AJD[p_end])/2
					elseif(tdiff>(3*Time_Extract))// We have a massive jump
						redimension/N=(j) Avg_BCcT
						WaveStats/Q/R=[p_start,p_end] BCcT
						Avg_BCcT[k] = V_Avg
						redimension/N=(j) Avg_DT
						Avg_DT[k] = TimeDate_AJD[p_end]
					endif
						
				//Average Optical Paritcle Diameter from LEO-fits
				elseif(savevar==1)
					if(tdiff < (3*Time_Extract))
						redimension/N=(j) Avg_OptDiam
						WaveStats/Q/R=[p_start,p_end] OptDiam
						Avg_OptDiam[k] = V_Avg
						redimension/N=(j) Avg_DT
						Avg_DT[k] = (TimeDate_AJD[p_start] + TimeDate_AJD[p_end])/2
					elseif(tdiff>(3*Time_Extract))
						redimension/N=(j) Avg_OptDiam
						WaveStats/Q/R=[p_start,p_end] OptDiam
						Avg_OptDiam[k] = V_Avg
						redimension/N=(j) Avg_DT
						Avg_DT[k] = TimeDate_AJD[p_end]
					endif
					
				//'Average' Datetime	
//				elseif(savevar==2)
//					if(tdiff > (2*Time_Extract))
//						redimension/N=(j) Avg_DT
//						Avg_DT[k] = (TimeDate_AJD[p_start] + TimeDate_AJD[p_end])/2
//					endif
				endif
////				//'Average' SampleVolume
//				redimension/N=(j) Avg_SampleVolume
//				Avg_SampleVolume[k] = (SampleVolume_AJD[p_start] + SampleVolume_AJD[p_end])/2
//				

				
				
				//Update start and end times as well as the timeframe we are in
				t_start = t_end
				t_end = t_start+Time_Extract
				checktstart = secs2Time(t_start,3)
				checktend = secs2Time(t_end,3)
				timeframe++	
				j++
				k++
	Endfor
	
	
//	//Create mass conc
//	Duplicate/O Avg_SampleVolume, Avg_MassConc_BC
//	Avg_MassConc_BC = (((pi/6)*((Avg_BBLG_BCdiam*1E-9)^3)*1800)*1E9)/Avg_SampleVolume		//ug/m3
//	
	
	if(savevar==0)
		killwaves Avg_OptDiam
		killwaves BCcT
		killwaves TimeDate_AJD
	elseif(savevar==1)
		killwaves Avg_BCcT
		killwaves TimeDate_AJD
		killwaves OptDiam
	endif
	
	

	setdatafolder root:
	
	//End Massive ForLoop
	

End



Function quickconcfix(divideby, p1,p2)
	
	variable divideby
	variable p1,p2
	
	string wlist = wavelist("*conc*",";", "TEXT:0")
	
	variable nwaves = itemsInList(wlist,";")
	variable i 
	
	for(i=0;i<nwaves;i++)
		wave tempwave = $stringfromList(i,wlist,";")
		tempwave[p1,p2]/=divideby
	
	endfor

End






//AJD 10/22/2024 
//Idea: For a given DF establish all of the non-text waves in the DF through the generation of a list (useful to call within functions
Function/S AJD_EstablishNonTextWaveListinDF(DF, wavelist_string)

	string wavelist_string, DF
	
	wavelist_string = wavelist("*", ";", "TEXT:0")
	
	return wavelist_string
	
End




Function AJD_Get_Mixing_State_Parameters(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			Mixing_State_Parameters_1()
		case 2:
			break
		endswitch
end





// Inspiration from table 2 in:
// 3.	Zeng, L., Tan, T., Zhao, G., Du, Z., Hu, S., Shang, D., & Hu, M. (2024).
//Overestimation of black carbon light absorption due to mixing state heterogeneity. 
//npj Climate and Atmospheric Science, 7(1), 2. (see also https://doi.org/10.5194/acp-21-18055-2021)


Function Mixing_State_Parameters_1()

	doalert/T="Warning about Mixing State Index" 1, "This function will not work unless 'Time Average Extracted Waves' was clicked before it. This is regardless if you are running it for the first time or any times beyond that. If you click 'Yes' this means you want to proceed."
	if(v_Flag==1)
	elseif(v_flag==2)
		abort "Time Average Extracted waves not prepared. Aborting."
	Endif

	setdatafolder root:AJD_DF:
	DFREF Main_DF = GetdatafolderDFR()
	Setdatafolder root:AJD_DF:Output:
	DFREF Output_DF = getdatafolderDFR()
	
	
	setdatafolder Main_DF
	
	wave Avg_BBLG_BCdiam, Avg_OptDiamAll, Avg_BCcoatingThickness, Avg_SCLG_BCvolumeFraction, Avg_MassConc_BC, Avg_SampleVolume, Avg_MassConc_Total, Avg_TimeDate__Midpoint
	

	variable npnts = numpnts(Avg_BBLG_BCdiam)
	
	make/o/n=(npnts)/d p_i_bc //Mass portion of BC for each BC-containing particles i, where m_i_BC and m_i_total stand for BC and overall particle mass, respectively. (See below after Calcs header)
	make/o/n=(npnts)/d mBC //mBC and mtotal stand for BC and total mass in the population, respectively
	make/o/n=(npnts)/d mTotal
	make/o/n=(npnts)/d pBC //Mass portion of BC for all BC-containing particles in the population
	make/o/n=(npnts)/d Hi //The mixing entropy of each single particle i
	make/o/n=(npnts)/d Ha	//The average mixing entropy of the population
	make/o/n=(npnts)/d Hy	//The population bulk mixing entropy
	make/o/n=(npnts)/d Da	//The average particle species diversity parameter (single particle level)
	make/o/n=(npnts)/d Dy	//The bulk population species diversity parameter (population level)
	make/o/n=(npnts)/d Mix_Idx_X	//The dispersion of BC particle mixing state
	make/o/n=(npnts)/d MR //Mass ratio of non-BC coating material to BC in the populaiton of BC-containing aerosol
	make/o/n=(npnts)/d p_i //The mass portion of particle i to total BC-containing aerosols 

	
	//variables
	variable Rho_m = 1500 // Density in (kg/m^3)	//from Zhao et al. 2021 estimation
	variable Rho_BC = 1800 //Density in (kg/m^3)
	variable mBC_var, mTotal_Var, Ha_Var, Hy_var
	
	
	//Calcs - nontimelooped
	
		make/o/n=(npnts)/d m_i_bc = (((pi/6)*((Avg_BBLG_BCdiam*1E-9)^3)*rho_BC)*1E9) //In ug
		// Calc before mass CONC was implimented (((pi/6)*((Avg_BBLG_BCdiam*1E-9)^3)*rho_BC)*1E18)	//Mass of the BC core of the BC-contianing particle
		note/K m_i_BC, "This is labeled m\Bi\M,BC (m_i_BC) but this refers to a definite mass, not a mass concentration like the calcs suggest from the paper. Overall following these papers were confusing. See 'Avg_MassConc_BC' and 'Avg_MassConc_Total' for more info."
	
	
		make/o/n=(npnts)/d m_i_LEO = (((pi/6)*(Avg_OptDiamAll*1E-9)^3*rho_m)*1E9)// Mass of the entire LEO particle (assuming purly scattering) in ug
		make/o/n=(npnts)/d m_i_LEO_Takeaway = (pi/6)*((Avg_BBLG_BCdiam*1E-9)^3)*rho_m *1E9 //Mass (ug) of the inner core to take away from the BC diamter and the assumed particle density
		make/o/n=(npnts)/d m_i_total = (m_i_LEO-m_i_LEO_takeaway)+m_i_BC	//Particle mass from optical diamter - mass of the leo particles inner core that matches the diamter of the BC core + mass of the BC core == Mass of the BC-containing particle
		note/K m_i_total, "Just like in m\Bi\M,BC this refers to a definitive mass, not a mass concentration."
	
	
		Duplicate/O Avg_SampleVolume, Avg_MassConc_Total
		Avg_MassConc_Total = m_i_total/Avg_SampleVolume //ug/m3
	
		Note/K Avg_MassConc_BC, "This is what the papers label as m\Bi\M,BC, but here I just call it Mass Concentration because that is what the paper says it should be."
		note/K Avg_MassConc_Total, "This is what the papers label as m\Bi\M, but here I just call it Mass Concentration because that is what the paper says it should be."

		p_i_BC = Avg_MassConc_BC/Avg_MassConc_Total
	//	p_i_bc = m_i_bc/m_i_total	//Mass portion of BC for each BC-Containing Particle			//This is before I moved to mass concentration space like the paper wants
	
	
//	Important note as I think about this: although the paper says mtot = SUM(i,N)mi this is just a way of saying find the 'particle' that represents all of the particles from a certain time frame
//	Because I am already averaging the time waves this is effectivly accomplished, and the 'SUM' has already been performed. I am summing a sum here. 
		mBC =Avg_MassConc_BC
//		mBC = mBC_var
		mTotal = Avg_MassConc_Total
//	gere	mTotal_var = sumwnans(Avg_MassConc_Total)	// The total BC-containing aerosol mass concentration
		pBC = mBC/mtotal //Mass portion of BC fora ll BC-containing particles in the population
		
		
	//	wave Hi = Hi_calc(p_i_BC)
		Hi = -(p_i_bc * (ln(p_i_bc)) + (1-p_i_bc) * (ln(1-p_i_bc)))
	
	//Initiate Time Looping here
	variable timelooper 
	for(timelooper=0;timelooper<npnts;timelooper++)
	//Calcs - timelooped
	

		//MR calc
		MR[timelooper] = (mTotal[timelooper]-mBC[timelooper])/mBC[timelooper]
	
		//pi calc = mi (mass portion of particle i -> which we get in Avg_MassConc_Total) / mtot (to total BC-containing aerosols) -> confused on this
		p_i[timelooper] = Avg_MassConc_Total[timelooper]/mTotal_var
	
		//Ha loop below where Ha = SUM(p_i_bc * Hi)	//Problem with this; look more into lit after L meeting. 
//		variable i 
//		Ha_Var = 0
//		Ha_Var = multiply2wwnans(p_i, Hi)
		Ha[timelooper] = p_i[timelooper]*Hi[timelooper]
	
		Hy[timelooper] = -(pBC[timelooper]*(ln(pBC[timelooper]))+(1-pBC[timelooper])*(ln(1-pBC[timelooper])))	//weird on table 2 of Zeng so using equation 7 of Zhao)
//		Hy_var = Hy[0]
	
		Da[timelooper] = e^Ha[timelooper]	
	
		Dy[timelooper] = e^Hy[timelooper]
	
		Mix_Idx_X[timelooper] = (Da[timelooper]-1)/(Dy[timelooper]-1)
	
	Endfor
	
	
	
	//Move Waves to output folder
	variable numstr_waves, str_i
	string output_list = wavelist("Avg*",";","Text:0")
	output_list += wavelist("Da",";","Text:0")
	output_list += wavelist("Dy",";","Text:0")
	output_list += wavelist("H*",";","Text:0")
	output_list += wavelist("m*",";","Text:0")
	output_list += wavelist("p*",";","Text:0")
	numstr_waves = ItemsInList(Output_list, ";")
	
	for(str_i=0;str_i<numstr_waves;str_i++)
		wave tempwave = $stringfromList(str_i,Output_list)
		string tempwave_name = nameofwave(tempwave)
		duplicate/O tempwave, Output_DF:$tempwave_name
	Endfor
	

	//Kill waves in original folder
	for(str_i=0;str_i<numstr_waves;str_i++)
		wave tempwave = $stringfromList(str_i,Output_list)
		string tempwave_name2kill = nameofwave(tempwave)
		killwaves $tempwave_name2kill
	Endfor
	
	setdatafolder output_DF	
	wave Avg_TimeDate__Midpoint, MR,Da,Dy,Mix_Idx_X
	edit/N=Mixing_State_Waves
	appendtotable  Avg_TimeDate__Midpoint, MR,Da,Dy,Mix_Idx_X
	modifytable format(Avg_TimeDate__Midpoint)=8
End



//for calcs I need:
//Mass BC core -> From SP2 
// Mass of BC-containing particle -> not directly provided; estimate from coating volume, chemical composition and density for each species.
//As a test I will assume all organic aerosol with a density of 1.2 g/cm3
//So a coating calc will go something like: 
// pi/6*dp^3*density -> convertion to fg 
// particle mass - bc core mass = coating mass

Function/Wave Hi_calc(p_i_BC)	//Performs Mixing entropy of particle i (Hi) through -(p_i_bc * (ln(p_i_bc)) + (1-p_i_bc) * (ln(1-p_i_bc)))
	wave p_i_BC
	variable npnts = dimsize(p_i_BC,0)
	variable i, tempval, v1, v2, v3, v4
	make/o/d/n=(npnts) tempwave
	for(i=0;i<npnts;i++)
		v1 = p_i_bc[i]
		v2 = ln(p_i_bc[i])
		v3 = 1-p_i_bc[i]
		v4 = ln((1-p_i_bc[i]))	//Cannot be a negative number -> limited on my messed up data rn
		tempval = -(v1 * v2) + (v3 * v4)
		tempwave[i] = tempval
	Endfor
	return tempwave
End


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////SP2 MASTER EXTRACT CODE//////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////



Function SP2MasterExtract_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Have you ensured that the SP2 toolkit has completed postprocessing of the inputted data?"
			if(V_flag==1)
			elseif(V_Flag==2)
				abort "Postprocessing not initiated. Aborting procedure."
			endif
//			string pathname = ""
//			prompt pathname, "What is the temporary symbolic pathname you want to use?"
//			doprompt "Please enter the following information", pathname
			SP2MasterExtraction_Main()
		case 2:
			break
		endswitch
end




Function SP2MasterExtraction_Main()

	//Timer
	StopAllTimers()
	variable TimeStart = startMSTimer

	
	//Keep inital DF
	DFREF StartDF = getdatafolderDFR()

	//Find all of the DFs with data that we want to extract
	String DFSeeker_Raw ="*_SP2"; String DFSeeker_INI = "INI"; String DFSeeker_PBP = "*_SP2_PBP"
	String DFSeeker_ConcTser = "ConcTser";	String DFSeeker_LEOBase = "LEO"; String DFSeeker_LEOMain = "Main"
	String DFSeeker_LEOTrace = "TraceFit"; String DFSeeker_SDTSer = "SizeDistTser";	String List_DFREF = ""
	List_DFREF = SP2FindImportantDFs()
	
	//Establish Wavelists of Relevent Waves to extract
	String WL_Raw = "TimeDate;SampleInterval;SampleVolume;YAGPower;SampleFlowRate"
	String WL_INI = "OneofEveryLoaded;OneofEverySaved"
	String WL_PBP = "BHBL_BCdiam;BHBL_BClogdiam;BHBL_BCmass;BHBL_BCmassdistr;BHBL_BCmassdistr_err;BHBL_BCtotalmass;BHBL_BCtotalmassconc;BHBL_LogNormFitDiamMidpt;BHBL_LogNormFitMassBCconc;BHBL_logNormfitMassCoef;BHBL_LogNormFitMassDistr;BHBL_LogNormFitNumbBCconc;BHBL_LogNormFitNumbCoef;BHBL_LogNormFitNumbDistr;BHBL_saturated"
	String WL_ConcTSer = "BHBL_AvgMassDp;BHBL_MassConc;BHBL_MassMeanDp;BHBL_NumbConc;BHBL_NumbMeanDp;FracThicklyCoated;TimeCtr;TimeBdr"
	String WL_SDTSer = "BHBL_Diambdr;BHBL_DiamCutLow;BHBL_DiamMidpt;BHBL_LognormDiamBdr;BHBL_LognormDiamMidpt;BHBL_LognormMassBlwCt;BHBL_LognormMassCoef;BHBL_LognormMassConc;BHBL_LognormMassDistr;BHBL_LognormMassGmeanDp;BHBL_LognormNumbBlwCt;BHBL_LognormNumbCoef;BHBL_LognormNumbConc;BHBL_LognormNumbDistr;BHBL_LognormNumbGmeanDp;BHBL_MassDistr;BHBL_Numb;BHBL_NumbDistr"
	String WL_LEOMain = "SCLG_BCcoatingThickness;SCLG_BCvolumeFraction;SCLG_DelayTimeHist;SCLG_OptDistrDlogDp"
	String WL_LEOTrace = "SCLG_FitError;SCLG_FitOffset;SCLG_FitPeakHtAll;SCLG_FitPeakHtScatt;SCLG_OptDiamAll;SCLG_saturated"

	//Establish Paths that will hold exported data
	String Path2INI = "Path_INI"; String Path2PBP = "Path_PBP"; String Path2ConcTser = "Path_ConcTser"; String Path2LEO = "Path_LEO"; String Path2SDTSer = "Path_SDTSer"; String TempPath = "Test"
	Path2INI = SavePath(Path2INI,"Select Raw/INI folder")
	Path2PBP = SavePath(Path2PBP,"Select PBP folder")
	Path2ConcTser = SavePath(Path2ConcTser,"Select Concentration Time Series folder")
	Path2SDTSer = SavePath(Path2SDTSer,"Select Size Distribution Time Series folder")
	Path2LEO = SavePath(Path2LEO,"Select LEO folder")
	
	//Gather waves and export them to established paths
	setdatafolder root:
		//Raw/INI
	Setdatafolder stringfromList(0,List_DFREF,";")
		ExportBinaryList(WL_Raw,Path2INI)
	Setdatafolder stringfromList(1,List_DFREF,";")
		ExportBinaryList(WL_INI,Path2INI)
		//PBP
	Setdatafolder stringfromList(2,List_DFREF,";")
		ExportBinaryList(WL_PBP,Path2PBP)
		//ConcTSer
	Setdatafolder stringfromList(3,List_DFREF,";")
		ExportBinaryList(WL_ConcTSer,Path2ConcTser)
		//SDTser
	Setdatafolder stringfromList(4,List_DFREF,";")
		ExportBinaryList(WL_SDTSer,Path2SDTSer)
		//LEO
	Setdatafolder stringfromList(6,List_DFREF,";")
		ExportBinaryList(WL_LEOMain,Path2LEO)
	Setdatafolder stringfromList(7,List_DFREF,";")
		ExportBinaryList(WL_LEOTrace,Path2LEO)
	
	
	//WrapUp
	Setdatafolder StartDF
	KillPath/Z Path2INI;KillPath/Z Path2PBP;KillPath/Z Path2ConcTser;KillPath/Z Path2SDTSer;KillPath/Z Path2LEO
	variable TimeStop = StopmsTimer(0)
	TimeStop/=1E6
	DoAlert/T="Data Export Complete" 0, "The Exporation of Relevent SP2 Data has been completed in "+num2str(TimeStop) + " seconds."

End




////////////////////////////////////////////////////////////////////////
////////////SP2 Master Extraction Supporting Code///////////////////////
////////////////////////////////////////////////////////////////////////

Function/S SP2FindImportantDFs()

	DFREF StartDF = getdataFolderDFR()

	setdatafolder root:

//Establish DF Hierarchy help
	String DFSeeker_Raw ="*_SP2"; String DFSeeker_INI = "INI"; String DFSeeker_PBP = "*_SP2_PBP"; String DFSeeker_ConcTser = "ConcTser"; String DFSeeker_LEOBase = "LEO"; String DFSeeker_LEOMain = "Main" ; String DFSeeker_LEOTrace = "TraceFit"; String DFSeeker_SDTSer = "SizeDistTser"
	Variable NumbDF_Root; Variable NumbDF_PBP; Variable NumbDF_LEO; variable i 
	String CurrName = ""
	DFREF DF_Root = getdatafolderDFR();DFREF SP2DF_Raw;DFREF SP2DF_INI;DFREF SP2DF_PBP;DFREF SP2DF_ConcTSer;DFREF SP2DF_LEOBase;DFREF SP2DF_LEOMain;DFREF SP2DF_LEOTrace; DFREF SP2SD_SDTser
	
	//Find all DFs and give them DFREFs
	
	//Raw DF first
		//Start with the Raw DF as we need a subfolder
	SP2DF_Raw = FindDFinLoop(DF_Root,DFSeeker_Raw)
	setdatafolder SP2DF_Raw	//To allow us to find the subfolder 'INI'
	SP2DF_INI = FindDFinLoop(SP2DF_Raw,DFSeeker_INI)
	setdatafolder DF_Root
	
	//PBP folder next
	SP2DF_PBP = FindDFinLoop(DF_Root,DFSeeker_PBP)
	setdatafolder SP2DF_PBP	//The rest are subfolders of the PBP DF so set the datafolder to it
	
	//Time series - concentration and size dist
	SP2DF_ConcTSer = FindDFinLoop(SP2DF_PBP,DFSeeker_ConcTser)
//	setdatafolder SP2DF_PBP
	SP2SD_SDTser = FindDFinLoop(SP2DF_PBP,DFSeeker_SDTSer)
	
	//LEO
	setdatafolder SP2DF_PBP
	SP2DF_LEOBase = FindDFinLoop(SP2DF_PBP,DFSeeker_LEOBase)
	setdatafolder SP2DF_LEOBase
	SP2DF_LEOMain = FindDFinLoop(SP2DF_LEOBase,DFSeeker_LEOMain)
	//setdatafolder SP2DF_LEOBase
	SP2DF_LEOTrace = FindDFinLoop(SP2DF_LEOBase,DFSeeker_LEOTrace)
	
	//make string
	String List_DF = ""
	List_DF += getdatafolder(1,SP2DF_Raw)+";"
	List_DF += getdatafolder(1,SP2DF_INI)+";"
	List_DF += getdatafolder(1,SP2DF_PBP)+";"
	List_DF += getdatafolder(1,SP2DF_ConcTSer)+";"
	List_DF += getdatafolder(1,SP2SD_SDTser)+";"
	List_DF += getdatafolder(1,SP2DF_LEOBase)+";"
	List_DF += getdatafolder(1,SP2DF_LEOMain)+";"
	List_DF += getdatafolder(1,SP2DF_LEOTrace)+";"
	
	setdatafolder StartDF
	
	return List_DF
	
	

End


Function/DF FindDFinLoop(BaseDF,DFFind)

	//Establish Function Parameters
	DFREF BaseDF; String DFFind
	
	
	//Establish Local Parameters
	variable i; variable NumbDF_Base; string Currname = "";
	
	//Label all relevent DFs seen from root
	NumbDF_Base = CountObjectsDFR(BaseDF,4)
	//Loop through and extract relevent DF path
	for(i=0;i<NumbDF_Base;i++)
		CurrName = GetIndexedObjNameDFR(BaseDF, 4, i)
		if(stringmatch(CurrName, DFFind)==1) //If we detect the Raw DF 
			SetDatafolder $Currname
			DFREF ExtractedDFREF = getdatafolderDFR()
			//Return to inital DF
			Setdatafolder BaseDF
			Return ExtractedDFREF
			
		elseif(stringmatch(CurrName, DFFind)==0)	//If we do not detect the Raw DF
			//Do nothing
		endif
	endfor
	
	//Return to inital DF
	Setdatafolder BaseDF


end

Function/S SavePath(PathName, FolderHelp)
	//Establish Function Parameters
	String PathName
	String FolderHelp

	NewPath/Q/O/M=FolderHelp $PathName
	if(V_Flag==0)	//If successful
		pathinfo $PathName
		return PathName
	else	//If not sucessful
		Abort "Error in Path Creation. Aborting."
	Endif
End

Function ExportBinaryList(CaptureList,SymbolicPath)

	//Establish Parameters
	string CaptureList; String SymbolicPath
	
	//Check to see if entry is blank
	if(stringmatch(CaptureList,"")==1)
		string wList = wavelist("*",";","TEXT:0")
		variable nWaves = itemsinlist(wList, ";")
		variable i 
		string pathname = "TEMP_ExportBinary"
	endif
	//Save the waves (through the wavelist DF_WaveList)
	save/O/B/C/M="\r\m"/P=$SymbolicPath CaptureList //No 'as name' here due to Binary Nature of Saving
	//Kill the current path to prep 
//	Killpath/Z $CurrPath
//	
	
End










































Function AJD_Export_Waves(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Have you ensured that the waves have been generated?"
			if(V_flag==1)
			elseif(V_Flag==2)
				abort "Waves not generated. Aborting procedure."
			endif
			string pathname = ""
			prompt pathname, "What is the temporary symbolic pathname you want to use?"
			doprompt "Please enter the following information", pathname
			AJD_OutPut_Export(pathname)
		case 2:
			break
		endswitch
end

Function AJD_OutPut_Export(pathname)

	string pathname

	//Establish All Relevent Data Folders
	
	
	//Establish AJD_DF
	setdatafolder root:
	If(dataFolderExists("AJD_DF")==1)	//it does exist
		setdatafolder AJD_DF
		DFREF Main_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_DF")==0)	//it does not exist
		newdataFolder/S AJD_DF
		DFREF Main_DF = getdatafolderDFR()
	endif
	
	//Establish Output Folder
	setdatafolder Main_DF
	If(dataFolderExists("Output")==1)	//it does exist
		setdatafolder Output
		DFREF Output_DF = getdatafolderDFR()
	elseif(datafolderexists("Output")==0)	//it does not exist
		newdatafolder/S Output
		DFREF Output_DF = getdatafolderDFR()
	endif
	
	//Establish PBP, ConcTser, LEO, and SizeDistTser Folders
	setdatafolder Output_DF
	If(dataFolderExists("AJD_PBP")==1)	//it does exist
		setdatafolder AJD_PBP
		DFREF AJD_PBP_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_PBP")==0)	//it does not exist
		newdatafolder/S AJD_PBP
		DFREF AJD_PBP_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
	If(dataFolderExists("AJD_LEO")==1)	//it does exist
		setdatafolder AJD_LEO
		DFREF AJD_LEO_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_LEO")==0)	//it does not exist
		newdatafolder/S AJD_LEO
		DFREF AJD_LEO_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
		If(dataFolderExists("AJD_SizeDistTser")==1)	//it does exist
		setdatafolder AJD_SizeDistTser
		DFREF AJD_SizeDistTser_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_SizeDistTser")==0)	//it does not exist
		newdatafolder/S AJD_SizeDistTser
		DFREF AJD_SizeDistTser_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
		If(dataFolderExists("AJD_Raw")==1)	//it does exist
		setdatafolder AJD_Raw
		DFREF AJD_Raw_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_Raw")==0)	//it does not exist
		newdatafolder/S AJD_Raw
		DFREF AJD_Raw_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
		If(dataFolderExists("AJD_ConcTser")==1)	//it does exist
		setdatafolder AJD_ConcTser
		DFREF AJD_ConcTser_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_ConcTser")==0)	//it does not exist
		newdatafolder/S AJD_ConcTser
		DFREF AJD_ConcTser_DF = getdatafolderDFR()
	endif
	
		Setdatafolder Main_DF //Go to 'AJD_DF' to create a 'code fixing' folder
	If(dataFolderExists("AJD_CodeFixing")==1)	//it does exist
		setdatafolder AJD_CodeFixing
		DFREF AJD_CodeFixing_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_CodeFixing")==0)	//it does not exist
		newdatafolder/S AJD_CodeFixing
		DFREF AJD_CodeFixing_DF = getdatafolderDFR()
	endif
	
	//Establish a for loop that will take care of all of the waves that need to be saved as Binary (assuming all due to size of some of the SP2 waves)
	setdatafolder Output_DF
	
	variable nDF = countObjectsDFR(Output_DF,4)
	variable nwaves,i,j,k,npnts,timeframe //Establish here and use later.
	string DF_WaveList, DF_name
	DF_WaveList = ""
	
	
	//Big for loop starts here
	for(i=0;i<nDF;i++) //For all of the datafolders in output
		setdatafolder Output_DF
		//First establish all of the nessesary waves in the folder
		string DF_Current = GetindexedObjNameDFR(Output_DF,4,i)
		setdatafolder DF_Current
		DF_name = DF_Current
		nwaves = countObjects(DF_Current,1)
		DF_WaveList = AJD_EstablishNonTextWaveListinDF(DF_Current,DF_WaveList)
		
		//Inform the user what data is being saved
		Doalert/T="Data Save Information" 0, "The Following Data will be saved to the file selected in the next Step.\r All waves in data folder "+DF_Name
		
		//Establish folder to save waves
		string CurrPath = AJD_SavePath(pathname)
		//Save the waves (through the wavelist DF_WaveList)
		save/O/B/C/M="\r\m"/P=$pathname DF_WaveList //No 'as name' here due to Binary Nature of Saving
		//Kill the current path to prep 
		Killpath/Z $CurrPath
	Endfor
	
	//Include the CodeFixing File
	setdatafolder AJD_CodeFixing_DF
	DF_Current = getdataFolder(1, AJD_CodeFixing_DF)
	DF_name = DF_Current
	Doalert/T="Data Save Information" 0, "The Following Data will be saved to the file selected in the next Step.\r All waves in data folder "+DF_Name
	DF_WaveList = ""
	DF_WaveList = AJD_EstablishNonTextWaveListinDF(DF_Current,DF_WaveList)
	CurrPath = AJD_SavePath(pathname)
	save/O/B/C/M="\r\m"/P=$pathname DF_WaveList
	killpath/Z $CurrPath

	setdatafolder root: 
	
End


Function AJD_TAandExportPBP_Waves(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
//			doalert/T="Order of Operation" 2, "Have you ensured that the waves have been generated?"
//			if(V_flag==1)
//			elseif(V_Flag==2)
//				abort "Waves not generated. Aborting procedure."
//			endif
			variable Time_Extract
			prompt Time_Extract, "What time that you want to average too?"
			doprompt "Please enter the following information", Time_Extract
			TAandExportPBPWaves(Time_Extract)
		case 2:
			break
		endswitch
end

Function TAandExportPBPWaves(Time_Extract)

	//Establish parameters
	variable Time_Extract

	string savedDF = ""
	string Base_DF_String = AJD_SP2_getFolder(startingDF=savedDF, type="raw", includeAll=1)
	setdatafolder Base_DF_String
	DFREF Base_DF = GetdatafolderDFR()
	
	//Get INI root:'20240130x002_SP2':INI:
	string INI_String = Base_DF_String + "INI"
	setdatafolder INI_String
	DFREF INI_DF = GetdatafolderDFR()


//Establish AJD_DF
	setdatafolder root:
	If(dataFolderExists("AJD_DF")==1)	//it does exist
		setdatafolder AJD_DF
		DFREF Main_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_DF")==0)	//it does not exist
		newdataFolder/S AJD_DF
		DFREF Main_DF = getdatafolderDFR()
	endif
	
	//Establish Output Folder
	setdatafolder Main_DF
	If(dataFolderExists("Output")==1)	//it does exist
		setdatafolder Output
		DFREF Output_DF = getdatafolderDFR()
	elseif(datafolderexists("Output")==0)	//it does not exist
		newdatafolder/S Output
		DFREF Output_DF = getdatafolderDFR()
	endif
	
	//Establish PBP, ConcTser, LEO, and SizeDistTser Folders
	setdatafolder Output_DF
	If(dataFolderExists("AJD_PBP")==1)	//it does exist
		setdatafolder AJD_PBP
		DFREF AJD_PBP_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_PBP")==0)	//it does not exist
		newdatafolder/S AJD_PBP
		DFREF AJD_PBP_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
	If(dataFolderExists("AJD_LEO")==1)	//it does exist
		setdatafolder AJD_LEO
		DFREF AJD_LEO_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_LEO")==0)	//it does not exist
		newdatafolder/S AJD_LEO
		DFREF AJD_LEO_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
		If(dataFolderExists("AJD_SizeDistTser")==1)	//it does exist
		setdatafolder AJD_SizeDistTser
		DFREF AJD_SizeDistTser_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_SizeDistTser")==0)	//it does not exist
		newdatafolder/S AJD_SizeDistTser
		DFREF AJD_SizeDistTser_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
		If(dataFolderExists("AJD_Raw")==1)	//it does exist
		setdatafolder AJD_Raw
		DFREF AJD_Raw_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_Raw")==0)	//it does not exist
		newdatafolder/S AJD_Raw
		DFREF AJD_Raw_DF = getdatafolderDFR()
	endif
	
	setdatafolder Output_DF
		If(dataFolderExists("AJD_ConcTser")==1)	//it does exist
		setdatafolder AJD_ConcTser
		DFREF AJD_ConcTser_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_ConcTser")==0)	//it does not exist
		newdatafolder/S AJD_ConcTser
		DFREF AJD_ConcTser_DF = getdatafolderDFR()
	endif
	
		Setdatafolder Main_DF //Go to 'AJD_DF' to create a 'code fixing' folder
	If(dataFolderExists("AJD_CodeFixing")==1)	//it does exist
		setdatafolder AJD_CodeFixing
		DFREF AJD_CodeFixing_DF = getdatafolderDFR()
	elseif(datafolderexists("AJD_CodeFixing")==0)	//it does not exist
		newdatafolder/S AJD_CodeFixing
		DFREF AJD_CodeFixing_DF = getdatafolderDFR()
	endif
	
	//Get the time wave
	Setdatafolder Base_DF
	Wave TimeDate
	variable nDims = dimsize(TimeDate,0)
	//Go to the PBP folder
	setdatafolder AJD_PBP_DF
	//Create a wavelist of all time averaged folders (Using MINROWS to help)
	string Waves2TimeAverage = wavelist("*",";","MINROWS:10000")
	variable nWaves = itemsinList(Waves2TimeAverage,";")
	
	variable i
	
	for(i=0;i<nWaves;i++)
		wave Temp_SigWave = $stringfromlist(i,Waves2TimeAverage,";")
		TimeAvgWave(Time_Extract, Temp_Sigwave,TimeDate)
	endfor
	
	//Establish Parameters
	String DateStr = "*"+secs2Date(TimeDate[0],-2,"_")+"*"
	string Waves2Export = wavelist(DateStr,";","TEXT:0")
	
	//Establish code specifc variables and strings
	variable nWaves2Export = itemsinlist(Waves2Export, ";")
	string pathname = "TEMP_ExportBinary"
	
	//Establish folder to save waves
	string CurrPath = AJD_SavePath(pathname)
	//Save the waves (through the wavelist DF_WaveList)
	save/O/B/C/M="\r\m"/P=$pathname Waves2Export //No 'as name' here due to Binary Nature of Saving
	//Kill the current path to prep 
	Killpath/Z $CurrPath
End



//10/22/2024
//Idea: Function to establish path for the purposes of saving waves
Function/S AJD_SavePath(AJD_pname)

	string AJD_pname 

	NewPath/Q/O/M="Select Relevant Folder." $AJD_pname
	if(V_Flag==0)	//If successful
		pathinfo $AJD_pname
		return AJD_pname
		
	
	else	//If not sucessful
		Abort "Error in Path Creation. Aborting."
	
	
	Endif

End


Function AJD_ImportandTAPBP_Waves(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Ensure that you have ran the 'Import SP2 Waves' code before this."
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			variable Time_Extract 
			prompt Time_Extract, "What is the averaging time in seconds that has been used to pervious time average the PBP waves?"
			doprompt "Please enter the following information", Time_Extract
			AJD_ImportandTAPBP_SP2_Waves(Time_Extract)
		case 2:
			break
		endswitch
end


Function AJD_ImportandTAPBP_SP2_Waves(Time_Extract)

	//Establish Parameters
	Variable Time_Extract

	//Remember StartingDF to set back to at end of code
	DFREF StartDF = GetdatafolderDFR()
	
	string GeneralFolderPath = "GeneralFolderPath",GeneralFolderList,CurrGeneralFolder
	string SubFolderPath ="SubFolderPath",SubFolderFiles
	string ChunkFolderPath="ChunkFolderPath",ChunkFolderList,CurrChunkFolder
	string WaveFolderPath="WaveFolderPath"
	string wname, fullpath2file
	string WaveFolderList, CurrWaveFolder, WaveFolderFiles, CurrentPath, SaveStartPath, CurrDFString
	variable nGeneralFolders,nSubFolders, nwaves, nChunks, nWaveFolders
	variable i,j,k,l,p,z //Indexing variables
	
	//Open Folder that contains all of the subfolders that house the Igor Binary Wave(s) (.ibw)
	GeneralFolderPath = AJD_SavePath(GeneralFolderPath)
	PathInfo $GeneralFolderPath
	String CurrPathStart = s_path //Remember where we are starting
	GeneralFolderList = indexedDir(GeneralFolderPath,-1,0)
	nGeneralFolders = itemsinlist(GeneralFolderList,";")
	
	//Set up a data folder with using the s_path string
//	CurrDFString = "Imported_SP2_Data"
	setdatafolder root:Imported_SP2_Data
	DFREF MainDF = getdatafolderDFR()
	
	//Run a for loop to get the subfolders within the General folder and then access their .ibw's
	for(i=0;i<nGeneralFolders;i++)
		//At the start of every loop reset the current path to the general folder
		PathInfo $GeneralFolderPath
		CurrentPath = CurrPathStart
		
		//and reset the datafolder to the Main one: 'Imported_SP2_Data'
		Setdatafolder MainDF
			
		//Find the SubFolder
//		CurrGeneralFolder = stringfromlist(i,GeneralFolderList)	//Access the current 'General' Folder from the list
//		variable findPBPFolder_Var = whichlistItem("PBP",GeneralFolderList,";")
//		string findPBPFolder_str = stringfromlist(findPBPFolder_Var,GeneralFolderList,";")
//		CurrentPath = s_path+findPBPFolder_str
		
		//Create a New DataFolder to put the waves in 
//		NewDataFolder/O/S $findPBPFolder_str
//		DFREF CurrPBPDF = GetDataFolderDFR()
		
		NewPath/Z/O/Q  $SubFolderPath, CurrentPath	//Make a new path to the Subfolders in the 'General' Folder
		PathInfo $SubFolderPath	//Get information about this new path
		
			//Find the wave folder in the subfolder in the general folder
			WaveFolderList = IndexedDir($SubFolderPath,-1,0)
			//Here it is possible that we will run into 'Chunk' Folders which are nessesary to create due to the amount of data that the SP2 loads, so I will need a workaround for these folders
			if(stringmatch(WaveFolderList,"*Chunk*")==1) //We detect a Chunk folder
				SaveStartPath = s_path //Save the original path to the folder that contains the chunk folder
				ChunkFolderList = WaveFolderList
				WaveFolderList = ""
				nChunks = ItemsinList(ChunkFolderList,";")	//Get how many Chunk Folders there are
				for(k=0;k<nChunks;k++)
					//Set the Data Folder back to the general DF (as it relates to this chunk)
					setdatafolder CurrGeneralDF
					s_path = SaveStartPath
					CurrChunkFolder = StringFromlist(k,ChunkFolderList)	//Get the current Chunk Folder
					CurrentPath = S_Path + CurrChunkFolder
					//Set a new datafolder to the current chunk folder
					NewDataFolder/O/S $CurrChunkFolder
					DFREF ChunkDF = GetDatafolderDFR()
					
					NewPath/Z/O/Q $ChunkFolderPath, CurrentPath
					PathInfo $ChunkFolderPath	//This puts us in the chunk folder, but now we need to go a step further into the wave folder
					string Chunkpath_str = s_path
					WaveFolderlist = IndexedDir($ChunkFolderPath,-1,0)	//Get a list of wave folders in the chunk folder
					nWaveFolders = ItemsinList(WaveFolderList,";") //Get how many wave folders do we have in the chunk folder
					CurrWaveFolder = StringfromList(k,WaveFolderlist)	//The current wave folder in the chunk folder is the string from the wavefolder list at the index k 
					for(l=0;l<nWaveFolders;l++)
						//Set the Datafolder back to the Appropriate DF (Chunk) to create the appropriate wave specific DFs
						SetDatafolder ChunkDF
						
						
						//Find new folder name that contains .ibw(s)
						CurrWaveFolder = StringFromlist(l,WaveFolderList)
						
						//Make a DF with the same name as our current WaveFolderList
						NewDatafolder/O/S $CurrWaveFolder
						
						CurrentPath = Chunkpath_str+CurrWaveFolder	
						
//						CurrentPath = s_path+CurrWaveFolder	//Update Current Path
						NewPath/Z/O/Q $WaveFolderPath, CurrentPath	//Establish a new path to the folder
						PathInfo $WaveFolderPath	//Get information about this new path
						//Now that we are in the wave folder we continue as a slightly altered normal
						WaveFolderFiles = IndexedFile($WaveFolderPath, -1, ".ibw")	//Create a list of Files in the wavefolder
						nwaves = ItemsinList(WaveFolderFiles,";")	//Get many waves are in the subfolder
						for(j=0;j<nwaves;j++)
							wname = stringfromlist(j,WaveFolderFiles,";")
							fullpath2file = s_path+wname	//Take the full path and attatch the wave name on it
							Loadwave/Q/H/W fullpath2file
						endfor	
					Endfor
				Endfor
			
			
			
			//////NEED A FIX TO ACESS OTHER SUBFOLDERS/////////////////////////////////////////
			elseif(stringmatch(WaveFolderList,"*Chunk*")==0)//We do not detect a Chunk Folder; Perform the rest of the code
				nSubFolders = itemsinlist(WaveFolderList,";")	//Indexing variable 'l'
				SaveStartPath = s_path
				for(l=0;l<nsubFolders;l++)
					//Set the data folder back to the general DF (as it relates to this chunk)
					SetDatafolder CurrGeneralDF
				
					CurrWaveFolder = stringfromlist(l,WaveFolderList)
					//Set up datafolder
					NewDataFolder/O/S $CurrWaveFolder
					
					
					CurrentPath = SaveStartPath+CurrWaveFolder
					NewPath/Z/O/Q $WaveFolderPath, CurrentPath
					PathInfo $WaveFolderPath	//Get information about this new path
						//Load the .ibw's in the CurrentWaveFolder
						WaveFolderFiles = IndexedFile($WaveFolderPath, -1, ".ibw")	//Create a list of Files in the wavefolder
						nwaves = ItemsinList(WaveFolderFiles,";")	//Get many waves are in the subfolder
						for(j=0;j<nwaves;j++)
							wname = stringfromlist(j,WaveFolderFiles,";")
							fullpath2file = s_path+wname	//Take the full path and attatch the wave name on it
							Loadwave/Q/H/W fullpath2file
						endfor	
				Endfor
			else
			Endif
		
//			Kill Temporary Path(s)
	Killpath/Z $WaveFolderPath
	Killpath/Z $SubFolderPath
		
	
	Endfor
	
	
	setdatafolder StartDF

End


Function AJD_Import_Binary_Waves_butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Save before doing this."
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
//			string pathname = ""
//			prompt pathname, "What is the pathname you want to use?"
//			doprompt "Please enter the following information", pathname
			AJD_Import_SP2_Waves()
		case 2:
			break
		endswitch
end

//10/23/24 
//Idea: Take the Binary Waves saved by the SP2 Export function and import them into their own respective data folders (Created)
Function AJD_Import_SP2_Waves()

	//Remember StartingDF to set back to at end of code
	DFREF StartDF = GetdatafolderDFR()
	
	string GeneralFolderPath = "GeneralFolderPath",GeneralFolderList,CurrGeneralFolder
	string SubFolderPath ="SubFolderPath",SubFolderFiles
	string ChunkFolderPath="ChunkFolderPath",ChunkFolderList,CurrChunkFolder
	string WaveFolderPath="WaveFolderPath"
	string wname, fullpath2file
	string WaveFolderList, CurrWaveFolder, WaveFolderFiles, CurrentPath, SaveStartPath, CurrDFString
	variable nGeneralFolders,nSubFolders, nwaves, nChunks, nWaveFolders
	variable i,j,k,l,p,z //Indexing variables
	
	//Open Folder that contains all of the subfolders that house the Igor Binary Wave(s) (.ibw)
	GeneralFolderPath = AJD_SavePath(GeneralFolderPath)
	PathInfo $GeneralFolderPath
	String CurrPathStart = s_path //Remember where we are starting
	GeneralFolderList = indexedDir(GeneralFolderPath,-1,0)
	nGeneralFolders = itemsinlist(GeneralFolderList,";")
	
	//Set up a data folder with using the s_path string
	CurrDFString = "Imported_SP2_Data"
	Newdatafolder/O/S $CurrDFString
	DFREF MainDF = getdatafolderDFR()
	
	//Run a for loop to get the subfolders within the General folder and then access their .ibw's
	for(i=0;i<nGeneralFolders;i++)
		//At the start of every loop reset the current path to the general folder
		PathInfo $GeneralFolderPath
		CurrentPath = CurrPathStart
		
		//and reset the datafolder to the Main one: 'Imported_SP2_Data'
		Setdatafolder MainDF
			
		//Find the SubFolder
		CurrGeneralFolder = stringfromlist(i,GeneralFolderList)	//Access the current 'General' Folder from the list
		CurrentPath = s_path+CurrGeneralFolder
		
		//Create a New DataFolder to put the waves in 
		NewDataFolder/O/S $CurrGeneralFolder
		DFREF CurrGeneralDF = GetDataFolderDFR()
		
		NewPath/Z/O/Q  $SubFolderPath, CurrentPath	//Make a new path to the Subfolders in the 'General' Folder
		PathInfo $SubFolderPath	//Get information about this new path
		
			//Find the wave folder in the subfolder in the general folder
			WaveFolderList = IndexedDir($SubFolderPath,-1,0)
			//Here it is possible that we will run into 'Chunk' Folders which are nessesary to create due to the amount of data that the SP2 loads, so I will need a workaround for these folders
			if(stringmatch(WaveFolderList,"*Chunk*")==1) //We detect a Chunk folder
				SaveStartPath = s_path //Save the original path to the folder that contains the chunk folder
				ChunkFolderList = WaveFolderList
				WaveFolderList = ""
				nChunks = ItemsinList(ChunkFolderList,";")	//Get how many Chunk Folders there are
				for(k=0;k<nChunks;k++)
					//Set the Data Folder back to the general DF (as it relates to this chunk)
					setdatafolder CurrGeneralDF
					s_path = SaveStartPath
					CurrChunkFolder = StringFromlist(k,ChunkFolderList)	//Get the current Chunk Folder
					CurrentPath = S_Path + CurrChunkFolder
					//Set a new datafolder to the current chunk folder
					NewDataFolder/O/S $CurrChunkFolder
					DFREF ChunkDF = GetDatafolderDFR()
					
					NewPath/Z/O/Q $ChunkFolderPath, CurrentPath
					PathInfo $ChunkFolderPath	//This puts us in the chunk folder, but now we need to go a step further into the wave folder
					string Chunkpath_str = s_path
					WaveFolderlist = IndexedDir($ChunkFolderPath,-1,0)	//Get a list of wave folders in the chunk folder
					nWaveFolders = ItemsinList(WaveFolderList,";") //Get how many wave folders do we have in the chunk folder
					CurrWaveFolder = StringfromList(k,WaveFolderlist)	//The current wave folder in the chunk folder is the string from the wavefolder list at the index k 
					for(l=0;l<nWaveFolders;l++)
						//Set the Datafolder back to the Appropriate DF (Chunk) to create the appropriate wave specific DFs
						SetDatafolder ChunkDF
						
						
						//Find new folder name that contains .ibw(s)
						CurrWaveFolder = StringFromlist(l,WaveFolderList)
						
						//Make a DF with the same name as our current WaveFolderList
						NewDatafolder/O/S $CurrWaveFolder
						
						CurrentPath = Chunkpath_str+CurrWaveFolder	
						
//						CurrentPath = s_path+CurrWaveFolder	//Update Current Path
						NewPath/Z/O/Q $WaveFolderPath, CurrentPath	//Establish a new path to the folder
						PathInfo $WaveFolderPath	//Get information about this new path
						//Now that we are in the wave folder we continue as a slightly altered normal
						WaveFolderFiles = IndexedFile($WaveFolderPath, -1, ".ibw")	//Create a list of Files in the wavefolder
						nwaves = ItemsinList(WaveFolderFiles,";")	//Get many waves are in the subfolder
						for(j=0;j<nwaves;j++)
							wname = stringfromlist(j,WaveFolderFiles,";")
							fullpath2file = s_path+wname	//Take the full path and attatch the wave name on it
							Loadwave/Q/H/W fullpath2file
						endfor	
					Endfor
				Endfor
			
			
			
			//////NEED A FIX TO ACESS OTHER SUBFOLDERS/////////////////////////////////////////
			elseif(stringmatch(WaveFolderList,"*Chunk*")==0)//We do not detect a Chunk Folder; Perform the rest of the code
				nSubFolders = itemsinlist(WaveFolderList,";")	//Indexing variable 'l'
				SaveStartPath = s_path
				for(l=0;l<nsubFolders;l++)
					//Set the data folder back to the general DF (as it relates to this chunk)
					SetDatafolder CurrGeneralDF
				
					CurrWaveFolder = stringfromlist(l,WaveFolderList)
					//Set up datafolder
					NewDataFolder/O/S $CurrWaveFolder
					
					
					CurrentPath = SaveStartPath+CurrWaveFolder
					NewPath/Z/O/Q $WaveFolderPath, CurrentPath
					PathInfo $WaveFolderPath	//Get information about this new path
						//Load the .ibw's in the CurrentWaveFolder
						WaveFolderFiles = IndexedFile($WaveFolderPath, -1, ".ibw")	//Create a list of Files in the wavefolder
						nwaves = ItemsinList(WaveFolderFiles,";")	//Get many waves are in the subfolder
						for(j=0;j<nwaves;j++)
							wname = stringfromlist(j,WaveFolderFiles,";")
							fullpath2file = s_path+wname	//Take the full path and attatch the wave name on it
							Loadwave/Q/H/W fullpath2file
						endfor	
				Endfor
			else
			Endif
		
//			Kill Temporary Path(s)
	Killpath/Z $WaveFolderPath
	Killpath/Z $SubFolderPath
		
	
	Endfor
	
	
	setdatafolder StartDF

End


Function AJD_Import_Binary_Folder_butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Save before doing this."
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
//			string pathname = ""
//			prompt pathname, "What is the pathname you want to use?"
//			doprompt "Please enter the following information", pathname
			AJD_Import_Binary_Folder()
		case 2:
			break
		endswitch
end

//10/23/24 
//Idea: Take the Binary Waves saved by the SP2 Export function and import them into their own respective data folders (Created)
Function AJD_Import_Binary_Folder()

	//Remember StartingDF to set back to at end of code
	DFREF StartDF = GetdatafolderDFR()
	
	string GeneralFolderPath = "GeneralFolderPath",GeneralFolderList,CurrGeneralFolder
	string SubFolderPath ="SubFolderPath",SubFolderFiles
	string ChunkFolderPath="ChunkFolderPath",ChunkFolderList,CurrChunkFolder
	string WaveFolderPath="WaveFolderPath"
	string wname, fullpath2file
	string WaveFolderList, CurrWaveFolder, WaveFolderFiles, CurrentPath, SaveStartPath, CurrDFString
	variable nGeneralFolders,nSubFolders, nwaves, nChunks, nWaveFolders
	variable i,j,k,l,p,z //Indexing variables
	
	//Open Folder that contains all of the subfolders that house the Igor Binary Wave(s) (.ibw)
	GeneralFolderPath = AJD_SavePath(GeneralFolderPath)
	PathInfo $GeneralFolderPath
	String CurrPathStart = s_path //Remember where we are starting
	
	//Load the .ibw's in the CurrentWaveFolder
	WaveFolderFiles = IndexedFile($GeneralFolderPath, -1, ".ibw")	//Create a list of Files in the wavefolder
	nwaves = ItemsinList(WaveFolderFiles,";")	//Get many waves are in the subfolder
	
	for(j=0;j<nwaves;j++)
		wname = stringfromlist(j,WaveFolderFiles,";")
		fullpath2file = s_path+wname	//Take the full path and attatch the wave name on it
		Loadwave/Q/H/W fullpath2file
	endfor	
	setdatafolder StartDF

End




Function AJD_Concatenate_SP2_Waves(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Are the Folders containing the imported SP2 Data organized?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			string ImportedDF = ""
			prompt ImportedDF, "What is fullpath to the datafolder that contains all of the SP2 Data?"
			doprompt "Please enter the following information", ImportedDF
			if(V_Flag==1)
				abort "User Aborted."
			else
			Endif
			Concatenate_Imported_SP2_Waves(ImportedDF)
		case 2:
			break
		endswitch
end



//AJD 10/24/24 Assumes data has been loaded in chronological order; will only concatenate time series due to data constraints
Function Concatenate_Imported_SP2_Waves(ImportedDF)

	String ImportedDF
	
	//Establish a DFREF for the starting DF
	SetDatafolder $ImportedDF
	DFREF StartDF = GetDataFolderDFR()
	
	

	variable nDataFolders_General, nDataFolders_Layer1, Chunknumber
	variable i,j,k,l
	String GeneralDataFolderList = "", currwave = "", CurrDF = "", Concatlist="", Currwavelist = "", TserDF = "", PBPDF="",RAWDF="",SDTserDF="", LEODF=""
	string chunklist = "", reportedwave, concatwavelist = "" 
	
	wave ConcatWaveName
	
	//Get some information and run a loop
	nDataFolders_General = countobjectsDFR(StartDF,4) //Get the number of datafolders
	
	//For Loop to get all of the General Data Folders
	for(i=0;i<nDataFolders_General;i++)
		GeneralDataFolderList += getindexedObjNameDFR(StartDF,4,i)+";"
	endfor
	i=0
	
	//Assumes no chunk on first data set
	string findnwaves_concTser_str,findnwaves_PBP_str,findnwaves_LEO_str,findnwaves_Raw_str, findnwaves_SDTser_str
	variable findnwaves_concTser_var,findnwaves_PBP_var,findnwaves_LEO_var,findnwaves_Raw_var, findnwaves_SDTser_var
	setdatafolder $stringfromlist(0,GeneralDatafolderList,";")
	string testfolder = getindexedObjName("", 4,1)
	if(stringmatch(testfolder, "*Chunk*")==1) //If we detect a chunk; set up a loop until we get a DF without a chunk
		variable c
		setdatafolder StartDF
		for(c=0;c<itemsinlist(GeneralDatafolderList,";");c++)
			setdatafolder StartDF
			setdatafolder $stringfromlist(c,GeneralDatafolderList,";")
			testfolder = getindexedObjName("", 4,0)
			if(stringmatch(testfolder, "*Chunk*")==1)
				//do nothing
			else
				DFREF DF2Use = getdatafolderDFR()
				findnwaves_concTser_str = getindexedObjName("", 4,1) //Get the ConcTser of the first point
				findnwaves_LEO_str = getindexedObjName("", 4,2) //Get the LEO of the first point
				findnwaves_PBP_str = getindexedObjName("", 4,3) //Get the PBP of the first point
				findnwaves_Raw_str = getindexedObjName("", 4,4) //Get the Raw of the first point
				findnwaves_SDTser_str = getindexedObjName("", 4,5) //Get the SDTser of the first point
				break
			endif
		
		endfor
		
	else //no chunk
		DFREF DF2Use = getdatafolderDFR()
		findnwaves_concTser_str = getindexedObjName("", 4,1) //Get the ConcTser of the first point
		findnwaves_LEO_str = getindexedObjName("", 4,2) //Get the LEO of the first point
		findnwaves_PBP_str = getindexedObjName("", 4,3) //Get the PBP of the first point
		findnwaves_Raw_str = getindexedObjName("", 4,4) //Get the Raw of the first point
		findnwaves_SDTser_str = getindexedObjName("", 4,5) //Get the SDTser of the first point
	endif
	
	string nwavelist = "", stringnamelist = "" 

	setdatafolder $Findnwaves_ConcTser_str
	findnwaves_concTser_var = countObjects("",1)
	setdatafolder DF2Use
//	setdatafolder $stringfromlist(0,GeneralDatafolderList,";")
	nwavelist += num2str(findnwaves_concTser_var)+";"
	stringnamelist += (Findnwaves_ConcTser_str)+";"
	
	setdatafolder $findnwaves_LEO_str
	findnwaves_LEO_var = countObjects("",1)
	setdatafolder DF2Use
//	setdatafolder $stringfromlist(0,GeneralDatafolderList,";") 
	nwavelist += num2str(findnwaves_LEO_var)+";" 
	stringnamelist += (findnwaves_LEO_str)+";"
	
	setdatafolder $findnwaves_PBP_str
	findnwaves_PBP_var = countObjects("",1)
	setdatafolder DF2Use
//	setdatafolder $stringfromlist(0,GeneralDatafolderList,";") 
	nwavelist += num2str(findnwaves_PBP_var)+";"
	stringnamelist += (Findnwaves_PBP_str)+";"
	
	
	setdatafolder $findnwaves_Raw_str
	findnwaves_Raw_var = countObjects("",1)
	setdatafolder DF2Use
//	setdatafolder $stringfromlist(0,GeneralDatafolderList,";") 
	nwavelist += num2str(findnwaves_Raw_var)+";"
	stringnamelist += (Findnwaves_Raw_str)+";"
	
	setdatafolder $findnwaves_SDTser_str
	findnwaves_SDTser_var = countObjects("",1)
	setdatafolder DF2Use
//	setdatafolder $stringfromlist(0,GeneralDatafolderList,";") 
	nwavelist += num2str(findnwaves_SDTser_var)+";"
	stringnamelist += (Findnwaves_SDTser_str)+";"
	
	setdatafolder StartDF
	//Setup Concatenation DF for Tser
	newdatafolder/O/S SP2_Waves_Concat
	DFREF Concat_General = getdatafolderDFR()
	newdatafolder/O/S ConcTser_Concat
	DFREF ConcTser_ConcatDF = getdatafolderDFR()
	setdatafolder Concat_General
	newdatafolder/O/S PBP_Concat
	DFREF PBP_ConcatDF = getdatafolderDFR()
	setdatafolder Concat_General
	newdatafolder/O/S LEO_Concat
	DFREF LEO_ConcatDF = getdatafolderDFR()
	setdatafolder Concat_General
	newdatafolder/O/S Raw_Concat
	DFREF Raw_ConcatDF = getdatafolderDFR()
	setdatafolder Concat_General
	newdatafolder/O/S SDTser_Concat
	DFREF SDTser_ConcatDF = getdatafolderDFR()
	setdatafolder Concat_General
	
	variable nConcatenatedDF = countobjectsDFR(Concat_General, 4)
	

	nDatafolders_Layer1 = 0 
	setdatafolder StartDF
	j=0
	variable z
	
	//Want to do this with waves in ConcTser; Will have to time avg LEO Coatings in another code (revisit timeavg code)
	//ConcTser (Codefix is same but with the attempt to offset the error overshotting mass conc) focused
	
	//Establish what we are looking for first (Raw, LEO, etc)
	for(z=0;z<nConcatenatedDF;z++)
		variable currwaves = str2num(stringfromList(z,nwavelist,";"))
		string currDFList = stringfromlist(z,stringnamelist,";") 

		//Use the GeneralDataFolderList to establish more information about subfolders
		for(j=0;j<currwaves;j++)
			for(i=0;i<nDataFolders_General;i++) //We are acessing the subfolders with this
				//Set the datafolder back to the start for smooth tranition to next one
				setdatafolder StartDF
				//Set the datafolder to the first on the list found above
				CurrDF = stringfromlist(i,GeneralDataFolderList,";")
				if(stringmatch(CurrDF, "SP2_Waves_Concat")==1)
					Continue
				else
				endif
		  		setdatafolder $CurrDF 
		  		
				string FolderChunkCheck_path = getdatafolder(1)
				string FolderChunkCheck_test = getindexedObjName(FolderChunkCheck_path,4,0)	//Look at first DF
				if(stringmatch(FolderChunkCheck_test,"*Chunk*")==1) //If it does contain chunks
					variable Detect_Chunk = 1
				else 
					Detect_Chunk = 0
				endif
				
				 
				string BasePath2Folder = Getdatafolder(1) //does not account for chunks
				
				//If this is a datafolder that contains chunks we need to go a bit deeper
				if(Detect_Chunk==1) //If it does contain chunks
					chunknumber = countObjects("",4)	//How many chunk folders are there?
					
					DFREF TempChunkDFREF = GetdatafolderDFR()	//Sets the DF to the data DF (DF that holds the Chunk DFs)
					for(k=0;k<chunknumber;k++)
						setdatafolder TempChunkDFREF	//Return back to 'home base'
						string currchunk = getindexedObjNameDFR(TempChunkDFREF,4,k)	//Find the chunk folder at index k
						setdatafolder $currchunk
						string Fullpath2Folder = BasePath2Folder + currchunk+":"+getindexedObjName("", 4,(z+1)) //Get the DF of the first point; should cover chunks too
						if(z==2)
							//Find the first wave
							Currwave = getindexedobjName(Fullpath2Folder,1,j)
							wave tempwave = $Fullpath2Folder+":"+"'"+Currwave+"'"
							//$stringfromlist(0,Currwave)
							string dupwavename = nameofwave(tempwave)+num2str(i)
							//Get the full path DF+Wave
							ReportedWave = getdatafolder(1)+CurrWave+";"
						else
							//Get wave
							Currwave = getindexedobjName(Fullpath2Folder,1,j)
							wave tempwave = $Fullpath2Folder+":"+Currwave
							//Get the full path DF+Wave
							ReportedWave = getdatafolder(1)+CurrWave+";"
						endif
						
						CurrWavelist += ReportedWave
						dupwavename = nameofwave(tempwave)+num2str(i)+"_"+num2str(k)
						if(z==0)
							Duplicate/O tempwave,ConcTser_ConcatDF:$dupwavename
						elseif(z==1)
							Duplicate/O tempwave,LEO_ConcatDF:$dupwavename
						elseif(z==2)
							Duplicate/O tempwave,PBP_ConcatDF:$dupwavename
						elseif(z==3)
							Duplicate/O tempwave,Raw_ConcatDF:$dupwavename
						elseif(z==4)
							Duplicate/O tempwave,SDTser_ConcatDF:$dupwavename
					endif
					
						//Add on to builidng wave
						
					endfor
					
					
				
		
				
				elseif(Detect_Chunk==0) //If it does not contain chunks
					Fullpath2Folder = getdatafolder(1)+currDFList
					if(z==2)
						//Find the first wave
						Currwave = getindexedobjName(Fullpath2Folder,1,j)
						wave tempwave = $Fullpath2Folder+":"+"'"+Currwave+"'"
						//$stringfromlist(0,Currwave)
						dupwavename = nameofwave(tempwave)+num2str(i)
						//Get the full path DF+Wave
						ReportedWave = getdatafolder(1)+CurrWave+";"
					else
						//Find the first wave
						Currwave = getindexedobjName(Fullpath2Folder,1,j)
						wave tempwave = $Fullpath2Folder+":"+Currwave
						//$stringfromlist(0,Currwave)
						dupwavename = nameofwave(tempwave)+num2str(i)
						//Get the full path DF+Wave
						ReportedWave = getdatafolder(1)+CurrWave+";"
					endif
					
					//Combine them to create our list
					CurrWavelist += ReportedWave
					//Add on to builidng wave
					if(z==0)
						Duplicate/O tempwave,ConcTser_ConcatDF:$dupwavename
					elseif(z==1)
						Duplicate/O tempwave,LEO_ConcatDF:$dupwavename
					elseif(z==2)
						Duplicate/O tempwave,PBP_ConcatDF:$dupwavename
					elseif(z==3)
						Duplicate/O tempwave,Raw_ConcatDF:$dupwavename
					elseif(z==4)
						Duplicate/O tempwave,SDTser_ConcatDF:$dupwavename
					endif
					
				endif
			endfor	
			
			if(z==0)
				setdatafolder ConcTser_ConcatDF
				Currwave +="_Concat"
				ConcatwaveList = wavelist("!*Concat",";","TEXT:0")
				Concatenate/O/NP/Kill ConcatWaveList, $Currwave
			elseif(z==1)
				setdatafolder LEO_ConcatDF
				Currwave +="_Concat"
				ConcatwaveList = wavelist("!*Concat",";","TEXT:0")
				Concatenate/O/NP/Kill ConcatWaveList, $Currwave
			elseif(z==2)
				setdatafolder PBP_ConcatDF
				Currwave +="_Concat"
				ConcatwaveList = wavelist("!*Concat",";","TEXT:0")
				Concatenate/O/NP/Kill ConcatWaveList, $Currwave
			elseif(z==3)
				setdatafolder Raw_ConcatDF
				Currwave +="_Concat"
				ConcatwaveList = wavelist("!*Concat",";","TEXT:0")
				Concatenate/O/NP/Kill ConcatWaveList, $Currwave
			elseif(z==4)
				setdatafolder SDTser_ConcatDF
				Currwave +="_Concat"
				ConcatwaveList = wavelist("!*Concat",";","TEXT:0")
				Concatenate/O/NP=0/Kill ConcatWaveList, $Currwave
			endif
		Endfor
		setdatafolder StartDF
	endfor
End






//////////////////////HUMAN LUNG////////////////////


//Human Lung Deposition codes; based off of Patek et al. 2020

Function AJD_Human_Lung(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Have you ensured that the waves in the Output folder have been generated?"
			if(V_flag==1)
			elseif(V_Flag==2)
				abort "Output waves not generated. Aborting procedure."
			endif
			string dpwave_Str
			prompt dpwave_Str, "What is the wave of intrest to run through the Human lung depositon code? Keep in mind 'Avg_OptDiamAll is the wave that represents the rBC core at CT shell."
			doprompt "Please enter the following information.", dpwave_Str
			wave dpwave = $dpwave_Str
			dep_lung(dpwave)
		case 2:
			break
		endswitch
end

function dep_lung(dpwave)

	wave dpwave
	
	variable npnts = dimsize(dpwave, 0)
	variable i //for indexing

	
//	setdatafolder root:AdamToolkit
//	DFREF Main_DF = GetdatafolderDFR()
//	Setdatafolder root:AJD_DF:Output
//	DFREF Output_DF = getdatafolderDFR()
	
	//All of the calcs funcntion in um not nm so we need to adjust this for the sake of the calcs. 
	duplicate/O/Free dpwave, dp_micrometers
	dp_micrometers/=1000 //nm -> um
		
	//Set up all waves
	
	//Inhalable Fraction (IF) for the particle diameter dp in um
	make/o/d/n=(npnts) Human_Lung_Dep_IF
	note/K Human_Lung_Dep_IF, "Inhalable Fraction (IF) for the particle diameter dp. (calculation was done with dp in um)"
	//Calc is given as Eq.S4 -> IF = 1-0.5(1-(1/(1+0.0007dp^2.8)))
	
	//Deposition Fraction for head airways (Eq.S1) DFha = IF(1/(1+exp(6.84+1.183 ln dp))+ 1/(1+exp(0.924-1.885 ln dp))
	make/o/d/n=(npnts) Human_Lung_Dep_HA
	note/K Human_Lung_Dep_HA, "Deposition Fraction in the head airways (DFha) for the particle diameter dp. (calculation was done with dp in um)"

	
	//Deposition Fraction for tracheobronchial region (Eq.S2) DFTB = (0.00352/dp) exp(-0.234(ln dp + 3.40)^2) + 63.9 exp(-0.819(ln dp - 1.61)^2))
	make/o/d/n=(npnts) Human_Lung_Dep_TB
	note/K Human_Lung_Dep_TB, "Deposition Fraction in the tracheobronchial region (DFtb) for the particle diameter dp. (calculation was done with dp in um)"
	
	//Deposition Fraction in the alveolar region (Eq.S3) DFa = (0.0155/dp)(exp(-0.416(ln dp +2.84)^2) + 19.11 exp(-0.482(ln dp - 1.362)^2))
	make/o/d/n=(npnts) Human_Lung_Dep_A
	note/K Human_Lung_Dep_A, "Deposition Fraction in the alveolar region (DFa) for the particle diameter dp. (calculation was done with dp in um)"
	
	//Total Deposition
	make/o/d/n=(npnts) Human_Lung_Dep_Total
	note/K Human_Lung_Dep_Total, "Total Deposition Fraction for the particle diameter dp. (calculation was done with dp in um)"


	//establish variables to help with calcs
	variable x1,x2,x3,x4,x5,x6,x7,x8,x9,x10
	
	//Perform calculation in a loop of dp's
	do
	//IF calc
	x1 = 1
	x2 = 1+0.00076*dp_micrometers[i]^2.8
	Human_Lung_Dep_IF[i] = 1 - (0.5*(1 - (x1/x2)))


	//DFha Calc
	x1 = 1
	x2 = 1
//	x3 = 1 + exp(6.84+(1.183 *(ln(dp_micrometers[i]))))
	x3 = ln(dp_micrometers[i])
	x5 = 1.183 * x3
	x6 = 6.84 + x5
	x7 = 1 + exp(x6)
//	x4 = 1 + exp(0.924-1.885 *(ln(dp_micrometers[i])))
	x4 = ln(dp_micrometers[i])
	x8 = 1.885*(x4)
	x9 = 0.924 - x8
	x10 = 1 + exp(x9)
	
	Human_Lung_Dep_HA[i] = Human_Lung_Dep_IF[i] * ((x1/x7) + (x2/x10))
	
	//DFtb calc
	x1 = 0.00352/dp_micrometers[i]
	x2 = ln(dp_micrometers[i]) + 3.40
	x4 = x2^2
	x5 = -0.234 * x4
	x6 = exp(x5)
	x3 = ln(dp_micrometers[i]) - 1.61
	x7 = x3^2
	x8 = -0.819*x7
	x9 = exp(x8)
	x10 = 63.9*x9
	Human_Lung_Dep_TB[i] = (x1) * (x6 + x10)
	
	
	//DFa calc
	x1 = 0.0155/dp_micrometers[i]
	x2 = ln(dp_micrometers[i]) + 2.84
	x4 = x2^2
	x5 = -0.416 * x4 
	x6 = exp(x5)
	x3 = ln(dp_micrometers[i]) - 1.362
	x7 = x3^2
	x8 = -0.482 * x7
	x9 = exp(x8)
	x10 = 19.11 * x9
	Human_Lung_Dep_A[i] = (x1) * (x6 + x10)
	
	
	Human_Lung_Dep_Total[i] = Human_Lung_Dep_HA[i]+Human_Lung_Dep_TB[i]+Human_Lung_Dep_A[i]
	
	i++
	while(i<npnts)
	
	//Impliment Graphing
	Dowindow/K Human_Lung_Deposition_Graph
	display/N=Human_Lung_Deposition_Graph  Human_Lung_Dep_Total,Human_Lung_Dep_TB,Human_Lung_Dep_HA,Human_Lung_Dep_A vs dpwave
	ModifyGraph rgb(Human_Lung_Dep_Total)=(0,0,0),rgb(Human_Lung_Dep_TB)=(2,39321,1),rgb(Human_Lung_Dep_HA)=(1,12815,52428)
	Label left "Fractional Deposition";DelayUpdate
	Label bottom "Particle Diameter (nm)"
	ModifyGraph log(bottom)=1
	Legend/C/N=text0/J/A=RT/H={40,2,10} "\\s(Human_Lung_Dep_Total) Total Fractional Deposition in Human Lung";DelayUpdate
	AppendText "\\s(Human_Lung_Dep_TB) Fractional Deposition in Human Lung in the Tracheobronchial Area";DelayUpdate
	AppendText "\\s(Human_Lung_Dep_HA)Fractional Deposition in Human Lung in the Head Airway";DelayUpdate
	AppendText "\\s(Human_Lung_Dep_A) Fractional Deposition in Human Lung in the Alveolar Area"


End


Function AJD_Human_Lung_Test(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string dpwave_Str
			prompt dpwave_Str, "What is the wave of intrest to run through the Human lung depositon code? Keep in mind 'Avg_OptDiamAll is the wave that represents the rBC core at CT shell."
			doprompt "Please enter the following information.", dpwave_Str
			wave dpwave = $dpwave_Str
			dep_lung_test(dpwave)
		case 2:
			break
		endswitch
end

function dep_lung_test(dpwave)

	wave dpwave
	
	variable npnts = dimsize(dpwave, 0)
	variable i //for indexing

	

	//All of the calcs funcntion in um not nm so we need to adjust this for the sake of the calcs. 
	duplicate/O/Free dpwave, dp_micrometers
	dp_micrometers/=1000 //nm -> um
		
	//Set up all waves
	
	//Inhalable Fraction (IF) for the particle diameter dp in um
	make/o/d/n=(npnts) Human_Lung_Dep_IF
	note/K Human_Lung_Dep_IF, "Inhalable Fraction (IF) for the particle diameter dp. (calculation was done with dp in um)"
	//Calc is given as Eq.S4 -> IF = 1-0.5(1-(1/(1+0.0007dp^2.8)))
	
	//Deposition Fraction for head airways (Eq.S1) DFha = IF(1/(1+exp(6.84+1.183 ln dp))+ 1/(1+exp(0.924-1.885 ln dp))
	make/o/d/n=(npnts) Human_Lung_Dep_HA
	note/K Human_Lung_Dep_HA, "Deposition Fraction in the head airways (DFha) for the particle diameter dp. (calculation was done with dp in um)"

	
	//Deposition Fraction for tracheobronchial region (Eq.S2) DFTB = (0.00352/dp) exp(-0.234(ln dp + 3.40)^2) + 63.9 exp(-0.819(ln dp - 1.61)^2))
	make/o/d/n=(npnts) Human_Lung_Dep_TB
	note/K Human_Lung_Dep_TB, "Deposition Fraction in the tracheobronchial region (DFtb) for the particle diameter dp. (calculation was done with dp in um)"
	
	//Deposition Fraction in the alveolar region (Eq.S3) DFa = (0.0155/dp)(exp(-0.416(ln dp +2.84)^2) + 19.11 exp(-0.482(ln dp - 1.362)^2))
	make/o/d/n=(npnts) Human_Lung_Dep_A
	note/K Human_Lung_Dep_A, "Deposition Fraction in the alveolar region (DFa) for the particle diameter dp. (calculation was done with dp in um)"
	
	//Total Deposition
	make/o/d/n=(npnts) Human_Lung_Dep_Total
	note/K Human_Lung_Dep_Total, "Total Deposition Fraction for the particle diameter dp. (calculation was done with dp in um)"


	//establish variables to help with calcs
	variable x1,x2,x3,x4,x5,x6,x7,x8,x9,x10
	
	//Perform calculation in a loop of dp's
	do
	//IF calc
	x1 = 1
	x2 = 1+0.00076*dp_micrometers[i]^2.8
	Human_Lung_Dep_IF[i] = 1 - (0.5*(1 - (x1/x2)))


	//DFha Calc
	x1 = 1
	x2 = 1
//	x3 = 1 + exp(6.84+(1.183 *(ln(dp_micrometers[i]))))
	x3 = ln(dp_micrometers[i])
	x5 = 1.183 * x3
	x6 = 6.84 + x5
	x7 = 1 + exp(x6)
//	x4 = 1 + exp(0.924-1.885 *(ln(dp_micrometers[i])))
	x4 = ln(dp_micrometers[i])
	x8 = 1.885*(x4)
	x9 = 0.924 - x8
	x10 = 1 + exp(x9)
	
	Human_Lung_Dep_HA[i] = Human_Lung_Dep_IF[i] * ((x1/x7) + (x2/x10))
	
	//DFtb calc
	x1 = 0.00352/dp_micrometers[i]
	x2 = ln(dp_micrometers[i]) + 3.40
	x4 = x2^2
	x5 = -0.234 * x4
	x6 = exp(x5)
	x3 = ln(dp_micrometers[i]) - 1.61
	x7 = x3^2
	x8 = -0.819*x7
	x9 = exp(x8)
	x10 = 63.9*x9
	Human_Lung_Dep_TB[i] = (x1) * (x6 + x10)
	
	
	//DFa calc
	x1 = 0.0155/dp_micrometers[i]
	x2 = ln(dp_micrometers[i]) + 2.84
	x4 = x2^2
	x5 = -0.416 * x4 
	x6 = exp(x5)
	x3 = ln(dp_micrometers[i]) - 1.362
	x7 = x3^2
	x8 = -0.482 * x7
	x9 = exp(x8)
	x10 = 19.11 * x9
	Human_Lung_Dep_A[i] = (x1) * (x6 + x10)
	
	
	Human_Lung_Dep_Total[i] = Human_Lung_Dep_HA[i]+Human_Lung_Dep_TB[i]+Human_Lung_Dep_A[i]
	
	i++
	while(i<npnts)
	
	//Impliment Graphing
	Dowindow/K Human_Lung_Deposition_Graph
	display/N=Human_Lung_Deposition_Graph  Human_Lung_Dep_Total,Human_Lung_Dep_TB,Human_Lung_Dep_HA,Human_Lung_Dep_A vs dpwave
	ModifyGraph rgb(Human_Lung_Dep_Total)=(0,0,0),rgb(Human_Lung_Dep_TB)=(2,39321,1),rgb(Human_Lung_Dep_HA)=(1,12815,52428)
	Label left "Fractional Deposition";DelayUpdate
	Label bottom "Particle Diameter (nm)"
	ModifyGraph log(bottom)=1
	Legend/C/N=text0/J/A=RT/H={40,2,10} "\\s(Human_Lung_Dep_Total) Total Fractional Deposition in Human Lung";DelayUpdate
	AppendText "\\s(Human_Lung_Dep_TB) Fractional Deposition in Human Lung in the Tracheobronchial Area";DelayUpdate
	AppendText "\\s(Human_Lung_Dep_HA)Fractional Deposition in Human Lung in the Head Airway";DelayUpdate
	AppendText "\\s(Human_Lung_Dep_A) Fractional Deposition in Human Lung in the Alveolar Area"


End

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////Lung SD button////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////Adam De Groodt////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Function AJD_SD_Lung_Dep(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
		//Inital Check 1: Does the user have all of the information needed to run the code?
			doalert/T="Adam De Groodt Size Distribution Lung Deposition Code Wave Checker" 2, "This code will provide a Time Dependent Size Distribution with the amount of bins the user desires as well as a the amount (mass or number) deposited into the respitory system of a human. \r\rIn order to complete this code a wave of: \r\r Diameter\r Flowrate\r TimeDate \r\rwill be needed. \rAdditonally the number of: \r\rBins\rTime interval of inspection\rDensity\r\ris required. \r\r This does not pertain to you if you already have a Distribution generated.\r\rDo you want to continue?"
			if(V_Flag ==1)
			elseif(V_Flag==2)
				abort "User does not want to continue."
			elseif(V_Flag==3)
				abort "User does not want to continue."
			else
				abort "Unknown Input. Aborting."
			endif
		
		//Inital Check 2: Is the user in a good Data Folder?
			doalert/T="Adam De Groodt Size Distribution Lung Deposition Code Data Folder Checker" 2, "Are you in the Data folder that holds the Dp, Flowrate, and Datetime wave to be used? \r\rIf you already have a distribution generated then you need the Distribution wave, time wave, dlogdp wave and diameter midpoint wave."
			if(V_Flag ==1)
			elseif(V_Flag==2)
				abort "User is not in a good Data Folder to run the code. Aboring."
			elseif(V_Flag==3)
				abort "User is not in a good Data Folder to run the code. Aboring."
			else
				abort "Unknown Input. Aborting."
			endif
		
		//Get Data Folder Information
			DFREF SD_Base = GetdatafolderDFR()
			
		
			
		
		//Get Wave information and run part 1 of the code. Part 1 = create time SD waves	
		//Check to see if the user has a MD or needs to build one
		Doalert/T="Information Checker" 2, "Do you have a Distribution (click 'Yes') or do you need to build one (click 'No') from diameter, flow, and time wave (and also an assumed density)."
		variable nbins, density, time_interval
		string dpwave_Str, flowwave_Str, twave_str, Dist_Str, dlogDp_Str, dpmid_Str
		variable CreateSD = 0 //Track if we are creating a SD
		if(V_Flag==1)
			prompt Dist_Str, "Please enter the distribution wave to be used."
			prompt twave_Str, "Please enter the time wave to be used."
			prompt dlogDp_Str, "Please enter the dlogDp wave to be used."
			prompt dpmid_Str, "Please enter the midpoint dimater wave to be used."
			doprompt "Please enter the following." Dist_Str, twave_Str, dpmid_Str, dlogDp_Str
			if(V_Flag==1)
				Abort "User Cancelled."
			endif
			//Establish waves
			wave SD = $Dist_Str
			wave dp_mid = $dpmid_Str
			wave dlogDp = $dlogDp_Str
			wave SD_Time_Midpoint = $twave_str
			//Make dlogDp wave
//			variable sp2bins = dimsize(dp_mid,0)
//			variable wmax, wmin
//			wmax = wavemax(dp_mid)
//			wmin = wavemin(dp_mid)
//			make/o/d/n=(sp2bins) dlogdp
//			dlogdp = (log(wmax)-log(wmin))/sp2bins
			//Eatablish the SD_Base (a datafolder base)
			DFREF SD_Base = getdatafolderDFR()
			
			string N_M_Str
			variable N_M_Var
			prompt N_M_Str, "Please enter 'Number' or 'Mass' to select the generated number or mass distribution to be used."
			doprompt "Please Enter the following information." N_M_Str
			
			string startingwlist = "" //we don't want to delete any waves in this iteration of the code
		
			if(stringmatch(N_M_Str,"Number") == 1)
				N_M_Var = 1
			elseif(stringmatch(N_M_Str,"Mass") == 1)
				N_M_Var = 2
			endif
			if(N_M_Var==1)
				Dep_Lung_SD(SD,dp_mid,dlogdp,SD_Time_Midpoint, SD_Base, startingwlist, CreateSD)
			elseif(N_M_Var ==2)
				Dep_Lung_SD(SD,dp_mid,dlogdp,SD_Time_Midpoint, SD_Base, startingwlist, CreateSD)
			endif
			
			//We get here after the SD supplied code so end here
			doalert/T="Adam De Groodt Size Distribution Lung Deposition Code Final Completion Checker" 0, "Please rename the two output folders in order to prevent the overwritting of them when running the code again."
			return -1
			
						
		elseif(V_Flag==2)
			CreateSD = 1
			prompt nbins, "Please enter the number of bins that you want the Size Distribution."
			prompt dpwave_Str, "Please enter the wave of the diameters that will be used."
			prompt flowwave_Str, "Please enter the wave of the sample volume in cubic meters (m3) that will be used."
			prompt twave_Str, "Please Enter the time wave that will be used."
			prompt density, "Please enter the the density (g/cm3) of the wave of data that will be that will be used."
			prompt time_interval, "Please enter the Time Interval (s) to be used."
			doprompt "Please enter the following." nbins, dpwave_str, flowwave_Str, twave_Str, density, time_interval
			wave dpwave = $dpwave_Str
			wave flowwave = $flowwave_Str
			wave twave = $twave_Str
//			wave density = $dwave_Str
			if(V_flag ==1)
				Abort "User Cancelled."
			else
			Endif
			AJD_Time_SD_N_M(nbins, dpwave, flowwave, density, twave, time_interval, SD_Base)
			////////////////////////////////////////
			//SD produced are in dXdlogDp (dX/cm3)//
			////////////////////////////////////////
			string initial_Wave_list = wavelist("*",";","Text:0")
		elseif(V_Flag==3)
			Abort "User Aborted"
		endif

		
		//Part 1 Code Complete. Inform User. 
			doalert/T="Adam De Groodt Size Distribution Lung Deposition Code Part 1 Completion Checker" 2, "The first part of the code is complete, the second part of the code requires either the generated Number or Mass Distribution to be selected. Do you want to continue?"
			if(V_Flag ==1)
			elseif(V_Flag==2)
					 variable wlistitems, i 
					 string wlist2delete = ""
					 wlist2delete += wavelist("Bin_Midpoints",";","Text:0")
	 				 wlist2delete += wavelist("dlogDp",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Mass",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Numb",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Midpoint",";","Text:0")
	
	
					wlistitems = itemsInList(wlist2delete,";")
						for(i=0;i<wlistitems;i++)
							wave tempwave = $stringfromList(i,wlist2delete,";")
							killwaves tempwave
						endfor
				
				abort "User does not want to continue. Aboring."
			elseif(V_Flag==3)
					 wlistitems = 0
					 i= 0  
					 wlist2delete = ""
					 wlist2delete += wavelist("Bin_Midpoints",";","Text:0")
	 				 wlist2delete += wavelist("dlogDp",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Mass",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Numb",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Midpoint",";","Text:0")
	
	
					wlistitems = itemsInList(wlist2delete,";")
						for(i=0;i<wlistitems;i++)
							wave tempwave = $stringfromList(i,wlist2delete,";")
							killwaves tempwave
						endfor
				
				abort "User does not want to continue. Aboring."
			else
					wlistitems = 0
					i = 0 
					wlist2delete = ""
					 wlist2delete += wavelist("Bin_Midpoints",";","Text:0")
	 				 wlist2delete += wavelist("dlogDp",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Mass",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Numb",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Midpoint",";","Text:0")
	
	
					wlistitems = itemsInList(wlist2delete,";")
						for(i=0;i<wlistitems;i++)
							wave tempwave = $stringfromList(i,wlist2delete,";")
							killwaves tempwave
						endfor
				
				abort "Unknown Input. Aborting."
			endif
			
		//Part 2 Code Started. Enter and Acquire Information." Part 2 = Apply breathing assumptions to get mass or number deposited in lungs (tseries of it)
//			string N_M_Str
//			variable N_M_Var
			prompt N_M_Str, "Please enter 'Number' or 'Mass' to select the generated number or mass distribution to be used."
			doprompt "Please Enter the following information." N_M_Str
			if(V_Flag==1)
				wlistitems = 0
					i = 0 
					wlist2delete = ""
					 wlist2delete += wavelist("Bin_Midpoints",";","Text:0")
	 				 wlist2delete += wavelist("dlogDp",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Mass",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Numb",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Midpoint",";","Text:0")
	
	
					wlistitems = itemsInList(wlist2delete,";")
						for(i=0;i<wlistitems;i++)
							wave tempwave = $stringfromList(i,wlist2delete,";")
							killwaves tempwave
						endfor
				
				abort "User Cancelled. Aborting."
			endif
			//Declare other waves
			wave SD //Depends on user input
			wave dlogdp // this is good to go
			wave dp_Mid = bin_midpoints	//declared to be the wavename generated
			wave SD_Time_Midpoint = Time_SD_Midpoint	//declared to be the wavename generated
			startingwlist = initial_Wave_list
			if(stringmatch(N_M_Str,"Number") == 1)
				N_M_Var = 1
			elseif(stringmatch(N_M_Str,"Mass") == 1)
				N_M_Var = 2
			else
				wlistitems = 0
					i = 0 
					wlist2delete = ""
					 wlist2delete += wavelist("Bin_Midpoints",";","Text:0")
	 				 wlist2delete += wavelist("dlogDp",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Mass",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Numb",";","Text:0")
	 				 wlist2delete += wavelist("Time_SD_Midpoint",";","Text:0")
	
	
					wlistitems = itemsInList(wlist2delete,";")
						for(i=0;i<wlistitems;i++)
							wave tempwave = $stringfromList(i,wlist2delete,";")
							killwaves tempwave
						endfor
				abort "Unknown Information Entered, aborting procedure."
			endif
			if(N_M_Var==1)
				wave SD = Time_SD_Numb
				Dep_Lung_SD(SD,dp_mid,dlogdp,SD_Time_Midpoint, SD_Base, startingwlist, CreateSD)
			elseif(N_M_Var ==2)
				wave SD = Time_SD_Mass
				Dep_Lung_SD(SD,dp_mid,dlogdp,SD_Time_Midpoint, SD_Base, startingwlist, CreateSD)
			endif
			
			
		//Final part: warn user to rename the Data folders 
		doalert/T="Adam De Groodt Size Distribution Lung Deposition Code Final Completion Checker" 0, "Please rename the two output folders in order to prevent the overwritting of them when running the code again."
		case 2:
			break
		endswitch
end



Function Dep_Lung_SD(SD,dp_mid, dlogdp, SD_Time_Midpnt, SD_Base,startingwlist, CreateSD) // Take a SD (for my purposes Mass) and then apply the fractional deposition code to determine fractional deposition as a funciton of SD.
	
	wave SD, dp_mid, dlogdp, SD_Time_Midpnt
	DFREF SD_Base
	string startingwlist
	Variable CreateSD
	
	//General Variables
	variable nrows = dimsize(SD,0)
	variable ncols = dimsize(SD,1)
	variable i, j 
	
	//SMPS variable
	string SMPS_TimeWave_String = nameofwave(SD_Time_Midpnt)
	string SMPS_SD_String = nameofwave(SD)
	string SMPS_dlogdp_String = nameofwave(dlogDp)
	
	//set up global variable for progress bar
	DFREF CurrDF = GetdatafolderDFR()
	setdatafolder root:
	variable/G PercentFinished = 0
	setdatafolder currDF
	
	//make progress panel and timer as this can take a while with PBP data
	execute/Q/Z "pnlProgress()"
	stopalltimers()
	variable Timer = startMSTimer
	
	
	////////////////////////////////////////////////////////////////////
	//THE SD PRODUCED BY CREATING FROM SCRATCH IS IN dXdlogdp (dX/cm3)//
	////////////////////////////////////////////////////////////////////
	
	//Establish Output DF for Part 2 Code
	string DF_Output2_Str = "SD_Output_Part2"
	setdatafolder SD_Base
	If(dataFolderExists("SD_Output_Part2")==1)	//it does exist
		setdatafolder SD_Output_Part2
		DFREF SD_Output_Part2 = getdatafolderDFR()
	elseif(datafolderexists("SD_Output_Part2")==0)	//it does not exist
		newdataFolder/S $DF_Output2_Str
		DFREF SD_Output_Part2 = getdatafolderDFR()
	endif
	
	setdatafolder SD_Base
	
	//Duplicate SD
	Duplicate/O/Free SD, szData //Create a floating copy of the SD to avoid messing with the original one. 
	
	//Create and change important waves
	duplicate/O szData, dX //This matrix will serve to hold the amount of mass in each bin after taking it out of D 
	make/o/d/n=(nrows,ncols) Fractional_dX_Deposition_To_Human_Lungs_Total
	duplicate/O Fractional_dX_Deposition_To_Human_Lungs_Total, Fractional_dX_Deposition_To_Human_Lungs_HA
	duplicate/O Fractional_dX_Deposition_To_Human_Lungs_Total, Fractional_dX_Deposition_To_Human_Lungs_TB
	duplicate/O Fractional_dX_Deposition_To_Human_Lungs_Total, Fractional_dX_Deposition_To_Human_Lungs_A
		
	for(i=0;i<nrows;i++)
		for(j=0;j<ncols;j++)
			dX[i][j] *= dlogDp[j] //Undo dlogDp to get back to dN or dM which shows the amount of mass before the normalization to the bindwidth	; so we would be in #/cm3 or ug/cm3 for number or mass. 	
		Endfor
	Endfor

	//Impliment Fractional Deposition Model
	wave SD_Frac = Frac_Dep_Model_SD(SD, dp_mid)	//Fractional Deposition Model only relies on particle diameter so as long as dp_mid is in nm, we can pass any SD as it isnt affected, it is needed here as we have to get the dimensions of it. 
	
	//Now we have the dX in the matrix dX as well as the Fractional Depositions in matrix SD_Frac
	//Let's take the dX and multiply it by the SD_Frac to arrive at the fractional mass deposited into the respective areas of the lungs. 
	
	for(i=0;i<nrows;i++)
		for(j=0;j<ncols;j++)
			Fractional_dX_Deposition_To_Human_Lungs_HA[i][j] = dX[i][j] * SD_Frac[1][j]
			Fractional_dX_Deposition_To_Human_Lungs_TB[i][j] = dX[i][j] * SD_Frac[2][j]
			Fractional_dX_Deposition_To_Human_Lungs_A[i][j] = dX[i][j] * SD_Frac[3][j]
			Fractional_dX_Deposition_To_Human_Lungs_Total[i][j] = dX[i][j] * SD_Frac[4][j]	//We are taking the total not based on IF but DF
			NVAR root:PercentFinished = ((i+1)/nrows)*100
		Endfor
	Endfor
	
	//Okay now we have the Fractional Number or Mass concentration (dX; dN or dM) deposition to the different areas of the human lung
	//From here we would like to get mass deposited into the human lungs per time (where time is given from the SD)
	//Delphine things that a good approach is to approximate the amount of air into a humans lungs over the time average. 
	// I can find that in L and convert to m3 and then apply that wrt the time frame I am looking at, lets try this below. 
	
	//From EPA Exposure handbook Ch.6 Table 6.2 -> Light activity (assuming people walking around).
	//Mean from birth to 81 yrs old -> 12 LPM;  
	variable air_per_day_L = 17280 //Liters 
	Variable air_per_day_m3 = air_per_day_L * 1E-3	//Liters *  (1e-3) m3/1L = m3
	variable air_per_day_cm3 = air_per_day_m3 *1E6
	variable timeframe = SD_Time_Midpnt[1] - SD_Time_Midpnt[0] //Use timewave to figure this out
	
	//If you are getting the weird number and are looking at the code then this might be the code you want to switch out, maybe I will update it to be better/easier
	
	//If user created an SD it will be in dX/cm3
	if(CreateSD ==0)
		string checkuser
		string checkgeneration
		prompt checkuser, "Is the SD to be used in cm3 or m3? Input 'cm3' or 'm3' to clarify."
		prompt checkgeneration, "Enter 'create' or 'preexist' if you created an SD or used an existing one."
		doprompt "Please enter the following information." Checkuser, Checkgeneration
		if(V_Flag==1)
			Abort "User Cancelled."
		endif
	elseif(CreateSD==1) //if the user created a SD it will be in cm3
		Checkuser = "cm3"
		checkgeneration = "create"
	endif
	
	if(stringmatch(Checkuser, "cm3")==1)
		//for cm3 use the line below
		variable air_per_timeframe_cm3 = (air_per_day_cm3/86400)*timeframe	// cm3/day * (1day/86400 s)*(900s/1 timeframe) (will change with different timeframes)
	elseif(stringmatch(Checkuser,"m3")==1)
		//for m3 use the line below
		variable air_per_timeframe_m3 = (air_per_day_m3/86400)*timeframe	// m3/day * (1day/86400 s)*(900s/1 timeframe) (will change with different timeframes)
	else
		abort "Invalid Input. Aborting."
	endif
	//Okay so we have the air per unit timeframe figured out
	//Now lets apply that to our matricies to get rid of the cm3 and find out what mass (not mass conc) deposits to the human lungs in each area and overall
	
	duplicate/O Fractional_dX_Deposition_To_Human_Lungs_HA, X_to_Human_Lung_HA
	duplicate/O Fractional_dX_Deposition_To_Human_Lungs_TB, X_to_Human_Lung_TB
	duplicate/O Fractional_dX_Deposition_To_Human_Lungs_A, X_to_Human_Lung_A
	duplicate/O Fractional_dX_Deposition_To_Human_Lungs_Total, X_to_Human_Lung_Total
	
	note X_to_Human_Lung_HA, "X (Mass or number) of particles deposited to the Head Airways (HA) of the human respiratory system over the timeframe of " + num2str(timeframe) + " seconds."
	note X_to_Human_Lung_TB, "X (Mass or number) of particles deposited to the Tracheobronchial (TB) region of the human respiratory system over the timeframe of " + num2str(timeframe) + " seconds."
	note X_to_Human_Lung_A, "X (Mass or number) of particles deposited to the Alveolar (A) region of the human respiratory system over the timeframe of " + num2str(timeframe) + " seconds."
	note X_to_Human_Lung_Total, "X (Mass or number) of particles deposited to the entire human respiratory system over the timeframe of " + num2str(timeframe) + " seconds."

	
	//Units are #/cm3 or ug/cm3 * cm3 -> Number or Mass || or #/m3 or ug/m3 -> number or mass
	//Figure out a way to switch more easily in the future.

	if(stringmatch(Checkuser, "cm3")==1)
		//for cm3 use the line below
			X_to_Human_Lung_HA *= air_per_timeframe_cm3
			X_to_Human_Lung_TB *= air_per_timeframe_cm3
			X_to_Human_Lung_A *= air_per_timeframe_cm3
			X_to_Human_Lung_Total	*= air_per_timeframe_cm3
	elseif(stringmatch(Checkuser,"m3")==1)
		//for m3 use the line below
		X_to_Human_Lung_HA *= air_per_timeframe_m3
		X_to_Human_Lung_TB *= air_per_timeframe_m3
		X_to_Human_Lung_A *= air_per_timeframe_m3
		X_to_Human_Lung_Total	*= air_per_timeframe_m3	
	else
		abort "Invalid Input. Aborting."
	endif	



	//Okay we have arrived at the Number or Mass (X) that deposits in the human lung as a function of the particle size and time frame we are looking at. 
	//Now let's construct a time series of this
	//We can do this by taking out midpoint times and then constructing a timeseries of the sum of all of the individual points for each area
	//(I think)
	Make/o/d/n=(nrows,4) TimeSeries_XSum_to_Human_Lung
	note TimeSeries_XSum_to_Human_Lung, "Time Series Matrix corresponding to the wave" + nameofWave(SD_Time_Midpnt)
	note TimeSeries_XSum_to_Human_Lung, "Rows 0-3 are:"
	note TimeSeries_XSum_to_Human_Lung, "0: Sum of the Number or Mass deposited in all of the regions of the human respiratory system over the timeframe of " + num2str(timeframe) + " seconds."
	note TimeSeries_XSum_to_Human_Lung, "1: Sum of the Number or Mass deposited in the Head AirWays (HA) region of the human respiratory system over the timeframe of " + num2str(timeframe) + " seconds."
	note TimeSeries_XSum_to_Human_Lung, "2: Sum of the Number or Mass deposited in the Tracheobronchial (TB) region of the human respiratory system over the timeframe of " + num2str(timeframe) + " seconds."
	note TimeSeries_XSum_to_Human_Lung, "3: Sum of the Number or Mass deposited in the Alveolar (A) region of the human respiratory system over the timeframe of " + num2str(timeframe) + " seconds."

	variable sumrow, currnumb, z
	for(z=0;z<4;z++)
		for(i=0;i<nrows;i++)
			for(j=0;j<ncols;j++)
					if(z==0)
						currnumb = X_to_Human_Lung_Total[i][j]
						if(numtype(X_to_Human_Lung_Total[i][j])==2)
							currnumb = 0 
						else
						sumrow += currnumb
						Endif
					elseif(z==1)
						currnumb = X_to_Human_Lung_HA[i][j]
						if(numtype(X_to_Human_Lung_HA[i][j])==2)
							currnumb = 0 
						else
						sumrow += currnumb
						Endif
					elseif(z==2)
						currnumb = X_to_Human_Lung_TB[i][j]
						if(numtype(X_to_Human_Lung_TB[i][j])==2)
							currnumb = 0 
						else
						sumrow += currnumb
						Endif
					elseif(z==3)
						currnumb = X_to_Human_Lung_A[i][j]
						if(numtype(X_to_Human_Lung_A[i][j])==2)
							currnumb = 0 
						else
						sumrow += currnumb
						Endif
					Endif
			Endfor
			if(sumrow==0)
				sumrow = NaN	//If the entire row is 0 then we are likley missing data so set to NaN
			endif
			TimeSeries_XSum_to_Human_Lung[i][z] = sumrow
			Sumrow = 0 
		Endfor
	Endfor
	
	
	//Make notes to explain waves
	note dX, "Number or Mass Distribution taken OUT of dXdlogDp (so it is NOT in dXdlogDp) by multiplying it by " + nameofwave(dlogdp) + " ."
	note Fractional_dX_Deposition_To_Human_Lungs_A, "The Fractional Deposition (decimal) of dX into the Aveolar Region of the Human Respitory System."
	note Fractional_dX_Deposition_To_Human_Lungs_HA,"The Fractional Deposition (decimal) of dX into the Head Airways of the Human Respitory System."
	note Fractional_dX_Deposition_To_Human_Lungs_TB,"The Fractional Deposition (decimal) of dX into the Tra Region of the Human Respitory System."
	note Fractional_dX_Deposition_To_Human_Lungs_Total,"The Fractional Deposition (decimal) of dX into all three regions of the Human Respitory System."
	
	//Move and delete waves
//	dup2NF(SD_Base,SD_Output_Part2)
//	dup2NF()
	 variable wlistitems 
	 string wlist2delete = ""
	 //Add to wlist2delete 
	 wlist2delete += wavelist("Bin_Midpoints",";","Text:0")
	 wlist2delete += wavelist("dlogDp",";","Text:0")
	 wlist2delete += wavelist("dX",";","Text:0")
	 wlist2delete += wavelist("Fractional*",";","Text:0")
	 wlist2delete += wavelist("SD_Frac",";","Text:0")
	 wlist2delete += wavelist("TimeSeries*",";","Text:0")
	 wlist2delete += wavelist("Time_SD*",";","Text:0")
	 wlist2delete += wavelist("X*",";","Text:0")
	 
	  
	 //Bring in the waves that were initially in the starting DataFolder
	wlistitems = itemsInList(wlist2delete,";")
	for(i=0;i<wlistitems;i++)
		wave tempwave = $stringfromList(i,wlist2delete,";")
		movewave tempwave, SD_Output_Part2:$nameofwave(tempwave)
	endfor
	
	//If we are working with the SMPS Data then I need the time wave
	variable SMPS_SD_Var = stringmatch(SMPS_SD_String, "SMPS*") // assumes the SMPS SD is started by 'SMPS'
	if(SMPS_SD_Var == 1) 
		setdatafolder SD_Base
		wave tempwave = $SMPS_TimeWave_String
		string SMPS_TimeWave_String_Updated = SMPS_TimeWave_String + "_Saveme"
		duplicate/O tempwave, SD_Output_Part2:$SMPS_TimeWave_String_Updated
		setdatafolder SD_Base
		wave tempwave = $SMPS_dlogdp_String
		string SMPS_dlogdp_String_Updated = SMPS_dlogdp_String + "_Saveme"
		duplicate/O tempwave, SD_Base:$SMPS_dlogdp_String_Updated
	else
	endif
	
	if(stringmatch(checkgeneration,"preexist"))
		duplicate $nameofwave(SD_Time_Midpnt), SD_Output_Part2:$nameofwave(SD_Time_Midpnt)
	endif
	
	setdatafolder SD_Output_Part2

//	//Delete initial waves 
//	wlistitems = itemsInList(startingwlist,";")
//	for(i=0;i<wlistitems;i++)
//		wave tempwave = $stringfromList(i,startingwlist,";")
//		killwaves tempwave
//	endfor
	

	
	//Now we just need to graph the Time series and include a slight motification for the SMPS
	wave TimeSeries_XSum_to_Human_Lung
	if(SMPS_SD_Var==1) // we are processing SMPS
		wave Time_SD_Midpoint = $SMPS_TimeWave_String_Updated
	else
		wave Time_SD_Midpoint
	endif
	wave Time_SD_Midpoint = $nameofwave(SD_Time_Midpnt)
	killwindow/Z TimeSeries_X_Human_Lung_Dep
	Display/N=TimeSeries_X_Human_Lung_Dep TimeSeries_XSum_to_Human_Lung[][0] vs Time_SD_Midpoint
	AppendToGraph TimeSeries_XSum_to_Human_Lung[][1] vs Time_SD_Midpoint
	AppendToGraph TimeSeries_XSum_to_Human_Lung[][2] vs Time_SD_Midpoint
	AppendToGraph TimeSeries_XSum_to_Human_Lung[][3] vs Time_SD_Midpoint
	Label left "Number or Mass Deposited to \rthe Human Respitory System\r(µg) or (#)"
	Label bottom "Time Date"
	ModifyGraph rgb(TimeSeries_XSum_to_Human_Lung)=(0,0,0)
	ModifyGraph rgb(TimeSeries_XSum_to_Human_Lung#1)=(0,0,65535),rgb(TimeSeries_XSum_to_Human_Lung#2)=(2,39321,1)
	Legend/C/N=text0/J "\\s(TimeSeries_XSum_to_Human_Lung) Total\r\\s(TimeSeries_XSum_to_Human_Lung#1) Head Airways";DelayUpdate
	AppendText/N=text0 "\\s(TimeSeries_XSum_to_Human_Lung#2) Tracheobronchial\r\\s(TimeSeries_XSum_to_Human_Lung#3) Aveolar"
		
		
		
	//Lets wrap up the code with some percentage deposition stuff
	make/o/d/n=1 PCont_Avg_HA;make/o/d/n=1 PCont_Avg_TB	;make/o/d/n=1 PCont_Avg_A; make/o/d/n=1 PCont_Avg_Total
	make/o/d/n=1 FracDep_Avg_HA;make/o/d/n=1 FracDep_Avg_TB	;make/o/d/n=1 FracDep_Avg_A; make/o/d/n=1 FracDep_Avg_Total
	MatrixOp TimeSeries_XSum_to_Human_Lung_PCon_Total = col(TimeSeries_XSum_to_Human_Lung,0)
	MatrixOp TimeSeries_XSum_to_Human_Lung_PCon_HA = col(TimeSeries_XSum_to_Human_Lung,1)
	MatrixOp TimeSeries_XSum_to_Human_Lung_PCon_TB = col(TimeSeries_XSum_to_Human_Lung,2)	
	MatrixOp TimeSeries_XSum_to_Human_Lung_PCon_A = col(TimeSeries_XSum_to_Human_Lung,3)	
		
	TimeSeries_XSum_to_Human_Lung_PCon_HA/=TimeSeries_XSum_to_Human_Lung_PCon_Total
	TimeSeries_XSum_to_Human_Lung_PCon_HA*=100
	
	TimeSeries_XSum_to_Human_Lung_PCon_TB/=TimeSeries_XSum_to_Human_Lung_PCon_Total
	TimeSeries_XSum_to_Human_Lung_PCon_TB*=100
		
	TimeSeries_XSum_to_Human_Lung_PCon_A/=TimeSeries_XSum_to_Human_Lung_PCon_Total
	TimeSeries_XSum_to_Human_Lung_PCon_A*=100
		
//	TimeSeries_XSum_to_Human_Lung_PCon_Total/=TimeSeries_XSum_to_Human_Lung_PCon_Total	//This is not doing the best job representing how much actually deposits into the lungs as I am dividing it by itself; really I need to divide by the DF or take the sum of all of the fractions (HA;TB;A)
	TimeSeries_XSum_to_Human_Lung_PCon_Total=TimeSeries_XSum_to_Human_Lung_PCon_HA+TimeSeries_XSum_to_Human_Lung_PCon_TB+TimeSeries_XSum_to_Human_Lung_PCon_A
//	TimeSeries_XSum_to_Human_Lung_PCon_Total*=100
	
	WaveStats/Q TimeSeries_XSum_to_Human_Lung_PCon_HA
	PCont_Avg_HA = V_Avg
	WaveStats/Q TimeSeries_XSum_to_Human_Lung_PCon_TB
	PCont_Avg_TB = V_Avg
	WaveStats/Q TimeSeries_XSum_to_Human_Lung_PCon_A
	PCont_Avg_A = V_Avg
	WaveStats/Q TimeSeries_XSum_to_Human_Lung_PCon_Total
	PCont_Avg_Total = V_Avg
	
	FracDep_Avg_HA = (PCont_Avg_HA/100) 
	FracDep_Avg_TB = (PCont_Avg_TB/100) 
	FracDep_Avg_A = (PCont_Avg_A/100)
	FracDep_Avg_Total = (PCont_Avg_Total/100) 
	
	//Duplicate pcont and normalize to Pcon_DF (gets % that adds to 100%)
	Duplicate PCont_Avg_HA, PCont_Avg_HA_Norm
	Duplicate PCont_Avg_TB, PCont_Avg_TB_Norm
	Duplicate PCont_Avg_A, PCont_Avg_A_Norm
	Duplicate PCont_Avg_Total, PCont_Avg_Total_Norm
	PCont_Avg_HA_Norm/=PCont_Avg_Total
	PCont_Avg_TB_Norm/=PCont_Avg_Total
	PCont_Avg_A_Norm/=PCont_Avg_Total
	PCont_Avg_Total_Norm/=PCont_Avg_Total
	
	//Get pCon into percentage
	PCont_Avg_HA_Norm*=100
	PCont_Avg_TB_Norm*=100
	PCont_Avg_A_Norm*=100
	PCont_Avg_Total_Norm*=100
	
	//Return to starting Data Folder	
	setdatafolder SD_Base
End

Function/Wave Frac_Dep_Model_SD(SD, dp_mid)

	wave SD, dp_mid
	variable nrows = dimsize(SD,0)
	variable ncols = dimsize(SD,1)
	
	duplicate/O/Free dp_mid, dp_mid_micrometers		//dp must be in nm
	dp_mid_micrometers/=1000 //nm -> um; fractional model constructed to in um
	
	//Set up all waves
	
	//Inhalable Fraction (IF) for the particle diameter dp in um
	make/o/d/n=(ncols) Human_Lung_Dep_IF
	note/K Human_Lung_Dep_IF, "Inhalable Fraction (IF) for the particle diameter dp. (calculation was done with dp in um)"
	//Calc is given as Eq.S4 -> IF = 1-0.5(1-(1/(1+0.0007dp^2.8)))
	
	//Deposition Fraction for head airways (Eq.S1) DFha = IF(1/(1+exp(6.84+1.183 ln dp))+ 1/(1+exp(0.924-1.885 ln dp))
	make/o/d/n=(ncols) Human_Lung_Dep_HA
	note/K Human_Lung_Dep_HA, "Deposition Fraction in the head airways (DFha) for the particle diameter dp. (calculation was done with dp in um)"

	
	//Deposition Fraction for tracheobronchial region (Eq.S2) DFTB = (0.00352/dp) exp(-0.234(ln dp + 3.40)^2) + 63.9 exp(-0.819(ln dp - 1.61)^2))
	make/o/d/n=(ncols) Human_Lung_Dep_TB
	note/K Human_Lung_Dep_TB, "Deposition Fraction in the tracheobronchial region (DFtb) for the particle diameter dp. (calculation was done with dp in um)"
	
	//Deposition Fraction in the alveolar region (Eq.S3) DFa = (0.0155/dp)(exp(-0.416(ln dp +2.84)^2) + 19.11 exp(-0.482(ln dp - 1.362)^2))
	make/o/d/n=(ncols) Human_Lung_Dep_A
	note/K Human_Lung_Dep_A, "Deposition Fraction in the alveolar region (DFa) for the particle diameter dp. (calculation was done with dp in um)"
	
	//Total Deposition
	make/o/d/n=(ncols) Human_Lung_Dep_Total	//From Hinds DF = IF(0.0587+[(0.911/1+exp(4.77+1.485 ln dp))+(0.943/1+exp(0.508-2.58ln*dp)]; this is the amount that actually desposits; the other stuff is exhaled; so I should normalize pCon to this
	note/K Human_Lung_Dep_Total, "Total Deposition Fraction for the particle diameter dp. (calculation was done with dp in um)"

	
	
	//establish variables to help with calcs
	variable x1,x2,x3,x4,x5,x6,x7,x8,x9,x10
	variable i = 0
	
	//Perform calculation in a loop of dp's
	do
	//IF calc
	x1 = 1
	x2 = 1+0.00076*dp_mid_micrometers[i]^2.8
	Human_Lung_Dep_IF[i] = 1 - (0.5*(1 - (x1/x2)))


	//DFha Calc
	x1 = 1
	x2 = 1
//	x3 = 1 + exp(6.84+(1.183 *(ln(dp_micrometers[i]))))
	x3 = ln(dp_mid_micrometers[i])
	x5 = 1.183 * x3
	x6 = 6.84 + x5
	x7 = 1 + exp(x6)
//	x4 = 1 + exp(0.924-1.885 *(ln(dp_micrometers[i])))
	x4 = ln(dp_mid_micrometers[i])
	x8 = 1.885*(x4)
	x9 = 0.924 - x8
	x10 = 1 + exp(x9)
	
	Human_Lung_Dep_HA[i] = Human_Lung_Dep_IF[i] * ((x1/x7) + (x2/x10))
	
	//DFtb calc
	x1 = 0.00352/dp_mid_micrometers[i]
	x2 = ln(dp_mid_micrometers[i]) + 3.40
	x4 = x2^2
	x5 = -0.234 * x4
	x6 = exp(x5)
	x3 = ln(dp_mid_micrometers[i]) - 1.61
	x7 = x3^2
	x8 = -0.819*x7
	x9 = exp(x8)
	x10 = 63.9*x9
	Human_Lung_Dep_TB[i] = (x1) * (x6 + x10)
	
	
	//DFa calc
	x1 = 0.0155/dp_mid_micrometers[i]
	x2 = ln(dp_mid_micrometers[i]) + 2.84
	x4 = x2^2
	x5 = -0.416 * x4 
	x6 = exp(x5)
	x3 = ln(dp_mid_micrometers[i]) - 1.362
	x7 = x3^2
	x8 = -0.482 * x7
	x9 = exp(x8)
	x10 = 19.11 * x9
	Human_Lung_Dep_A[i] = (x1) * (x6 + x10)
	
	//DF Calc
	x1 = Human_Lung_Dep_IF[i]
	x2 = 0.0587
	x3 = (0.911/(1+exp(4.77+1.485 * ln(dp_mid_micrometers[i]))))
	x4 = (0.943/(1+exp(0.508-2.58*ln(dp_mid_micrometers[i]))))
	X5 = x2+x3+x4
	x6 = x1*x5
	Human_Lung_Dep_Total[i] = x6
	
	i++
	while(i<ncols)
	
	
	//Now we have all of the fractoinal dep waves from our midpoint SD. Let's Concatenate them into a matrix. 
//	Make/o/d/n=(0,0) SD_Frac
	wave SD_Frac
	killwaves SD_Frac
//	concatenate {Human_Lung_Dep_Total, Human_Lung_Dep_HA, Human_Lung_Dep_TB, Human_Lung_Dep_A, Human_Lung_Dep_IF}, SD_Frac
	string Frac_List = wavelist("Human*",";", "Text:0")
	concatenate Frac_List, SD_Frac
	matrixtranspose SD_Frac //Flip so we can have it be like other matrices
	note SD_Frac, "Rows 0-4 are:"
	note SD_Frac, "0: Human Lung Deposition IF: Inhalable Fraction (IF) for the particle diameter dp. "
	note SD_Frac, "1: Human Lung Deposition HA: Deposition Fraction in the head airways (DFha) for the particle diameter dp."
	note SD_Frac, "2: Human ung Deposition TB: Deposition Fraction in the tracheobronchial region (DFtb) for the particle diameter dp."
	note SD_Frac, "3: Human Lung Deposition A: Deposition Fraction in the alveolar region (DFa) for the particle diameter dp."
	note SD_Frac, "4: Human Lung Deposition Total: Total Deposition Fraction for the particle diameter dp."
	
	for(i=0; i<itemsInList(Frac_List,";");i++)
		wave tempwave = $stringFromList(i,Frac_List,";")
		killwaves tempwave
	Endfor
		 
	
	
	return SD_Frac
	
	
End



function AJD_Time_SD_N_M(nbins, dpwave, flowwave, density, twave, time_interval, SD_Base)	//Make SD of times within wave
//I think I need to use a matrix to hold all of the SDs and then see if I can work out how to use a slider to navigate them. 
	
	variable nbins, density, time_interval
	wave dpwave, flowwave, twave
	DFREF SD_Base
	String SD_Output_Part1_Str = "SD_Output_Part1"
	
	//Establish Output DF for Part 1 Code
	setdatafolder SD_Base
	
	If(dataFolderExists("SD_Output_Part1")==1)	//it does exist
		setdatafolder SD_Output_Part1
		DFREF SD_Output_Part1 = getdatafolderDFR()
	elseif(datafolderexists("SD_Output_Part1")==0)	//it does not exist
		newdataFolder/S $SD_Output_Part1_Str
		DFREF SD_Output_Part1 = getdatafolderDFR()
	endif
	
	Setdatafolder SD_Base


	//Duplicate Dpwave and apply cuts
	string rBC_or_OptDiam 
	prompt rBC_or_OptDiam, "Type 'OptDiam' or 'rBCCore' to indicate which one is being used."
	doprompt "Please input the following." , rBC_or_OptDiam
	
	if(stringmatch(rBC_or_OptDiam,"OptDiam")==1)
		variable cutmin = 180 //nm OptDiam
		variable cutmax = 300 //nm OptDiam
	elseif(stringmatch(rBC_or_OptDiam,"rBCCore")==1)
		cutmin = 80 //nm MED
		cutmax = 500 //nm MED
	else
		Abort "Invalid Input. Aborting."
	endif
	
	duplicate/O dpwave, Dpwave_Cut
	AJD_SP2_minmax_cuts(dpwave_Cut,cutmin,cutmax)
	

	///General variables
	variable npnts = dimsize(Dpwave_Cut,0)
	Variable i, j 
	variable samplevolume_Var, PSI_TotalSampleVolume
	
	//Concentration Wave Creation
	//Flowwave -> m3
	//Samplevolume -> cm3
	//m3 to cm3 -> *-1E6
	duplicate/O Flowwave, SampleVolume_cm3
//	SampleVolume_cm3 *=1E6	//m3 * 1E6cm3/m3 = cm3
	SampleVolume_cm3 = Flowwave	//m3 * 1E6cm3/m3 = cm3
	//Right now SampleVolume_cm3 is in m3; change it to cm3
	SampleVolume_cm3 *=1E6
	note SampleVolume_cm3, "Sample Volume in cm\\S3\\M."
	
	
	make/o/d/n=(nbins) dNdlogDp = 0 
	make/o/d/n=(nbins+1) dlogDp = 0 
	
	
	//Matrix Creation (need the number of bins (given) and the number of time intervals
	variable matrix_x, matrix_y, nrow,ncol
	matrix_x = nbins
	matrix_y = ceil((twave[inf]-twave[0])/time_interval)
	Make/o/d/n=(0, 0) Time_SD_Numb	//Matrix of SDs; start out with 0,0 to concatenate to this matrix later on
	Make/o/d/n=(0,0) Time_SD_Mass
	Make/o/d/n=(matrix_y) Time_SD_Midpoint //Wave showing time
	Duplicate/O Time_SD_Midpoint, Time_SD_Start
	Duplicate/O Time_SD_Midpoint, Time_SD_End
	setscale d 0, 0, "dat" Time_SD_Midpoint, Time_SD_Start, Time_SD_End
	Time_SD_Midpoint = NaN
	nrow = 0	//Row number to append starts at zero
	ncol = 0	//Column number to append starts at zero
	
	
	//SD creation
	variable dpmax, dpmin, dprange, binwidth
	dpmax = wavemax(Dpwave_Cut)
	dpmin = wavemin(Dpwave_Cut)
	dprange = dpmax-dpmin
	binwidth = dprange/nbins
//	
//	make/o/d/n=(nbins+1) bin_edges
//	bin_edges = NaN
//	make/o/d/n=(nbins) bin_midpoints
//	bin_midpoints = NaN
	
	//PSI/DMT wayto calc bin_Edges and bin_midpoints
	variable logdpmax, logdpmin
	logdpmax = log(dpmax)
	logdpmin = log(dpmin) 
	variable PSI_DeltalogDp = (logdpmax-logdpmin)/nbins
	make/o/n=(nbins+1) bin_edges = 10^(logdpmin+p*PSI_DeltalogDp)
	make/O /o/n=(nbins) bin_midpoints = 10^(logdpmin+(p+0.5)*PSI_DeltalogDp)
	dlogdp = PSI_DeltalogDp
	
	//Make some notes on waves
	note dlogDp, "Difference in the log of the upper and lower diameter bins. See " + nameofwave(bin_edges) + " for more information."
	note bin_edges, "Edges of Size Distribution Bins. Found by taking the minimum diameter + (the binwidth * the number of bin we are viewing."
	note bin_midpoints, "Midpoint Diamter of the created Size Distribution bins. Found by taking the minimum diameter (# of bin we are on + 0.5) * binwidth."
	
	//Establish Time aspects
	variable t_L, t_U, t_start, t_end, timeframe, t_midpoint
	t_start = twave[0]
	t_end = twave[inf]
	timeframe = 0
	t_U = t_Start+time_Interval
	
	variable p_start, p_end //point's for times
	variable dL, dU, pnts_in_timeframe//For SD
	
	
	for(t_start=twave[0];t_start<=t_U;t_Start=t_U)//Checkthis	//Establish Entire Timeline
		//Establish current time frame as the 0th time frame
		if(timeframe == 0) //If in the firsttime frame
		 	t_L = twave[0]
		 	t_U = t_L + time_interval
		else	//We will build the updates into the code below
		endif
		//Use Points and BinarySearch to find the points in the time wave to perform the analysis with
		if(timeframe==0)	//Binary seach is weird about first time interval, so this is to help that out. 
			p_Start=0
			p_end=binarysearch(twave,t_U)
		else
			p_start=(binarysearch(twave,t_L)+1)	//Establishes point to start timeframe
			p_end=binarysearch(twave,t_U)		//Establishes point to end timeframe
		endif
		if(p_end == -2)
			Break
		endif
		pnts_in_timeframe = p_end-p_start
		t_midpoint = (twave[p_start]+twave[p_end])/2
		//Now that we have established the points that construct the upper and lower bounds of our current timeframe, lets do some SD stuff
//here		SampleVolume_Var = sumwNans(SampleVolume_cm3,p1=p_start,p2=p_end)	//Takes care of any NaNs that happen to be in the wave.
//		PSI_TotalSampleVolume = sumWNaNs(Flowwave,p1=p_start,p2=p_end)
//			PSI_TotalSampleVolume = SumNaNs(FlowWave,p1=p_start,p2=p_end)
		Duplicate/FREE/O/R=[p_start,p_end] SampleVolume_cm3, TempTotalSampleVolume
		PSI_TotalSampleVolume = SumNaNs(TempTotalSampleVolume)	//This is in cm3
			
		for(i=0;i<nbins;i++)	//For everybin
			dL = bin_edges[i]
			dU = bin_edges[i+1]
//			dlogDp[i] = log(dU) - log(dL)		//This is my way of calculating it, but I will try the PSI/DMT way (fixed bins)
			for(j=p_Start;j<p_end;j++)	//for Dpwave_Cut within the timeframe; we start at the point within the current time frame and go up by one until the timeframe upper boundry is met
				if(Dpwave_Cut[j] >= dL && Dpwave_Cut[j] < dU)	//If within bin range
					dNdlogDp[i]+=1
				else
				endif
			Endfor
		Endfor	//End current SD loop
		
		//Take care of mass
		duplicate/O dNdlogDp,dMdlogDp
		variable k
		for(k=0;k<nbins;k++)
			dMdlogDp[k] = (dNdlogDp[k]*((pi/6)*((bin_midpoints[k]*1E-7)^3))*density)*1E6 		//Get mass to ug/cm3: binmidpoints -> nm * 1E-7 cm/1 nm ::: density -> g/cm3 ::: thus cm3 * g/cm3 = grams * 1E6 ug/g = ug (then we divide by flowrate later to get to ug/cm3)
			//dN = #/cm3 -> ug/m3
			//Density units of g/cm3 -> Mass is in ug/cm3 we change this below
		Endfor
		//THE SD PRODUCED IS dX in cm3
	
	//AJD inital way
//		dNdlogDp/=SampleVolume_Var	//go from # to #/cm3 for the current SD
//		dNdlogDp/=dlogDp	//Go into dNdlogDp

	//AJD PSI/DMT SP2 toolkit way
	//Remember for these we are making the SD so we devide by dlogdp to normalize to binwidth and then divide by flowrate to get dXdlogdp in dX/cm3
		dNdlogDp/=(PSI_TotalSampleVolume)	//Total sample volume is in cm3
		dNdlogDp/=PSI_DeltalogDp
		
		//my version is dlogdp (wave)		//Math is wrong somehow. This should give a better result. 

		
		//AJD initial way
//		dMdlogDp/=SampleVolume_Var	//this is where we get mass into ug/cm3 ; the fractional deposition model just relies on midpoint diameter in nm (actually it relies on um but I have a built in conversion) but due to dNdlogDp being in #/cm3 we need to keep the volume consistent to convert via air humans breathe later. 
//		dMdlogDp/=dlogDp
		
		//AJD PSI/DMT SP2 toolkit way
		dMdlogDp/=PSI_DeltalogDp
		dMdlogDp/=(PSI_TotalSampleVolume) //This is in cm3
		
		//At this point we have a SD that covers the time interval of choice that has been put into concentration (dN) and then normalized by the binwidth (dNdlogDp)
		//So now we need to save this SD and then append it to the matrix we encountered earlier

		concatenate {dNdlogDp}, Time_SD_Numb
		concatenate {dMdlogDp}, Time_SD_Mass
		Time_SD_Midpoint[nrow] = t_Midpoint
		Time_SD_Start[nrow] = t_L
		Time_SD_End[nrow] = t_U
		
		
		//Adjust some variables and waves before we start the next timeframe and cycle 
		t_L = t_U
		t_U += time_interval
		dNdlogDp = 0
		SampleVolume_Var = 0
		ncol = 0 
		nrow++
		timeframe++
	
	Endfor
	
	//Now we transpose the matrix to make it make sense with the time wave
	matrixtranspose Time_SD_Numb
	matrixtranspose Time_SD_Mass
	wavetransform zapnans Time_SD_Start
	wavetransform zapnans Time_SD_End
	wavetransform zapnans Time_SD_Midpoint
	
	print "Gaps in Data likley mean the time series has some holes in it"
	
	//Take care of Mass 'zeros' by making them NaNs
	for(k=0;k<(dimsize(Time_SD_Mass,0));k++)	//Rows
		for(i=0;i<dimsize(Time_SD_Mass,1);i++)	//columns
			if(Time_SD_Mass[k][i]==0)
				Time_SD_Mass[k][i] = NaN
			Endif
		endfor
	Endfor

	//Name_Bins -- enable if desired
//	Name_SD_Bins(Time_SD_Numb,bin_midpoints)

	//Make some more notes for the generated waves
	note Time_SD_End, "Ending Time for the Size Distribution Created, " + nameofwave(Time_SD_Numb) + " and " + nameofwave(Time_SD_Mass) +"."
	note Time_SD_Start, "Starting Time for the Size Distribution Created, " + nameofwave(Time_SD_Numb) + " and " + nameofwave(Time_SD_Mass) +"."
	note Time_SD_Midpoint, "Midpoint Time for the Size Distribution Created, " + nameofwave(Time_SD_Numb) + " and " + nameofwave(Time_SD_Mass) +"."
	note Time_SD_Numb, "Number Distribution in dNdlogDp (#/cm3) using the wave " + nameofwave(dlogdp) + "."
	note Time_SD_Mass, "Mass Distribution in dMdlogDp (ug/cm3) created from " + nameofwave(Time_SD_Numb) + " and " + nameofwave(dlogdp) + ". Created with the user inputted density of " + num2str(density)+ "."

	//Move waves that will not be used in part 2 code to the first output folder, and duplicate waves that will be used in part 2 to part 1 output folder. 
//Here	 dup2NF(SD_Base,SD_Output_Part1)
	 variable wlistitems 
	 string wlist2delete = ""
	 wlist2delete += wavelist("Bin_Edges",";","Text:0")
	 wlist2delete += wavelist("dNdlogDp",";","Text:0")
	 wlist2delete += wavelist("dMdlogDp",";","Text:0")
	 wlist2delete += wavelist("SampleVolume_cm3",";","Text:0")
	 wlist2delete += wavelist("Time_SD_End",";","Text:0")
	 wlist2delete += wavelist("Time_SD_Start",";","Text:0")
	 wlist2delete += wavelist("Time_SD_End",";","Text:0")
	
	wlistitems = itemsInList(wlist2delete,";")
	for(i=0;i<wlistitems;i++)
		wave tempwave = $stringfromList(i,wlist2delete,";")
		killwaves tempwave
	endfor
	
	setdatafolder SD_Output_Part1
	wlist2delete = ""
	//Get rid of the waves inputted, they can stay in the parent data folder
	wlist2delete += wavelist("dMdlogDp",";","Text:0")
	wlist2delete += wavelist("dNdlogDp",";","Text:0")
	wlist2delete += wavelist("SampleVolume_Cm3",";","Text:0")
	wlist2delete += wavelist("*Diam",";","Text:0")
	wlist2delete += nameofwave(Dpwave_Cut)
	wlist2delete += ";"
	wlist2delete += nameofwave(flowwave)
	wlist2delete += ";"
	wlist2delete += nameofwave(twave)
	
	wlistitems = itemsInList(wlist2delete,";")	//List + 3 input waves  
	
	for(i=0;i<wlistitems;i++)
		wave tempwave = $stringfromList(i,wlist2delete,";")
		killwaves tempwave
	endfor
	
	
 
 setdatafolder SD_Base
 
 //The distributions produced from this code are dNdlogdp and dMdlogdp in dX/cm3

End







//////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////SMPS IMPORTED DATA STUFF/////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////

Function AJD_SMPS_HumanLung_Prep(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			AJD_SMPS_Transformer()
		case 2:
			break
		endswitch
end

function SD2MD(nconc, diam, density)
	wave nconc, diam
	variable density
	Duplicate/o Nconc MConc
		MConc = NaN
		
		variable h, g
		
		for(h=0;h<dimsize(MConc,0);h+=1)
			for(g=0;g<dimsize(MConc,1);g+=1)
				MConc[h][g] = Nconc[h][g] * pi/6*diam[g]^3*1E-9*density	  // if density is g/cm, then unit is ug/m3
			endfor
		endfor
end

Function dostuff2List(list)
	
	string list
	variable nitems = itemsinlist(list,";")
	variable idx
	for(idx=0;idx<nitems;idx++)
		wave tempwave = $stringfromlist(idx,list,";")
		tempNaN2Value(tempwave)
	endfor

end

Function tempNaN2Value(w)

	wave w
	variable npnts = dimsize(w,0)
	variable idx
	for(idx=0;idx<npnts;idx++)
		if(numtype(w[idx])==2)
			w[idx]=-9999
		endif
	endfor
	
//	w = w[p] == NaN ? 0 : w[p]
	
End

function tempNC2VC(ND,diam)

	wave ND, diam
	Duplicate/O ND, VD
	Variable g=0, h=0
		For(h=0; h<dimsize(VD,0);h+=1)
			For(g=0; g<dimsize(VD,1);g+=1)
				VD[h][g] = ND[h][g] * pi/6*diam[g]^3 * 1E-9 // units of um^3/cm^3
				variable check = diam[g]
			endfor
		endfor


End

function AJD_SMPS_Transformer()//Takes Data Generated by saving the Icartt waves generated by the Farmer Group Data Processor and gets them ready for the human lung dep processor. 
	
	DFREF SMPS_Main = getdatafolderDFR()
	
	
	
	//Concatenate the Number Distribution 
	string MidpointDiamlist = wavelist("MdPtDiam*",";","Text:0")
	concatenate/O MidpointDiamlist, SMPS_NumberConc
	variable nrows = dimsize(SMPS_NumberConc,0)
	variable ncols = dimsize(SMPS_numberConc, 1)
	variable i , j
	for(i=0;i<nrows;i++)
		for(j=0;j<ncols;j++)
			if(SMPS_NumberConc[i][j] == -9999)
				SMPS_NumberConc[i][j] = NaN
			else
			endif
		Endfor
	Endfor

	//Determine Midpoints of waves
	variable nitems
	string currstr, replacedstr, MidpointList, str_forwave = ""
	nitems = itemsinlist(MidpointDiamList,";")
	make/o/d/n=(nitems) SMPS_Midpoint_Diameter
	for(i=0;i<nitems;i++)
		currstr = stringfromlist(i,MidpointDiamList,";")
		replacedstr = replacestring("MdPtDiam",currstr,"")	//Take out MdPtDiam
		replacedstr = replacestring("_",replacedstr,".")	//Replace _ with . (i.e. 710_5 becomes 710.5)
		MidpointList += replacedstr+";"	//Add it to the new list
		str_forwave = replacedstr
		SMPS_Midpoint_Diameter[i] = str2num(str_forwave)
	Endfor
	
	//Duplicate creates waves to temp output folder as well as timedate waves
	NewdataFolder/O/S SMPS_Temp_Output
	DFREF SMPS_Output = GetdatafolderDFR()
	setdatafolder SMPS_Main
	wave Time_Start_Local, Time_Stop_Local, Time_Mid_Local
	duplicate/O SMPS_Main:SMPS_NumberConc, SMPS_Output:SMPS_NumberConc
	duplicate/O SMPS_Main:SMPS_Midpoint_Diameter, SMPS_Output:SMPS_Midpoint_Diameter
	duplicate/O Time_Start_Local, SMPS_Output:Time_Start_Local
	duplicate/O Time_Stop_Local, SMPS_Output:Time_Stop_Local
	duplicate/O Time_Mid_Local, SMPS_Output:Time_Mid_Local


End


Function AJD_SMPS_HumanLung(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string df, density, N_or_M, dlogdp_str
			prompt df, "Please provide the full path to the data folder that holds the extracted SMPS Waves"
			prompt density, "Please provide the wave that has the point to point density from the ACSM."
			prompt dlogdp_str, "Please provide the wave that has the dlogDp values."
			prompt N_or_M, "Do you want to run this code with number or mass?"
			doprompt "Please Provide the Following Information.", df, density,N_or_M, dlogdp_Str
			DFREF SMPS_DF = $df
			wave dwave = $density
			wave dlogdp_wave = $dlogdp_Str
			variable N_or_M_var  
			if(stringmatch(N_or_M,"Number") == 1)
				N_or_M_var = 1
			elseif(stringmatch(N_or_M,"Mass") == 1)
				N_or_M_var = 2
			else
			endif
			
			if(N_or_M_Var ==1)
				AJD_SMPS_HumanLungDep(dwave, N_or_M,N_or_M_var, dlogdp_wave)
			elseif(N_or_M_Var == 2)
				AJD_SMPS_HumanLungDep(dwave, N_or_M,N_or_M_var, dlogdp_wave)
			else
			abort "String Input Error. Aborting" 
			endif
		case 2:
			break
		endswitch
end


Function AJD_SMPS_HumanLungDep(dwave, N_or_M, N_or_M_var,dlogdp_wave)
	//Establish parameters
	wave dwave, dlogdp_wave
	string N_or_M
	variable N_or_M_var
	
	Variable CreateSD
	
	//Establish waves in the SMPS Df
	wave SMPS_Midpoint_Diameter, SMPS_NumberConc, Time_Mid_Local, Time_Start_Local, Time_Stop_Local
	
	//We already have established Time_Start, Stop, and Midpoint as well as a NumberConc Matrix and Midpoint Diameters
	//We need a mass conc but otherwise we save a lot of time by not having to start form scratch. 
	
	
	//get to mass conc for Numb conc
	variable i, j 
	duplicate/O SMPS_NumberConc, SMPS_MassConc
	for(i=0;i<dimsize(SMPS_MassConc,0);i+=1)
			for(j=0;j<dimsize(SMPS_MassConc,1);j+=1)
				SMPS_MassConc[i][j] = (SMPS_NumberConc[i][j] * pi/6*(SMPS_Midpoint_Diameter[j]*1E-7)^3*dwave[i])*1E6 // units Nconc: #/cm3 ; SMPS_Midpointdia: (nm*1E-7cm/nm)^3 ; Density: g/cm3 ->>> nm to cm to cancel out with density -> g/cm3 left over then multiply by 1E6 to get ug/cm3 which is needed for code. cm3 gets cancelled out later with breathing volume
			endfor
		endfor
		
	//Notes
	note SMPS_NumberConc, "dNdlogDp (#/cm3)"
	note SMPS_MassConc, "dMdlogdp in units of ug/cm3." 
	//Now we have our dNdlogdp and dMdlogDp, and with our dlogdp and our midpoint time this is pretty easy to feed into our Dep_Lung_SD() funciton already created
	//Lets throw in some parameters to satisfy the code
	string startingwlist = wavelist("*", ";","Text:0")
	DFREF SD_Base = GetDatafolderDFR()
	if(N_or_M_var == 1)	//Number
			Dep_Lung_SD(SMPS_NumberConc,SMPS_Midpoint_Diameter, dlogdp_wave, Time_Mid_Local, SD_Base,startingwlist, CreateSD) // Take a SD (for my purposes Mass) and then apply the fractional deposition code to determine fractional deposition as a funciton of SD.
	elseif(N_or_M_var ==2) //Mass
			Dep_Lung_SD(SMPS_MassConc,SMPS_Midpoint_Diameter, dlogdp_wave, Time_Mid_Local, SD_Base,startingwlist, CreateSD) // Take a SD (for my purposes Mass) and then apply the fractional deposition code to determine fractional deposition as a funciton of SD.
	endif

	
	

End








/////////////////////////////////////////////////////////////////////
/////////////////////////////Graph Maker/////////////////////////////
/////////////////////////////////////////////////////////////////////

//Button function for graph making
Function AJD_Graph_Maker(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the data folder with the waves of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2)
				abort "Not in the correct Data Folder. Aborting procedure."
			endif
			String Sigwave_Str = ""
			String DT_Wave_Str = ""
			String graphname_Str = ""
			prompt Sigwave_Str, "What is the name of the Signal Wave?"
			prompt DT_Wave_Str, "What is the name of the DateTime Wave?"	
			prompt graphname_Str, "What is the name of the graph to be created?"	
			doprompt "Please Enter the following infomation.", Sigwave_Str, DT_Wave_Str, graphname_Str
			if(V_Flag==1)
				abort "User Aborted."
			else
			endif
			wave Sigwave = $Sigwave_Str
			wave DT_Wave = $DT_Wave_Str
			AJD_Make_Graph(Sigwave,DT_Wave,graphname_str)
		case 2:
			break
		endswitch
end

//Function Purpose: Make a graph with the inputted signal wave and time wave; and name it what the string input is. 
//Although I have made this to take in a signal wave and graph wave, but it can work with non-date waves. Sigwave = Y axis and DT_Wave = X axis
//You will have to change the X-axis units to non-datetime (on the label)
Function AJD_Make_Graph(Sigwave,DT_Wave,graphname_str)
	//Define parameters
	wave Sigwave, DT_Wave
	string graphname_str
	
	//Set up the graph
	display/N=$graphname_str Sigwave vs DT_Wave		//Display the graph with the name being designated by the /N flag and the string (graphname_str) which can be passed due to $
	//Change the graph to make it a bit better
	ModifyGraph rgb=(0,0,0), nticks=100
	//Set up the axis labels by getting the name of the signal wave inputted (as a string)
	string signal_str = nameofwave(Sigwave)
	//Label y and x axis
	Label left signal_str +" (units)";DelayUpdate
	Label bottom "TimeDate (Local)"
	//Establish a legend
	Legend
End

//Button function for appending graphs
Function AJD_Graph_Appender(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the data folder with the waves of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2)
				abort "Not in the correct Data Folder. Aborting procedure."
			endif
			String Sigwave_Str = ""
			
			String graphname_Str = ""
			prompt Sigwave_Str, "What is the name of the signal Wave to be appended?"
			prompt graphname_Str, "What is the name of the graph to append the signal wave to?"	
			doprompt "Please Enter the following infomation.", Sigwave_Str, graphname_Str
			if(V_Flag==1)
				abort "User Aborted."
			else
			endif
			wave Sigwave = $Sigwave_Str
			
			AJD_Append2Graph(Sigwave,graphname_str)
		case 2:
			break
		endswitch
end

//Function Idea: With a graph (with a name) provided append a Y_axis wave to it.
//This really is for a simple graph, any things with more advanced graphs should be handled outside of this function. 
Function	AJD_Append2Graph(Sigwave,graphname_str)
	//Establish parameters
	wave Sigwave
	string graphname_str
	
	//Bring up the window asked for and set it to the front
	dowindow/F $graphname_str
	if(V_Flag == 0)
		abort "No graph of the inputted name detected"
	else
	endif
	
	//Use strings to establish some names and alter others
	string x_axis_info = axisinfo(graphname_str,"bottom")
	string x_axis_name_pre = stringfromList(2, x_axis_info)
	string x_axis_name_final = replacestring("CWAVE:", x_axis_name_pre,"")

	//Append the new signal wave to the graph
	appendtograph Sigwave vs $x_axis_name_final

End




Function AJD_Mixing_State_Diagram(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the data folder with the waves of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2)
				abort "Not in the correct Data Folder. Aborting procedure."
			endif
			Mixing_State_Diagram()
		case 2:
			break
		endswitch
end


function Mixing_State_Diagram()
	
	wave Da, Dy, Mix_Idx_X
	
	Dowindow/K Mix_State_Graph
	Display/N=Mix_State_Graph Dy vs Da
	DoWindow/T Mix_State_Graph,"Mixing_State_Graph:Dy vs Da"
	Label left "\\f01Dγ\\f00";DelayUpdate
	Label bottom "\\f01D\\Bα\\M\\f01";Delayupdate
	ModifyGraph zColor(Dy)={Mix_Idx_X,*,*,Rainbow,0}
	ColorScale/C/N=text0/A=MC trace=Dy;DelayUpdate
	ColorScale/C/N=text0 "Mixing State (Χ)"
	ColorScale/C/N=text0/A=RC/X=-1.51/Y=0.98
	ModifyGraph mode=3,marker=19
	ModifyGraph nticks=100
	
	

End



/////////////////////////////////////////////////////////////////////
////////////////////ACSM PMF Exportation Edit Functions//////////////
/////////////////////////////////////////////////////////////////////
///////////At least in my experience the PMF exportation/////////////
///////////on TOFWERK sucks if you need to make any edits////////////
///////////so these fucntions are supposed to be used if/////////////
///////////you need to do that. Export with button and //////////////
///////////then perform these functions on the generated/////////////
///////////waves before you run them through PMF/////////////////////
/////////////////////////////////////////////////////////////////////


//Things to accomplish
//1. Sucessful deletion or NaN of points (start with nan) => DONE
//2. Sucessful averaging of points => Done
//3. Sucessful duplication of new imporved waves that are ready for PMF => Done
//Optional -> Linear Interpolation of spikes and smoothing?


Function PMF_NaNMatrixButt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string OrgDataMatrix_str,OrgErrMatrix_str,errwave_str,twave_str
			prompt OrgDataMatrix_str,  "Enter in the Organic Data matrix to be used."
			prompt OrgErrMatrix_str,  "Enter in the Organic Error Matrix to be used."
			prompt errwave_str, "Enter in the Error wave to be used."
			prompt twave_str, "Enter in the time wave to be used."
			doprompt "Enter in the following information.", OrgDataMatrix_str, OrgErrMatrix_str, Errwave_str, twave_str
			wave OrgDataMatrix = $OrgDataMatrix_str
			wave OrgErrmatrix = $OrgErrMatrix_str
			wave errwave = $Errwave_str
			wave twave = $twave_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			PMF_NaNMatrix(OrgDataMatrix,OrgErrmatrix, errwave, twave)
		case 2:
			break
		endswitch
end

//AJD 10/2/2024
//Idea: NaN important waves over a pointrange provided by user
Function PMF_NaNMatrix(OrgDataMatrix,OrgErrmatrix, errwave, twave)

	wave OrgDataMatrix,OrgErrmatrix, errwave, twave //Org_Data, Org_Err, min_Err, tseries waves
	
	//Establish General variables
	variable i, pointstart, pointend
	variable nrows = dimsize(OrgDataMatrix,0)
	variable ncolumns = dimsize(OrgErrmatrix,0)
	
	
	//Duplicate with new names
	duplicate/O OrgDataMatrix, AJD_Org_Data
	duplicate/O OrgErrmatrix, AJD_Org_Err
	duplicate/O errwave, AJD_minErr
	duplicate/O twave, AJD_tseries
	
	//Find start and end points for NaN range
	prompt pointstart, "Starting point of row to NaN."
	prompt pointend, "Ending point of row to NaN."
	doprompt "Please provide the following information.", pointstart, pointend
	
	
	//Perform NaNing option for all matricies and errwave
	for(i=pointstart;i<(pointend+1);i++)
		AJD_Org_Data[i][] = NaN	//Only declare row as change will apply to every column in said row
		AJD_Org_Err[i][] = NaN
		AJD_MinErr[i] = NaN
	Endfor
	
	//Print message
	print "PMF Matricies duplicated (indicated by 'AJD') and NaN values applied from "+num2str(pointstart)+" to "+num2str(pointend)+"."
	print "If there are more areas to NaN then repeat this process."
//	OrgDataMatrix = OrgDataMatrix[p][q] == 0 ? NaN : OrgDataMatrix[p][q]
//	OrgErrmatrix = OrgErrmatrix[p][q] == 0 ? NaN : OrgErrmatrix[p][q]
End

Function PMF_AvgMatrixButt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			
			string OrgDataMatrix_str,OrgErrMatrix_str,errwave_str,twave_str
			prompt OrgDataMatrix_str,  "Enter in the Organic Data matrix to be used."
			prompt OrgErrMatrix_str,  "Enter in the Organic Error Matrix to be used."
			prompt errwave_str, "Enter in the Error wave to be used."
			prompt twave_str, "Enter in the time wave to be used."
			doprompt "Enter in the following information.", OrgDataMatrix_str, OrgErrMatrix_str, Errwave_str, twave_str
			wave OrgDataMatrix = $OrgDataMatrix_str
			wave OrgErrmatrix = $OrgErrMatrix_str
			wave errwave = $Errwave_str
			wave twave = $twave_str
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			PMF_AvgMatrix(OrgDataMatrix,OrgErrmatrix, errwave, twave)
		case 2:
			break
		endswitch
end

//AJD 10/2/2024
//Idea: take the matrix inputted by the user and perform a time averaging 
Function PMF_AvgMatrix(OrgDataMatrix,OrgErrmatrix, errwave, twave)
	
	wave OrgDataMatrix,OrgErrmatrix, errwave, twave
	
	//Establish General variables
	Variable i,j,k, timeavg, pcurr_start,pcurr_end, start_frame, end_frame
	variable timestart = twave[0]
	variable timeend = twave[inf]
	variable nrows = dimsize(OrgDataMatrix,0)
	variable ncolumns = dimsize(OrgDataMatrix,1)
	j=0
	
	//duplicate waves
	duplicate/O OrgDataMatrix, AJD_Org_Data_TimeAvg
	duplicate/O OrgErrmatrix, AJD_Org_Err_TimeAvg
	duplicate/O errwave, AJD_minErr_TimeAvg
	duplicate/O twave, AJD_tseries_TimeAvg
	
	//Set nessesary duplicate waves to NaN
	AJD_Org_Data_TimeAvg = NaN
	AJD_Org_Err_TimeAvg = NaN
	AJD_minErr_TimeAvg = NaN
	
	
	//Ask for time averaging 
	prompt timeavg, "What is the time averaging (seconds) that is desired?"
	doprompt "Please provide the following information.", timeavg
	
	
//Perform time averaging
	//Establish initial time frame	//For sanity check/testing purposes 
	start_frame = binarysearch(twave,timestart)
	end_frame = binarysearch(twave,timestart+timeavg)
	
	
	
	
	for(i=timestart;i<timeend;i+=timeavg)	//Start on twave[0] and end on twave[inf] with each iteration (timeframe) being equal to the timeavg inputted by user
		
		//Use binary search to find timeframe (allows for some easier calculations through the use of points)
		//The way binary search works there will be overlap in the data taken from the current pcurr_start and next pcurr_end
		//We can get around this by pushing up the point to be used at pcurr_start by 1 after the first iteration and can use the established variable j to do this
		pcurr_start = binarysearch(twave,i)
		pcurr_end = binarysearch(twave,(i+timeavg))
		
		if(pcurr_end==-2)//Binary search is beyond the last value
			pcurr_end = (dimsize(twave,0)-1)
		endif
		
		
		if(j==0)
		//do nothing
		elseif(j!=0)
			pcurr_start+=1
		endif	
		
		//do some averaging calcs (need for loop to loop through columns)
		for(k=0;k<ncolumns;k++)	//Loop through all of the columns in the matrix (matrices should be same dimensions)
			wavestats/Q/RMD=[pcurr_start,pcurr_end][k] OrgDataMatrix	
			AJD_Org_Data_TimeAvg[j,j][k,k] = V_Avg									
			wavestats/Q/RMD=[pcurr_start,pcurr_end][k] OrgErrmatrix
			AJD_Org_Err_TimeAvg[j,j][k,k] = V_Avg
		Endfor
		wavestats/Q/R=[pcurr_Start,pcurr_end] errWave
		AJD_minErr_TimeAvg[j] = V_Avg
		AJD_tseries_TimeAvg[j] = (twave[pcurr_Start]+twave[pcurr_end])/2
		
		//We have averaged over the desired time period, move on to the next timeframe
		j++ //increase the index of where the averaged value is stored
		
	Endfor
	
	//Cleanup after averaging is completed
	redimension/N=(j,ncolumns)  AJD_Org_Data_TimeAvg
	redimension/N=(j,ncolumns)  AJD_Org_Err_TimeAvg
	redimension/N=(j) AJD_minErr_TimeAvg
	redimension/N=(j) AJD_tseries_TimeAvg

	note AJD_tseries_TimeAvg, "Found by taking the midpoint time of the boundries of the time interval."
	
End



Function PMF_OrganizewavesButt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			variable V_Flag
			if(V_Flag==0)
			elseif(V_flag==1)
				Abort "User Aborted."
			endif
			PMF_PrepWaves()
		case 2:
			break
		endswitch
end

//AJD 10/2/2024
//Idea: We have messed with some waves to better prepare them for PMF, now finalize the Prepfor said waves
Function PMF_PrepWaves()

	//Establish New DF
	DFREF Start_DF = getdatafolderDFR()
	newdataFolder/O/S AJD_PMF_Waves
	DFREF PMF_Waves_DF = getdatafolderDFR()
	setdatafolder Start_DF
	
	//Duplicate Waves that we have not in other functions
	wave MSS_Base, mz_text
	Duplicate/O MSS_Base, AJD_MSS_Base
	Duplicate/O mz_text, AJD_mz_text
	
	//Establish variables	
	variable nwaves_total = CountobjectsDFR(Start_DF,1)
	string AJD_wavelist = wavelist("AJD*",";","CMPLX:0")
	variable nwaves_AJD = itemsinlist(AJD_wavelist,";")

	variable i 
	string wname	
	for(i=0;i<nwaves_AJD;i++)
		wname = stringfromList(i,AJD_wavelist)
		duplicate/O Start_DF:$wname, PMF_Waves_DF:$wname
	Endfor
	
End


/////////////////////////////////////////////////////////////////////
///////////////////////ACSM Data QAQC Functions//////////////////////
/////////////////////////////////////////////////////////////////////


//Todo: 
//1. Remove Spikes
//2. Find LOD

Function ACSM_Tseries_Basic_Filter_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the data folder with the ACSM's Time Series waves of intrest? Are you entering pre-treated data for large spikes? If not do not continue, the funciton ran is designed to work without large spikes (>100 ug/m3 difference)."
			if(V_flag==1)
			elseif(V_Flag==2)
				abort "Not in the correct Data Folder. Aborting procedure."
			elseif(V_Flag==3)
				abort "Not in the correct Data Folder. Aborting procedure."
			endif
			ACSM_Tseries_Basic_Filter()
		case 2:
			break
		endswitch
end

//AJD 10/3/24
//Idea: From freshly exported data ACSM Tseries Data perform Basic QAQC on the data (e.g. filtering spikes)
Function ACSM_Tseries_Basic_Filter()

	//Set up all data folders
	DFREF Start_DF = getdatafolderDFR()
	newdatafolder/O/S AJD_ACSM_BasicQAQC
	DFREF ACSM_DF = getdatafolderDFR()
	
	setdatafolder Start_DF
	
	//Get a wavelist of all of the waves
	variable nwaves = CountobjectsDFR(Start_DF,1)
	string ACSM_Waves = wavelist("*",";","CMPLX:0")
	
	//Move waves to new DF
	variable i 
	string wname1, wname2
	for(i=0;i<nwaves;i++)
		wname1 = stringfromList(i,ACSM_Waves)
		wname2 = "AJD_"+stringfromlist(i,ACSM_Waves)
		duplicate/O Start_DF:$wname1, ACSM_DF:$wname2
	Endfor
	
	//Set datafolder to new folder
	setdatafolder ACSM_DF
	string AJD_Org = wavelist("AJD_Org*",";","CMPLX:0")
	string AJD_NO3 = wavelist("AJD_NO3*",";","CMPLX:0")
	string AJD_SO4 = wavelist("AJD_SO4*",";","CMPLX:0")
	string AJD_NH4 = wavelist("AJD_NH4*",";","CMPLX:0")
	string AJD_Chl = wavelist("AJD_Chl*",";","CMPLX:0")
	string AJD_t_base = wavelist("AJD_t_base*",";","CMPLX:0")
	
	
	//Reference all of the waves
	wave pOrg = $stringfromlist(0,AJD_Org)
	wave pNO3 = $stringfromlist(0,AJD_NO3)
	wave pSO4 = $stringfromlist(0,AJD_SO4)
	wave pNH4 = $stringfromlist(0,AJD_NH4)
	wave pChl = $stringfromlist(0,AJD_Chl)
	wave tseries = $stringfromlist(0,AJD_t_base)
	
	//Make a flag wave
	duplicate/O pOrg, Flag_Wave
	Flag_Wave = NaN
	
	
	//Duplicate Waves
	Duplicate/O pOrg, pOrg_NaNSpikes
	Duplicate/O pNO3, pNO3_NaNSpikes
	Duplicate/O pSO4, pSO4_NaNSpikes
	Duplicate/O pNH4, pNH4_NaNSpikes
	Duplicate/O pChl, pChl_NaNSpikes
	
	//Make some notes
	Note pOrg, "Spikes are NaNed."
	Note pNO3, "Spikes are NaNed."
	Note pSO4, "Spikes are NaNed."
	Note pNH4, "Spikes are NaNed."
	Note pChl, "Spikes are NaNed."
	
	//Duplicate waves for linear interpretation
	Duplicate/O pOrg, pOrg_LSpikes
	Duplicate/O pNO3, pNO3_LSpikes
	Duplicate/O pSO4, pSO4_LSpikes
	Duplicate/O pNH4, pNH4_LSpikes
	Duplicate/O pChl, pChl_LSpikes
	
	//Make some notes
	Note pOrg_LSpikes, "Spikes that have been NaNed have been linearly interpolated."
	Note pNO3_LSpikes, "Spikes that have been NaNed have been linearly interpolated."
	Note pSO4_LSpikes, "Spikes that have been NaNed have been linearly interpolated."
	Note pNH4_LSpikes, "Spikes that have been NaNed have been linearly interpolated."
	Note pChl_LSpikes, "Spikes that have been NaNed have been linearly interpolated."
	
	//NaN spikes and then Linearly Interpret NaNed areas //Done according to FIND REFERENCE
	//For a point if its neighbors are 10* less than it, then that is considered a spike
	Spike2NaNs(pOrg_NaNSpikes,tseries,Flag_Wave)
	DOE_Linterp_Spikes(tseries, pOrg_LSpikes, Flag_Wave)
	Flag_Wave = NaN
	Spike2NaNs(pNO3_NaNSpikes,tseries,Flag_Wave)
	DOE_Linterp_Spikes(tseries, pNO3_LSpikes, Flag_Wave)
	Flag_Wave = NaN
	Spike2NaNs(pSO4_NaNSpikes,tseries,Flag_Wave)
	DOE_Linterp_Spikes(tseries, pSO4_LSpikes, Flag_Wave)
	Flag_Wave = NaN
	Spike2NaNs(pNH4_NaNSpikes,tseries,Flag_Wave)
	DOE_Linterp_Spikes(tseries, pNH4_LSpikes, Flag_Wave)
	Flag_Wave = NaN
	Spike2NaNs(pChl_NaNSpikes,tseries,Flag_Wave)
	DOE_Linterp_Spikes(tseries, pChl_LSpikes, Flag_Wave)


End


Function Spike2NaNs(swave,twave,fwave)
	wave swave,twave,fwave
	variable i,j
	variable npnts = dimsize(swave,0)
	make/o/d/n=(npnts) Flag_Wave = 0 
	Variable pvalue, nvalue, currvalue, diff1,diff2 //Previous, next, and current values and difference
	variable Spike_high, spike_low

	for(i=0;i<npnts;i++)
		if(i==0)
			currvalue = swave[i]
			nvalue = swave[i+1]
			diff2 = nvalue/currvalue
			
			if(diff2 > 5)
				Spike_High = 1
			elseif(diff2 < 0.2)
				Spike_Low = 1
			else
				Spike_High=0
				Spike_Low=0
			endif
			
			if(Spike_High==1 || Spike_Low ==1)
				Flag_Wave[i] = 1
			else
				Flag_Wave[i] = 0 
			endif
			
		elseif(0<i<(npnts-1))
			pvalue = swave[i-1]
			currvalue = swave[i]
			nvalue = swave[i+1]
			diff1 = abs(currvalue/pvalue)
			diff2 = abs(currvalue/nvalue)
			
			if(diff1 > 5 && diff2 > 5)
				Spike_High = 1
			elseif(diff1 < 0.2 && diff2 < 0.2)
				Spike_Low = 1
			else
				Spike_High=0
				Spike_Low=0
			endif
			
			if(Spike_High==1 || Spike_Low ==1)
				Flag_Wave[i] = 1
			else
				Flag_Wave[i] = 0
			endif
			
		elseif(i==(npnts-1))
			pvalue = swave[i-1]
			currvalue = swave[i]
			diff1 = currvalue/pvalue
			
			if(diff1 > 5 && diff2 > 5)
				Spike_High = 1
			elseif(diff1 < 0.2 && diff2 < 0.2)
				Spike_Low = 1
			else
				Spike_High=0
				Spike_Low=0
			endif
			
			if(Spike_High==1 || Spike_Low ==1)
				Flag_wave[i] = 1
				swave = fwave == 1 ? NaN : swave
				return -1 
			else
				Flag_wave[i] = 0 
				swave = fwave == 1 ? NaN : swave
				return -1
			endif
		endif
	
	Endfor

	

End

function DOE_Linterp_Spikes(twave, swave, fwave)	//time, signal and flag wave

	wave twave, swave, fwave
	variable i, p0, p1, p2, avg_value
	variable npnts = dimsize(twave,0)
	for(i=0;i<npnts;i++)
		if(fwave[i] == 1)
			if(i==0)
				swave[i] = NaN
				continue
			elseif(i== npnts-1)
				swave[i] = NaN
				continue
			else
				p0 = swave[i-1]
				p1 = swave[i] 
				p2 = swave[i+1]
			endif
			if(fwave[i-1] == 1 || fwave[i+1] == 1) //If the number we are using to linearly interpolate is also a spike.
				swave[i] = NaN //NaN it, to interpolate beyond 1 point over in either direction is not a good practice. 
			else
				avg_value = (p0+p2)/2
				swave[i] = avg_value
			endif
		elseif(fwave[i] == 0)
		Endif
	Endfor

End




Function GeneralTS_FilterbyMinPnt_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Order of Operation" 2, "Are the Folder containing the ACSM time series signal wave set as the current data folder?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			Variable LOD_Var
			String Sigwave_Str = ""
			prompt Sigwave_Str, "Please enter the name of the Signal Wave."
			prompt LOD_Var, "Please enter the LOD value corresponding to the signal wave"
			doprompt "Please Enter the following infomation.", Sigwave_Str, LOD_Var
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave SigWave = $Sigwave_Str
			ACSMLOD_Filter(SigWave, LOD_Var)
		case 2:
			break
		endswitch
end

//AJD 3/8/2025
//From user provided LOD, duplicate the signal wave and apply the LOD
function ACSMLOD_Filter(SigWave, LOD_Var)
	
	//Establish Funtion Variables
	wave SigWave
	variable LOD_Var
	
	//Establish Local Variables
	variable i, npnts
	npnts = dimsize(SigWave,0)
	
	//Duplicate SigWave
	String wName_LOD = nameofwave(Sigwave)+"_LOD_Applied"
	Duplicate SigWave, $wName_LOD
	wave wLOD = $wName_LOD
	
	//Establish for-loop
	for(i=0;i<npnts;i++)
		if(numtype(wLOD[i])==0) //If this is a normal number
			if(wLOD[i]<LOD_Var) //If the value is less than the LOD NaN it
				wLOD[i] = NaN
			elseif(wLOD[i]>=LOD_Var)	//If the value is greater than or equal to the LOD then do nothing with it
			endif
		
		elseif(numtype(wLOD[i])==1)	//If this contains +/- INF
			Abort "Error in wave at point "+num2str(i)+" +/- inf value found."
		
		elseif(numtype(wLOD[i])==2)	//If this contains NaN
			wLOD[i]= NaN
		
		else
			Abort "Error in wave at point "+num2str(i)
			
		endif
	
	endfor

	//Make a note for the generated wave
	note wLOD, "Wave generated from an LOD of " +num2str(LOD_Var)+"."


end























Function ACSM_Tseries_Basic_Filter_General_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the data folder with the ACSM's Time Series waves of intrest? Are you entering pre-treated data for large spikes? If not do not continue, the funciton ran is designed to work without large spikes (<100 ug/m3 difference)."
			if(V_flag==1)
			elseif(V_Flag==2)
				abort "Not in the correct Data Folder. Aborting procedure."
			elseif(V_Flag==3)
				abort "Not in the correct Data Folder. Aborting procedure."
			endif
			string swave_str = ""
			string twave_str = ""
			prompt swave_str, "Enter the Wave in the current Data Folder that you want to run through the basic filter."
			prompt twave_str, "Enter in the time wave to be used."
			doprompt "Please Enter the Following Information.", swave_str, twave_str
			wave twave = $twave_str
			wave swave = $swave_str
			ACSM_Tseries_Basic_Filter_General(twave,swave)
		case 2:
			break
		endswitch
end


Function ACSM_Tseries_Basic_Filter_General(twave,swave)

	wave twave,swave
	
	duplicate/O swave, Flag_Wave
	string swave_NaNspikename = nameofwave(swave)+"_NaNSpikes"
	string swave_Lspikename= nameofwave(swave)+"_LSpikes"
	
	duplicate/O swave, $swave_NaNspikename
	wave NaNSpikeWave = $swave_NaNspikename
	duplicate/O swave, $swave_Lspikename
	wave LSpikeWave = $swave_Lspikename
	Flag_Wave = 0
	
	variable npnts = dimsize(swave,0)
	
	Spike2NaNs(NaNSpikeWave,twave,Flag_Wave)
	DOE_Linterp_Spikes(twave, LSpikeWave, Flag_Wave)


End




/////////////////////////////////////////////////////////////////////
///////////////////////FUNCTIONS WITHOUT BUTTONS/////////////////////
/////////////////////////////////////////////////////////////////////



Function TSIStatistics_functionfree(Wave dWdlogDp, Wave Diam)

	variable GeoMean, GeoSD, AvgConc
	
	
	Make/O/N=(numpnts(Diam)) GM_num
	Make/O/N=(numpnts(Diam)) GM_den
	
	Make/O/N=(numpnts(Diam)) W
	
	Duplicate/O diam binwidth
	binwidth = Nan
	variable i
	For (i=0; i<(numpnts(binwidth)-1);i++)
		binwidth[i] = diam[i+1]-diam[i]
	
	EndFor
	
	Duplicate/O diam dlogDp 
	dlogDp = Nan
	dlogDp = log(diam+0.5*binwidth)-log(diam-0.5*binwidth)
	
	Variable j
	variable numbins = numpnts(diam)
	
	Make/FREE/N=(numbins) Dl, Du

	For (j=0; j<numbins; j++)
		if (j == 0)
			Dl[j] = diam[j] - 0.5*binwidth[j]
			Du[j] = diam[j] + 0.5*binwidth[j]	
		elseif (j == (numbins-1))
			Dl[j] = diam[j] - 0.5*binwidth[j-1]
			Du[j] = diam[j] + 0.5*binwidth[j-1]
		else
			Dl[j] = diam[j] - 0.5*binwidth[j-1]
			Du[j] = diam[j] + 0.5*binwidth[j]	
		endif
	
	dlogDp[j] = log(Du[j])- log(Dl[j])	
	EndFor
	
	W=DWdlogDp*dlogDp
	
	Make/O/N=(numpnts(W)) AddW
	AddW=W[i]
	For (i=1; i<(numpnts(W)); i++)
		AddW[i] = AddW[i-1]+W[i]
	EndFor
	
	GM_num = W * ln(diam)
	GM_den = W
	GeoMean = exp(Sum(GM_num)/Sum(GM_den))
	
	Print "Geometric Mean is " + num2str(GeoMean)
	
	GM_num = W * ( ln(diam)-ln(GeoMean) )^2
	GM_den = W
	GeoSD = exp(sqrt(Sum(GM_num)/Sum(W)))
	Print "Geometric Standard Devation is " + num2str(GeoSD)
	
	AvgConc = sum(W)
	Print "Total Num Conc is " + num2str(Sum(W))
	
	Killwaves AddW, binwidth, dlogDp, GM_den, GM_num, W
	
End


function AJD_SP2_minmax_cuts(dpwave,cutmin,cutmax)

	wave dpwave
	variable cutmin, cutmax
	
	variable nrows = dimsize(dpwave,0)
	variable i 
	
	for(i=0;i<nrows;i++)
		if(dpwave[i]<cutmin)	//If less than the minimum mass eqivalent diameter then change 2 nan
			dpwave[i] = NaN
		elseif(dpwave[i]>cutmax)
			dpwave[i] = NaN	//If more than the maximum mass equivalent diameter then change 2 nan
		else
		Endif	
	Endfor


end


function AJD_SD_N_M(nbins, dpwave, flowwave, density)	//Make size distribution of entire wave

	variable nbins, density
	wave dpwave, flowwave

	
	//Establish Output DF for Part 1 Code
	setdatafolder root:
	If(dataFolderExists("SD_Output_Part1")==1)	//it does exist
		setdatafolder SD_Output_Part1
		DFREF SD_Output_Part1 = getdatafolderDFR()
	elseif(datafolderexists("SD_Output_Part1")==0)	//it does not exist
		newdataFolder/S SD_Output_Part1
		DFREF SD_Output_Part1 = getdatafolderDFR()
	endif
	
	Setdatafolder SD_Base
	
	
	///General variables
	variable npnts = dimsize(dpwave,0)
	Variable i, j 
	variable samplevolume_Var 
	
	//Duplicate Dpwave and apply cuts
	duplicate/O dpwave, Dpwave_Cut
	variable cutmin = 100 //nm MED
	variable cutmax = 700 //nm MED
	AJD_SP2_minmax_cuts(dpwave_Cut,cutmin,cutmax)
	
	//Concentration Wave Creation
	duplicate/O Flowwave, SampleVolume_cm3
	SampleVolume_cm3 *=1E6	//m3 * 1E6cm3/m3 = cm3
	note SampleVolume_cm3, "Sample Volume in cm\\S3\\M."
	SampleVolume_Var =sum(SampleVolume_cm3)	//cm3
	
	make/o/d/n=(nbins) dN = 0 
	make/o/d/n=(nbins) dlogDp = 0 
	
	//SD creation
	variable dpmax, dpmin, dprange, binwidth
	dpmax = wavemax(dpwave_cut)
	dpmin = wavemin(dpwave_cut)
	dprange = dpmax-dpmin
	binwidth = dprange/nbins
	
	make/o/d/n=(nbins+1) bin_edges
	bin_edges = NaN
	make/o/d/n=(nbins) bin_midpoints
	bin_midpoints = NaN
	
	for(i=0;i<nbins;i++)
		bin_edges[i] = dpmin + (binwidth * i)
		bin_midpoints[i] = dpmin + (i+0.5) * binwidth
		if(i==nbins-1)
			bin_edges[i+1] = dpmin + (binwidth*i+1)
		endif
	Endfor
//	print dpmax,dpmin,dprange,binwidth

	//Create SD from dpwave_cut
	variable dL, dU
	for(i=0;i<nbins;i++)	//For everybin
		dL = bin_edges[i]
		dU = bin_edges[i+1]
		dlogDp[i] = log(dU) - log(dL)
		for(j=0;j<npnts;j++)	//for the entire dpwave_cut
			if(dpwave_cut[j] >= dL && dpwave_cut[j] < dU)	//If within bin range
				dN[i]+=1
			else
			endif
		Endfor
	Endfor
	
	dN/=SampleVolume_Var	//go from # to #/cm3
//	
//	killwindow/Z dNvsmidpointdp
//	display/N=dNvsmidpointdp dN vs bin_midpoints
//	label left "dN"
//	Label bottom "Midpoint (d\\Bp\\M)"
//	modifygraph log(bottom)=1
	
	//Now get into dlogdp (which has been established above
	duplicate/O dN, dNdlogDp
	dNdlogdp = dN/dlogDp
	
	//Graph
	killwindow/Z dNdlogDpvsMidpointdp
	display/N=dNdlogDpvsMidpointdp dNdlogDp vs bin_midpoints
	label left "dNdlogDp"
	Label bottom "Midpoint (d\\Bp\\M)"
	modifygraph log(bottom)=1
	Modifygraph mode=6
	
	
	//Now do mass
	duplicate/O dN, dM
	for(i=0;i<nbins;i++)
		dM[i] = dN[i]*((pi/6)*(bin_midpoints[i]^3))*1E-9*density
		//dN = #/cm3 -> ug/m3
		//Density units of g/cm3 -> Mass is in ug/m3 
	Endfor
//	
//	killwindow/Z dMvsmidpointdp
//	display/N=dMvsmidpointdp dM vs bin_midpoints
//	label/W=dMvsmidpointdp left "dM"
//	label/W=dMvsmidpointdp bottom "Midpoint (d\\Bp\\M)"
//	modifygraph log(bottom)=1
//	
	duplicate/O dM, dMdlogDp
	dMdlogDp = dM/dlogdp
	
	killwindow/Z dMdlogDpvsmidpointdp
	display/N=dMdlogDpvsmidpointdp dMdlogDp vs bin_midpoints
	label left "dMdlogDp"
	Label bottom "Midpoint (d\\Bp\\M)"
	modifygraph log(bottom)=1
	Modifygraph mode=6
	
	//BELOW NOT USED
	//Move waves that will not be used in part 2 code to the first output folder, and duplicate waves that will be used in part 2 to part 1 output folder. 
//	 dup2NF(SD_Base,SD_Output_Part1)
//	 variable wlistitems 
//	 string wlist2delete = ""
//	 wlist2delete += wavelist("Bin*",";","Text:0")
//	 wlist2delete += wavelist("dN",";","Text:0")
//	 wlist2delete += wavelist("dM",";","Text:0")
//	
//	wlistitems = itemsInList(wlist2delete,";")
End




Function IrregularTime_Avg(avg_start_Y,avg_start_Mon,avg_start_D,avg_start_H,avg_start_Min,avg_start_S,avg_stop_Y,avg_stop_Mon,avg_stop_D,avg_stop_H,avg_stop_Min,avg_stop_S, interval)  
	
	
	variable avg_start_Y
	variable avg_start_Mon
	variable avg_start_D
	variable avg_start_H
	variable avg_start_Min
	variable avg_start_S
	
	variable avg_stop_Y
	variable avg_stop_Mon
	variable avg_stop_D
	variable avg_stop_H
	variable avg_stop_Min
	variable avg_stop_S
	
	variable interval	
	DFREF Start_DF = getdatafolderDFR()
	

	
	string newfoldername = "Irregular_Avg_SD_" + num2str(avg_start_Y) + "_" + num2str(avg_start_Mon)+ "_" + num2str(avg_start_D) + "_"+ num2str(avg_start_H) + "_" + num2str(avg_start_H) + "_"+ num2str(avg_start_Min) + "_int" + num2str(interval)   
	NewDataFolder/O $newfoldername
	DFREF newfolder = $newfoldername
	
	SetDataFolder Start_DF
	
	
	
	//Change the global variables to a real time
	variable avg_starttime = date2secs(avg_start_Y, avg_start_Mon, avg_start_D) + 60*60*avg_start_H + 60*avg_start_Min + avg_start_S
	variable avg_stoptime = date2secs(avg_stop_Y, avg_stop_Mon, avg_stop_D) + 60*60*avg_stop_H + 60*avg_stop_Min + avg_stop_S
	
	
	//Find index for the specified start and stop time in the the concatenated timewaves
	Wave SMPS_Start, SMPS_Stop, SMPS_Midpoint
	
	Variable avgstart_index, avgstop_index 
	Findlevel/P/Q SMPS_Start, avg_starttime 
		if(V_Flag==0)
			avgstart_index = floor(V_LevelX)
			print avgstart_index
		else
			print "Starttime is out of range of data"
		endif
		
	Findlevel/P/Q SMPS_Stop, avg_stoptime 
		if(V_Flag==0)
			avgstop_index = floor(V_LevelX)
			print avgstop_index
		else
			print "Stoptime is out of range of data"
		endif
		
	
	//Copy the subset of the NConc 2-D matrix (and accompanying extra info) for the specified time bins
	Wave SMPS_NumberConc, SMPS_MassConc, SMPS_Midpoint_Diameter, SMPS_BinEdges
	
	Duplicate/R=(avgstart_index, avgstop_index)/O SMPS_NumberConc newfolder:SMPS_NumberConc
	Duplicate/R=(avgstart_index, avgstop_index)/O SMPS_MassConc newfolder:SMPS_MassConc
	Duplicate/O SMPS_Midpoint_Diameter newfolder:SMPS_Midpoint_Diameter
	Duplicate/O SMPS_BinEdges newfolder:SMPS_BinEdges
	
	Setdatafolder newfolder
	
	//Makes a new wave that is the average size distribution for the specified time
	AvgSizeDistribution()
	Wave Avg_Nconc, Avg_MConc
	//Makes separate waves for individual sample runs at the specified interval (in run #)
	SeparateSizeDistrforGraphs_Num(interval)	
	SeparateSizeDistrforGraphs_Mass(interval)
	
	//Makes a graph with size distribution for individual sample runs 
	makeSDgraphs_numb(newfolder,"SMPS_Midpoint_Diameter",interval)
	
	//Do some statistics on the new size distribution
	Setdatafolder newfolder
	Variable GeoMean, GeoSD, AvgConc
	Wave Avg_NConc
	[GeoMean, GeoSD, AvgConc] = TSIStatistics(Avg_NConc, SMPS_Midpoint_Diameter)

	//Add the average size distribution and the statistics information to the graph that has the individual sample runs
	
	wave SMPS_Midpoint_Bins
	Duplicate/O SMPS_Midpoint_Diameter, SMPS_MidPoint_Bins
	MakeEdgesWave(SMPS_Midpoint_Diameter, SMPS_MidPoint_Bins)
	
	AppendtoGraph Avg_NConc vs SMPS_Midpoint_Diameter
	ErrorBars Avg_NConc SHADE= {0,4,(0,0,0,0),(0,0,0,0)},wave=(:Std_Nconc,:Std_Nconc)
	ModifyGraph log(bottom)=1
	Label left "dNdlogdp (#/cm\\S3\\M)";DelayUpdate
	Label bottom "Diameter Midpoint (nm)";Delayupdate
	ModifyGraph lsize(Avg_NConc)=2,rgb(Avg_NConc)=(0,0,0) //Make average black thick line
	
	//Makes a string that includes the prescribed start and stop times
	String str_start, str_stop
	sprintf str_start, "%02d/%02d/%02d %02d:%02d:%02d", avg_start_Mon,avg_start_D, avg_start_Y, avg_start_H, avg_start_Min, avg_start_s
	sprintf str_stop, "%02d/%02d/%02d %02d:%02d:%02d", avg_stop_Mon,avg_stop_D, avg_stop_Y, avg_stop_H, avg_stop_Min, avg_stop_s
	

	
	TextBox/C/N=text0/F=0/A=RT "\JCAvg Number Dist.\r" + str_start + "\r" + str_stop + "\rGeo Mean = "+ num2str(GeoMean) + "\rGeom STD = " + num2str(GeoSD) + "\rTotal Conce = " + num2str(AvgConc) + ""
	
	
	//Repeat for Mass
	makeSDgraphs_mass(newfolder,"SMPS_Midpoint_Diameter",interval)
	
	//Do some statistics on the new size distribution
	Setdatafolder newfolder
	Wave Avg_MConc
	[GeoMean, GeoSD, AvgConc] = TSIStatistics(Avg_MConc, SMPS_Midpoint_Diameter)

	//Add the average size distribution and the statistics information to the graph that has the individual sample runs
	
	AppendtoGraph Avg_MConc vs SMPS_Midpoint_Diameter
	ErrorBars Avg_MConc SHADE= {0,4,(0,0,0,0),(0,0,0,0)},wave=(:Std_Mconc,:Std_Mconc)
	ModifyGraph log(bottom)=1
	Label left "dMdlogdp (ug/m\\S3\\M)";DelayUpdate
	Label bottom "Diameter Midpoint (nm)";Delayupdate
	ModifyGraph lsize(Avg_MConc)=2,rgb(Avg_MConc)=(0,0,0) //Make average black thick line
	
	TextBox/C/N=text0/F=0/A=RT "\JCAvg Mass Dist.\r" + str_start + "\r" + str_stop + "\rGeo Mean = "+ num2str(GeoMean) + "\rGeom STD = " + num2str(GeoSD) + "\rTotal Conce = " + num2str(AvgConc) + ""
	
	Setdatafolder Start_DF
End

// For a 2D wave of size distribution (rows are samples, columns are diameters), this finds the average signal at a given diameter
// And writes a 1D wave with the average and standard deviations
Function AvgSizeDistribution()
	Wave SMPS_NumberConc, SMPS_MassConc, SMPS_Midpoint_Diameter, SMPS_BinEdges
		
	MatrixOP/O Avg_NConc = sumcols(replaceNaNs(SMPS_NumberConc,0)) / numRows(SMPS_NumberConc) //??
	MatrixOP/O Std_Nconc = sqrt(varCols(SMPS_NumberConc))
	
	Matrixtranspose Avg_NConc
	Matrixtranspose Std_Nconc
	
	Redimension/N=-1 Avg_NConc //Make Avg_NConc a 1D wave
	Redimension/N=-1 Std_NConc
	
	//Repeat for MConc
	
	MatrixOP/O Avg_MConc = sumcols(replaceNaNs(SMPS_MassConc,0)) / numRows(SMPS_MassConc)
	MatrixOP/O Std_Mconc = sqrt(varCols(SMPS_MassConc))
	
	Matrixtranspose Avg_MConc
	Matrixtranspose Std_Mconc
	
	Redimension/N=-1 Avg_MConc //Make Avg_MConc a 1D wave
	Redimension/N=-1 Std_MConc
	
	
End


function makeSDgraphs_numb(newfolder,diametername, interval)
	DFREF newfolder
	String diametername
	variable interval
		
	setdatafolder newfolder
	
	String mywavelist = WaveList("Size_Distribution_Scan_*", ";","")
	variable numbdf = ItemsInList(mywavelist)
	
	variable i
	
	Display
	for(i=0;i<(numbdf*interval);i+=interval)
		string scannumb_name = "Size_Distribution_Scan_"+num2str(i)
		wave tempwave1 = $Scannumb_name
		wave tempwave2 = $diametername
		AppendtoGraph tempwave1 vs tempwave2
		Label left "dNdlogdp (#/cm\\S3\\M)";DelayUpdate
		Label bottom "Diameter Midpoint (nm)";Delayupdate
		ModifyGraph log(bottom)=1
		ModifyGraph mode=6

	endfor
	
End



// Separates 2D wave into individual 1D waves so that they can be plotted.
// Plotting every run is too much, so "interval" is an integer so that every "nth sample run" will be included
function SeparateSizeDistrforGraphs_Num(interval)
	variable interval
	string currdfr = GetDataFolder(1)
	
	Wave SMPS_NumberConc
	variable i = 0
				
	//Transpose NConc 2D wave so that rows are diameters
	duplicate/O SMPS_NumberConc, NConc_Trans
	Matrixtranspose NConc_Trans
		
	//Make each *interval* column of the transposed wave into individual 1D waves with unique names
	for (i=0;i<dimsize(SMPS_NumberConc,0);i+=interval)
		string thiswavename = currdfr + "Size_Distribution_Scan_" + num2str(i)
		Matrixop/O $thiswavename = col(NConc_Trans,i)
		Redimension/N=-1 $thiswavename
	Endfor

End


function SeparateSizeDistrforGraphs_Mass(interval)
	variable interval
	string currdfr = GetDataFolder(1)
		
	Wave SMPS_MassConc
	variable i = 0		
				
	//Repeat for MConc
	Wave MConc
	duplicate/O SMPS_MassConc, MConc_Trans
	Matrixtranspose MConc_Trans
		
	for (i=0;i<dimsize(SMPS_MassConc,0);i+=interval)
		string thiswavename = currdfr + "Mass_Distribution_Scan_" + num2str(i)
		Matrixop/O $thiswavename = col(MConc_Trans,i)
		Redimension/N=-1 $thiswavename
	Endfor

End

//Function Kill_All_Graphs(ba) : ButtonControl
//	STRUCT WMButtonAction &ba
//	switch(ba.eventCode)
//		case 1: //mouse up
//			KillAllGraphs()
//		case 2:
//			break
//		endswitch
//		
//End

//Function KillAllGraphs()		//Kills all Graphs
//    string fulllist = WinList("*", ";","WIN:1")
//    string name, cmd
//    variable i
//   
//    for(i=0; i<itemsinlist(fulllist); i +=1)
//        name= stringfromlist(i, fulllist)
//        dowindow/K $name  
//    endfor
//end

Function Kill_All_Tables(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			KillAllTables()
		case 2:
			break
		endswitch
		
End


Function KillAllTables()		//Kills all Tables 
    string fulllist = WinList("*", ";","WIN:2")
    string name, cmd
    variable i
   
    for(i=0; i<itemsinlist(fulllist); i +=1)
        name= stringfromlist(i, fulllist)
        dowindow/K $name  
    endfor
end

Function Stop_All_Timers_butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			StopAllTimers()
		case 2:
			break
		endswitch
		
End


Function StopAllTimers()		//Kills all Tables 
    variable i, timer, convert
   
    for(i=0; i<9;i++)
      timer = StopMSTimer(i) 
      convert = timer/1E6/60
      print "Stopped Timer " +num2str(i)+" at "+ num2str(convert)+" minutes."
    endfor
end
















// Based on Appendix C of AIM Aerosol Instrument Manager® Software for Scanning Mobility Particle Sizer™  
// (SMPS™) Spectrometer User’s Manual P/N 1930038, Revision H April 2010 
// https://cires1.colorado.edu/jimenez-group/Manuals/AIM_SMPS_manual.pdf
Function [variable GeoMean, variable GeoSD, variable AvgConc] TSIStatistics(Wave dWdlogDp, Wave Diam)

	
	Make/O/N=(numpnts(Diam)) GM_num
	Make/O/N=(numpnts(Diam)) GM_den
	
	Make/O/N=(numpnts(Diam)) W
	
	Duplicate/O diam binwidth
	binwidth = Nan
	variable i
	For (i=0; i<(numpnts(binwidth)-1);i++)
		binwidth[i] = diam[i+1]-diam[i]
	
	EndFor
	
	Duplicate/O diam dlogDp 
	dlogDp = Nan
	dlogDp = log(diam+0.5*binwidth)-log(diam-0.5*binwidth)
	
	Variable j
	variable numbins = numpnts(diam)
	
	Make/FREE/N=(numbins) Dl, Du

	For (j=0; j<numbins; j++)
		if (j == 0)
			Dl[j] = diam[j] - 0.5*binwidth[j]
			Du[j] = diam[j] + 0.5*binwidth[j]	
		elseif (j == (numbins-1))
			Dl[j] = diam[j] - 0.5*binwidth[j-1]
			Du[j] = diam[j] + 0.5*binwidth[j-1]
		else
			Dl[j] = diam[j] - 0.5*binwidth[j-1]
			Du[j] = diam[j] + 0.5*binwidth[j]	
		endif
	
	dlogDp[j] = log(Du[j])- log(Dl[j])	
	EndFor
	
	W=DWdlogDp*dlogDp
	
	Make/O/N=(numpnts(W)) AddW
	AddW=W[i]
	For (i=1; i<(numpnts(W)); i++)
		AddW[i] = AddW[i-1]+W[i]
	EndFor
	
	GM_num = W * ln(diam)
	GM_den = W
	GeoMean = exp(Sum(GM_num)/Sum(GM_den))
	
	Print "Geometric Mean is " + num2str(GeoMean)
	
	GM_num = W * ( ln(diam)-ln(GeoMean) )^2
	GM_den = W
	GeoSD = exp(sqrt(Sum(GM_num)/Sum(W)))
	Print "Geometric Standard Devation is " + num2str(GeoSD)
	
	AvgConc = sum(W)
	Print "Total Num Conc is " + num2str(Sum(W))
	
	Killwaves AddW, binwidth, dlogDp, GM_den, GM_num, W
	
End

Function MakeEdgesWave(centers, edgesWave)
	Wave centers // Input wave
	Wave edgesWave // Output wave
	
	Variable N=numpnts(centers)
	
	Redimension/N=(N+1) edgesWave
	edgesWave[0]=centers[0]-0.5*(centers[1]-centers[0])
	edgesWave[N]=centers[N-1]+0.5*(centers[N-1]-centers[N-2])
	edgesWave[1,N-1]=centers[p]-0.5*(centers[p]-centers[p-1])
End




function makeSDgraphs_mass(newfolder,diametername, interval)
	DFREF newfolder
	String diametername
	variable interval
	
	setdatafolder newfolder
	wave Mass_Distribution_Diam
	
	String mywavelist = WaveList("Mass_Distribution_Scan_*", ";","")
	variable numbdf = ItemsInList(mywavelist)
	variable i
	

	Display 
	for(i=0;i<(numbdf*interval);i+=interval)
		string scannumb_name = "Mass_Distribution_Scan_"+num2str(i)
		wave tempwave1 = $Scannumb_name
		wave tempwave2 = $diametername
		AppendtoGraph tempwave1 vs tempwave2
		Label left "dMdlogdp (µg/m\\S3\\M)";DelayUpdate
		Label bottom "Diameter Midpoint (nm)";Delayupdate
		ModifyGraph log(bottom)=1
		ModifyGraph mode=6	

	endfor
	setdatafolder root:	
End




Function Graph_Time_SD(SD_Wave,tmid,dmid plottime)

	wave SD_Wave, tmid,dmid
	string plottime
	variable nrow, ncol
	
	
	
	
	string s_year1,s_month,s_day,s_hr1,s_min,s_sec, s_year, s_hr
	s_month = stringfromlist(0,plottime,"/")
	s_day = stringfromlist(1,plottime,"/")
	s_year1 = stringfromlist(2,plottime,"/")
	s_hr1 = stringfromlist(0,plottime,":")
	s_min = stringfromlist(1,plottime,":")
	s_sec = stringfromlist(2,plottime,":")
	
	s_year  = stringfromlist(0, s_year1," ")
	s_hr = stringfromlist(1, s_hr1," ")
	
	variable v_year,v_month,v_day,v_hr,v_min,v_sec
	v_year = str2num(s_year)
	v_month = str2num(s_month)
	v_day = str2num(s_day)
	v_hr =str2num(s_hr)
	v_min = str2num(s_min)
	v_sec = str2num(s_sec)
	
	variable ymd = date2secs(v_year,v_month,v_day)
	variable hms = (v_hr*3600) + (v_min*60) + (v_sec)
	variable dt_s = ymd+hms
	
	//Graphname String
	string graphname_Str = "SD_"+ s_year+"_"+s_month+"_"+s_day+"_"+s_hr+"_"+s_min+"_"+s_sec
	
	//Determine time to plot off of midpoint time
	nrow = binarysearch(tmid,dt_S)
	//plot
	killwindow/Z $graphname_Str
	Display/N=$graphname_Str SD_wave[nrow][] vs dmid
	Label/W=$graphname_Str left "dMdlogDp";DelayUpdate
	modifygraph/W=$graphname_Str log(bottom)=1
	modifygraph/W=$graphname_Str mode=6 
	Print "Please ensure the time entered does not overlap and the same graph"
	
End

function Name_SD_Bins(SD,Midpnt_Diam)
	Wave SD, Midpnt_Diam
	variable i = 0		
				
	
	string variablenames
	variablenames = ""
	for(i=0; i<(numpnts(Midpnt_Diam)); i+=1)
		variablenames += "MdPtDiam" +num2str(Midpnt_Diam[i]) + ";"
	endfor
		
	variablenames = replacestring(".",variablenames,"_") //Change decimals in wave to underscores
		
	//Make each *interval* column of the transposed wave into individual 1D waves with unique names
	for (i=0;i<dimsize(SD,1);i++)
		string thiswavename = stringfromlist(i, variablenames)
		Matrixop/O $thiswavename = col(SD,i)
		Redimension/N=-1 $thiswavename
	Endfor

End

Function find_season(DT_Start,DT_End)//Find what season based on date range

	//Define parameters
	wave DT_Start, DT_End
	//Define variables and make waves
	variable npnts = numpnts(DT_Start)
	variable i 
	make/T/O/N=(npnts) Season
	String Spring_Str,Summer_Str,Fall_Str,Winter_Str, Error_Str
	Spring_Str = "Spring"
	Summer_Str = "Summer"
	Fall_Str = "Fall"
	Winter_Str = "Winter"
	Error_Str = "Error: Dates did not compound correctly. Requires manual correction."
	
	variable Spring_Start,Spring_End,Summer_Start,Summer_End,Fall_Start,Fall_End,Winter_Start1, Winter_Start2,Winter_End1,Winter_End2
	Spring_Start = date2secs(1904,3,1)
	string test = secs2Date(Spring_Start,0)
	Spring_End = date2secs(1904,5,31)
	string tests = secs2Date(Spring_End,0)
	Summer_Start = date2secs(1904,6,1)
	string testSS = secs2Date(Summer_Start,0)
	Summer_End = date2secs(1904,8,31)
	string testSE = secs2Date(Summer_End,0)
	Fall_Start = date2secs(1904,9,0)
	string testFS = secs2Date(Fall_Start,0)
	Fall_End = date2secs(1904,11,30)
	string testFE = secs2Date(Fall_End,0)
	Winter_Start1 = date2secs(1903,12,1)
	string testWS1 = secs2Date(Winter_Start1,0)
	Winter_Start2 = date2secs(1904,12,1)
	string testWS2 = secs2date(Winter_Start2,0)
	Winter_End1 = date2secs(1904,2,28)
	string testWE1 = secs2Date(Winter_End1,0)
	Winter_End2 = date2secs(1905,2,28)
	string testWE2 = secs2date(Winter_End2,0)
	//Shouldn't matter these are all 1904 as I will be subtracting out year
	variable start_dt,end_dt, Date_range
	string year, year_sub, test2, test3
	variable year_sub_secs
	variable Spring_Var,Summer_Var,Fall_Var,Winter_Var
	
	for(i=0;i<npnts;i++)
		start_dt = DT_Start[i]
		end_dt = DT_End[i]
		Date_Range = (end_dt + start_dt)/2	//Determine season off of midpoint of year (i.e. if you started last week of spring you are not a spring campaign)
		year = secs2Date(Date_Range,-2)
		year_sub = stringfromList(0,year,"-")
		year_sub_secs = Date2secs(str2num(year_sub),1,1)
		test2 = secs2date(year_sub_secs,0)
		Date_Range-= year_sub_secs //Subtract out year
		test3 = secs2date(Date_Range,0)
		if(Spring_start<Date_Range && Date_Range<Spring_end) //If within spring
			Season[i] = Spring_Str
			Spring_var++
		elseif(Summer_start<Date_Range && Date_Range<Summer_end)//If within summer
			Season[i] = Summer_Str
			Summer_var++
		elseif(Fall_start<Date_Range && Date_Range<Fall_end)//If within fall
			Season[i] = Fall_Str
			Fall_Var++
		elseif(Winter_start1<Date_Range && Date_Range<Winter_end1)//If within winter (1)
			Season[i] = Winter_Str
			Winter_Var++
		elseif(Winter_start2<Date_Range && Date_Range<Winter_end2)//If within winter (2)
			Season[i] = Winter_Str
			Winter_Var++
		else
			Season[i] = Error_Str
		endif
	
	
	Endfor
	
	
	//Stats
	make/o/d/n=5 Season_Stat_Wave
	note/k Season_Stat_Wave, "% Spring, Summer, Fall, Winter, Total events."
	Season_Stat_Wave[0] = (Spring_Var/npnts) * 100
	Season_Stat_Wave[1] = (Summer_Var/npnts) * 100
	Season_Stat_Wave[2] = (Fall_Var/npnts) * 100 
	Season_Stat_Wave[3] = (Winter_Var/npnts)* 100
	Season_Stat_Wave[4] = npnts



End

Function Sonic_Wind_Organization(DF)//,Twave_Start, Twave_Stop,T1,T2,WD1,WD2,WS1,WS2)		//Organized Procecced Sonic Data

//guiding calc form Michael Vermeuel -> (u^2+v+2)^1/2 = average horizontal windspeed (not used here but if needed here it is)
	//Get to correct DF
	DFREF DF
	setdatafolder DF
	
	string subdatafolder = "Sonic_Altered"
	if(datafolderexists(subdatafolder)==0) //Does not Exists
		newdataFolder/S $subdatafolder
		DFREF DF_sub = getdatafolderDFR()
	elseif(datafolderexists(subdatafolder)==1) //Exists
		setdataFolder $subdatafolder
		DF_sub = getdataFolderDFR()
	Endif
	
	killwaves/A 
	setdatafolder DF 
	
	//Learn Waves
	String List_DateTime = ""
	String List_Temp = ""
	String List_WD = ""
	String List_WS = ""
	
	
	//Organize Waves into Strings to call later on
	List_DateTime += wavelist("Start*",";","Text:0")
	List_DateTime += wavelist("Stop*",";","Text:0")
	List_Temp += wavelist("T*",";", "Text:0")
	List_WD += wavelist("WD*",";","Text:0")
	List_WS += wavelist("WS*",";", "Text:0")
	
	
	//Take waves and format them
	//Format DateTime waves
		variable i, nwaves
		nwaves = itemsInList(List_DateTime,";")
		variable timeoffset_yr, timeoffset_month, timeoffset_day
		prompt timeoffset_yr, "What is the year of this data?"
		prompt timeoffset_month, "What is the month of this data?"
		prompt timeoffset_day, "What is the day of this data?"
		doprompt "Enter in the following information.", timeoffset_yr, timeoffset_month, timeoffset_day
		
		variable timeoffset = date2secs(timeoffset_yr, timeoffset_month, timeoffset_day)
	
		for(i=0;i<nwaves;i++)
			string TempStr = StringfromList(i,List_DateTime)
			wave Tempwave = $TempStr
			string NewTempStr_name = TempStr + "_Altered"
			duplicate/O Tempwave, $NewTempStr_name
			wave Tempwave_altered = $NewTempStr_name
			setscale d 0, 0, "dat" Tempwave_altered
			Tempwave_Altered += timeoffset
			movewave Tempwave_Altered, DF_Sub
		Endfor
		
		//Duplicate other waves into subfolder
		nwaves = itemsinlist(list_temp,";")
		for(i=0;i<nwaves;i++)
			TempStr = StringFromList(i,List_Temp)
			wave Tempwave = $TempStr
			NewTempStr_name = tempstr +"_Altered"
			duplicate/O Tempwave, $NewTempStr_name
			wave Tempwave_Altered = $newtempstr_name
			movewave Tempwave_altered, DF_Sub
		Endfor
		
		nwaves = itemsinlist(List_WD,";")
		for(i=0;i<nwaves;i++)
			TempStr = StringFromList(i,List_WD)
			wave Tempwave = $TempStr
			NewTempStr_name = tempstr +"_Altered"
			duplicate/O Tempwave, $NewTempStr_name
			wave Tempwave_Altered = $newtempstr_name
			movewave Tempwave_altered, DF_Sub
		Endfor
		
		nwaves = itemsinlist(List_WS,";")
		for(i=0;i<nwaves;i++)
			TempStr = StringFromList(i,List_WS)
			wave Tempwave = $TempStr
			NewTempStr_name = tempstr +"_Altered"
			duplicate/O Tempwave, $NewTempStr_name
			wave Tempwave_Altered = $newtempstr_name
			movewave Tempwave_altered, DF_Sub
		Endfor
End

function PMF_Identification_Wave(PMFt, F1,F2,F3,Instrument_t,ACSM_BC,SMPS)	//make PMF identification flagwave
	wave PMFt, F1,F2,F3,Instrument_t,ACSM_BC,SMPS
	//This code assumes that the PMF time wave is more than the interpolated insturment time waves
	//Establish times for PMF
	variable t_lowbound_PMF, t_highbound_PMF
	t_lowbound_PMF = PMFt[0]
	
	//Establish times for Instrument Times
	variable t_lowbound_instrument, t_highbound_Instrument
	t_lowbound_instrument = Instrument_t[0]
	
	//create general variables
	variable i, j, Currtime_PMF, Lowbound_idx_instrument,  Highbound_idx_instrument, F1_Avg, F2_Avg, F3_Avg, PMF_Max
	variable npnts_PMF = dimsize(PMFt,0)
	variable npnts_Instrument_t = dimsize(Instrument_t,0)
	
//	//create holding waves
//	make/o/d/n=(npnts_PMF) PMF_Holding
//	make/o/d/n=(npnts_Instrument_t) Instrument_Holding
	
	//make flagwave and flagwave contents
	make/o/d/t/n=(npnts_Instrument_t) PMF_FlagWave = ""
	string F1_Note = "OOA Dominated"
	string F2_Note = "COA Dominated"
	string F3_Note = "HOA Dominated"
	
	//create time loop
	for(i=0;i<npnts_PMF-1;i++)	//for every PMF time interval (15 min for the one I am currently looking at)
		t_lowbound_PMF = PMFt[i]
		t_highbound_PMF = PMFt[i+1]	//establish current bounds for PMF
		t_lowbound_instrument = t_lowbound_PMF
		t_highbound_instrument = t_highbound_PMF
		Currtime_PMF = PMFt[i]
		if(Currtime_PMF>= t_lowbound_PMF && Currtime_PMF<= t_highbound_PMF) //if we are within a PMF timeframe
			FindLevel/Q Instrument_t, t_lowbound_instrument
			Lowbound_idx_instrument = round(V_levelX)
			FindLevel/Q Instrument_t, t_highbound_instrument
			Highbound_idx_instrument = round(V_levelX)
			//Find out which PMF Factor dominates
			WaveStats/Q/R=[i,i] F1
			F1_Avg = V_Avg
			WaveStats/Q/R=[i,i] F2
			F2_Avg = V_Avg
			WaveStats/Q/R=[i,i] F3
			F3_Avg = V_Avg
			PMF_Max = Max(F1_Avg,F2_Avg,F3_Avg)
			If(PMF_Max == F1_Avg) //IF the first factor Dominates
				PMF_FlagWave[Lowbound_idx_instrument,Highbound_idx_instrument] = F1_Note
			elseif(PMF_Max == F2_Avg)
				PMF_FlagWave[Lowbound_idx_instrument,Highbound_idx_instrument] = F2_Note
			elseif(PMF_Max == F3_Avg)
				PMF_FlagWave[Lowbound_idx_instrument,Highbound_idx_instrument] = F3_Note
			endif
		else //we are not within a PMF timeframe; move on 
		endif
			
		
		
		
	EndFor

End


//11/8/24 AJD take all of the waves in a DF and flip them (designed for MET data as the FROGSICLE met data is flipped). 

Function MET_FlipallWaves(Folderpath_Str)

	//Establish parameters
	string Folderpath_str
	
	//Do DFREF things
	setdatafolder $Folderpath_str
	DFREF StartDF = getdatafolderDFR()
	newdatafolder/O/S DF_Fliped
	DFREF FlippedDF = getdatafolderDFR()
	//Because we are using movewave instead of duplicate we need to clear the waves
	killwaves/A
	
	setdatafolder StartDF
	
	//Make nessesary variables and strings
	variable i
	string Wlist = wavelist("*", ";","CMPLX:0") //We have text waves so can't use Text:0 here.
	variable nwaves = itemsinlist(Wlist,";")
	
	
	for(i=0;i<nwaves;i++) //get a wave from the list
		//Get nessesary information and then duplicate the wave into the new datafolder; this is handled by the Flip_Wave Function
		wave tempwave = $stringfromlist(i,Wlist,";")
		//Not catching text waves so the following code it so catch them.
		if(wavetype(tempwave,1)==2)	//If it is a text wave
		//We are dealing with a text wave so use the altered code function
		Flip_Wave_text(tempwave)
		string Dupwavename = nameofwave(tempwave)+"_Flipped" // The Flip_Wave function has this as the name
		movewave $Dupwavename, FlippedDF
		else //IF not a text wave
		Flip_Wave(tempwave)
		Dupwavename = nameofwave(tempwave)+"_Flipped" // The Flip_Wave function has this as the name
		movewave $Dupwavename, FlippedDF
		endif
	endfor
	



End

Function MET_DateFix(year,month,day,hour,minute,second,tinterval,npnts)

	variable year,month,day,hour,minute,second,tinterval,npnts
	
	variable YMD = date2secs(year,month,day)
	variable HMS = (hour*3600)+(minute*60)+second
	variable DT = YMD+HMS
	
	make/o/d/n=(npnts) MET_Data_DateTime = 0
	
	variable i, j 
	j=0
	for(i=npnts-1;i>=0;i--)
		
		MET_Data_DateTime[i] = DT+(tinterval*j)
		
		if(j==0)
			j++
		else
			j++
		endif
	Endfor
	setscale d, 0,0, "dat", MET_Data_DateTime
End

Function MET_Wind_Info(w_DT, w_WD, w_WG, w_WS)
	
	wave w_DT, w_WD, w_WG, w_WS
	
	Edit/N=Wind_Table
	appendtotable w_DT, w_WD, w_WG, w_WS
	note/K w_WD, "Wind Direction."
	note/K w_WG, "Wind Gust in Meters/Second."
	note/K w_WS, "Wind Speed in Meters/Second."
	modifytable format(w_DT)=8
	
	make/o/d/t/n=(numpnts(w_WD)) Wind_Direction_Simple
	note/K Wind_Direction_Simple, "0 = N, 22.5 = NE, 90 = E, 112.5 = SE, 180 = S, 202.5 = SW, 270 = W, 292.5 = NW."
	Appendtotable Wind_Direction_Simple
	String N, NE, E, SE, S, SW, W, NW
	N = "N"
	NE = "NE"
	E = "E"
	SE = "SE"
	S = "S"
	SW = "SW"
	W = "W" 
	NW = "NW"
	
	//Text wave for quick wind directonality
	variable i
	For(i=0;i<numpnts(w_WD);i++)
		if(w_WD[i]>=0 && w_WD[i] <=22.4)
			Wind_Direction_Simple[i] = N
		elseif(w_WD[i]>=22.5 && w_WD[i] <=89.9)
			Wind_Direction_Simple[i] = NE	
		elseif(w_WD[i]>=90 && w_WD[i] <=112.4)
			Wind_Direction_Simple[i] = E	
		elseif(w_WD[i]>=112.5 && w_WD[i] <=179.9)
			Wind_Direction_Simple[i] = SE	
		elseif(w_WD[i]>=180 && w_WD[i] <=202.4)
			Wind_Direction_Simple[i] = S	
		elseif(w_WD[i]>=202.5 && w_WD[i] <=269.9)
			Wind_Direction_Simple[i] = SW	
		elseif(w_WD[i]>=270 && w_WD[i] <=292.4)
			Wind_Direction_Simple[i] = W
		elseif(w_WD[i]>=292.5 && w_WD[i] <=359.9)
			Wind_Direction_Simple[i] = NW
		Endif
	Endfor
	
End












/////////////////////////////////////////////////////////////////////
///////////////////////////PSI FUNCTIONS/////////////////////////////
/////////////////////////////////////////////////////////////////////



function /S AJD_SP2_getFolder([type, startingDF, promptText, includeAll, alwaysPrompt])
// Return a string to a raw SP2 data folder. User will receive a prompt in case of ambiguity.
// Can be internally called by functions with an optional raw data folder parameter,
// or activated from the toolkit.
//
// joel.c.corbin+sci@gmail.com 2015-06-03
// 
// USAGE EXAMPLES
//		PBPfolderChoice= SP2_getFolder(type="PBP", includeAll=1)
//		singleFolder= 	SP2_getFolder(type="PBP")
//		
//	SEE ALSO
//		SP2_getBeamShapeFolder()
//
//	NOTE this function breaks convention by creating its own buttons.
//
string type				// required, one of "raw" or "PBP" or "HK" or "INI" or "ConcTser"
string startingDF 		// optional, defaults to current DF
string promptText		// optional, text for dialog. Defaults to "select <<type>> data folder ..."
variable includeAll		// optional, defaults to FALSE. Allows a list of DFs to be chosen.
variable alwaysPrompt		// optional, defaults to FALSE. Ignores the checkbox setting.

// TODO: return current folde rif current folder is of specified type

if (ParamIsDefault(startingDF))
	startingDF=getdatafolder(1)
endif
if (ParamIsDefault(type))
	abort "Error: SP2_getFolder() needs type to be specified."
endif
if (ParamIsDefault(promptText))
		promptText= "Select SP2 "+type+" folder:"
endif
	
	// function internals
	string chosen		// the ultimately chosen folder
	string cbtext0 = "Use data folder(s): "
	variable useLast=0	// use the last selected folder?
	string cancelText= "cancelled"
	string noDFsFoundText= "[No "+ type +" folders found]"

	// initialize the last-selected checkbox	(reuse existing value here if checked)
	ControlInfo /W=SP2_Toolkit_PSI cb_reuseDF
	if (!V_flag)	// button doesn't exist so make it
		CheckBox cb_reuseDF,win= SP2_Toolkit_PSI, pos={84,108},size={209,14},title=cbtext0+ "[none selected]"
		CheckBox cb_reuseDF,win= SP2_Toolkit_PSI, font="Calibri",value= 0, disable=0, fColor=(0,26112,39168)
		ControlInfo /W= SP2_Toolkit_PSI cb_reuseDF
	elseif (V_value) // button checked
		// we re-use the last selected folders, 
		// but still convert to the selected category
		string lastChosen= getUserData("SP2_Toolkit_PSI", "cb_reuseDF", "DF")
		if (strlen(lastChosen)) // check that something is there... 
			if (!stringmatch(type, "HK") && !stringMatch("HK", lastChosen))
				// HK files don't follow the same format. Going to/from them
				// creates a big mess -- don't reuse last chosen in this case.
			
			// decide on what the new folder type should look like
			string typeTag
			strswitch(type)
				case "raw":
					typeTag = "SP2':"
					break
				case "PBP":
					typeTag = "SP2_PBP':"
					break
				case "HK":
					typeTag = "HK':"
					break
				case "INI":
					typeTag= "SP2':INI:"
					break
				case "ConcTser":
					typeTag= "SP2_PBP':ConcTser:"
					break
				case "PBP":
					typeTag = "SP2_PBP':LEO:"
					break
				case "SDTser":
					typeTag = "SP2_PBP':SizeDistTser:"
					break
				default:
					print GetRTStackInfo(0)
					abort "Internal error: SP2 folder type unrecognized (see history for stack info)"
				// ...could also do ConcTser (PBP subfolder) 
			endswitch
			
			// append tag to each item in list of last chosen DFs
			chosen= ""
			variable i, nChosen= itemsInList(lastChosen)
			for (i=0; i<nChosen; i+=1) // loop through in case a list was chosen
				string thisChosen= stringFromList(i,lastChosen)
				thisChosen= GrepList(thisChosen, "(\d{3})", 0, "_") // remove previous 'type'. This assumes all folders are in the current DF, and that the names are 'standard', ending in 3 digits before type tag!
				thisChosen+= typeTag // add current type
				
				if (!DataFolderExists(thisChosen)) // check folders exist
					CheckBox cb_reuseDF, win= SP2_Toolkit_PSI, value= 0  // disable reuse if something not found
				endif
				
				chosen+= thisChosen+";"
			endfor
			chosen= RemoveEnding(chosen , ";")
			
			ControlInfo /W=SP2_Toolkit_PSI cb_reuseDF
			if (V_value && !alwaysPrompt) // button still checked after QC
//				printf "\t//* Reuse checkbox enabled, reusing last selected data folder after adjusting type to %s... (%s)\r", type, chosen
				return AJD_ensureEnding(chosen, ":")
			else 
				// exit if-endif, ask user for input
			endif
			endif
		endif
	endif
	
	// get list of data folders of specified type in root
	setdatafolder root:
	string DFlist = AJD_getDataFolderList() // all subfolders, full paths
	strswitch(type)
		case "raw":
			DFlist= grepList(DFlist, "_SP2':$")
			break
		case "PBP":
			DFlist= grepList(DFlist, "_SP2_PBP':$")
			break
		case "HK":
			DFlist= grepList(DFlist, "_HK':$")
			break
		case "INI":
			DFlist= grepList(DFlist, "_SP2':$")
			DFlist= replaceString("_SP2':", DFlist, "_SP2':INI:")
			break
		case "ConcTser":
			DFlist= grepList(DFlist, "_SP2_PBP':$")
			DFlist= replaceString("_SP2_PBP':", DFlist, "_SP2_PBP':ConcTser:")
			break
		default:
			print GetRTStackInfo(0)
			abort "Internal error: SP2_getFolder() type was specified incorrectly"
		// could also do ConcTser (PBP subfolder) 
	endswitch
	setdatafolder $startingDF
	
	// don't waste time if there is only one choice (cost of this shortcut is that user can't request old version)
	variable onlyOneChoice= 0
	if (strlen(DFlist)==0)
		DFlist= noDFsFoundText
	elseif (itemsInList(DFlist)==1 && strlen(DFlist)!=0)
		onlyOneChoice= 1
		chosen= stringFromList(0, DFlist)
	endif
	
	if (!onlyOneChoice || alwaysPrompt)
		// try to be clever and suggest the current folder first
		// TODO!
		
		// add special options to the list
		string doAll= ""
		if (includeAll) // eventually I will switch over to the Igor popup plugin...
			doAll += "[All]"
		endif
		string revertToOld= "[use Data Browser instead]"
		string DFlistOptions = doAll + ";" + DFlist + ";"+ revertToOld
			
		// do choice popup
		Prompt chosen, promptText, popup DFlistOptions
		doprompt "SP2toolkit input", chosen
		if (V_flag==1) // cancel clicked
			chosen= "cancelled"
		endif
		
		if (stringmatch(chosen, doAll))		
			chosen = DFlist
		endif
	
		// If user requested it, revert to Martin's version of this function [only happens if >1 folder exists]:
		if (stringmatch(chosen,revertToOld))
			chosen=AJD_BrowseForFolder(promptText, StartPath=startingDF)
		elseif (stringmatch(chosen,noDFsFoundText))
			return ""
		endif
	
		// avoid creating too many graphs
//		if (itemsInList(chosen) > 5)
//			NVAR /Z AutoGraphCB=$(ksSP2PathToToolkitPanelFldr + ksSP2autoGraphCB)
//			if (NVAR_Exists(AutoGraphCB) && AutoGraphCB)
//				string graphwarning = "You are about to process %g PBP folders and generate separate graphs for each. Disable graphs first?"
//				sprintf graphwarning, graphwarning, itemsInList(chosen)
//				DoAlert 1, graphwarning
//				if (V_flag==1)
//					AutoGraphCB=0
//				endif
//			endif
//		endif
	
		// abort if cancelled
		if (stringmatch(chosen, cancelText) || stringmatch(chosen, noDFsFoundText))		
			AJD_SP2_abort("User cancelled")
		endif
	endif
	
	// update the panel checkbox
	string cbtext1= "Preselect DF%s (n=%g): \f02%s"
	nChosen= itemsInList(chosen)
	if (onlyOneChoice)
		cbtext1= "Preselect DF: \f02" +chosen // "the only existing folder" was once here
		CheckBox cb_reuseDF, win= SP2_Toolkit_PSI, value= 1  // might as well check the box...
	elseif (itemsInList(chosen) <= 1)
		cbtext1= "Preselect DF: \f02" + chosen
	elseif (itemsInList(chosen) < 4)
		sprintf cbtext1, cbtext1, "s", nChosen, chosen
	else
		sprintf cbtext1, cbtext1, "s", nChosen, stringFromList(0,chosen) + " [...] " + stringFromList(nChosen-1,chosen)
	endif
	CheckBox cb_reuseDF, win= SP2_Toolkit_PSI, userdata(DF)= chosen, title= cbtext1
	
	// end
	return AJD_ensureEnding(chosen, ":")
end



// ensures string ends with an ending, e.g. ensureEnding("root:folder:", ":") --> root:folder:
function/s AJD_ensureEnding(str, ending)
string str, ending
	return removeEnding(str, ending) + ending
end

// Applies removeEnding to an entire string list.
function/s AJD_removeEndings(slist, ending[, dlim])
string slist, ending, dlim
	if (ParamIsDefault(dlim))
		dlim=";"
	endif
	variable i,n=itemsInList(slist)
	string newlist=""
	for (i=0; i<n; i+=1)
		newlist+= RemoveEnding(stringFromList(i,slist), ending) + dlim
	endfor
	return newlist
end



function/s AJD_getDataFolderList([DF,sort, sep])
// Returns a list of the full paths to sub data folders.
// Sorts the list by default. Set sort=0 to cancel.
	variable sort
	string sep // custom separator optional
	DFREF DF // optional: data folder to get list for
	
	if (ParamIsDefault(sep))
		sep= ";"
	endif
	if (paramIsDefault(DF))
		DFREF DF = GetDataFolderDFR()
	endif
	DFREF sdf = GetDataFolderDFR()
	setdatafolder DF

	string dl = removeEnding(DataFolderDir(1)[8,inf],";\r")
	if (!strlen(dl))
		setdatafolder sdf
		return ""
	endif
	
// old way
	//	dl = "'" + replaceString(",",dl,"','") + "'"	// single-quote everything to make all names legal
	//	dl = getDataFolder(1) + replaceString(",", dl, ":;"+getDataFolder(1)) + ":;" // make full path instead of partial path

// new way: add single quotes to every folder for safety
	dl = getDataFolder(1) + replaceString(",", dl, ":;"+getDataFolder(1)) + ":;" // make full path instead of partial path
	dl = replaceString("'", dl, "") // first remove single quotes to avoid duplicating them later
	dl = replaceString(":", dl, "':'") // replace : with ':' , which creates start and end issues...
	dl = ";" + dl
	dl = replaceString(";root':", dl, ";root:") // fix start issue (root': --> root:), but only if root @ start of path
	dl = dl[1,inf]
	dl = replaceString("':';", dl, "':;")  // fix end issue (:'; --> :;)
	// quote after the last colon needs removing
	if (ParamIsDefault(sort))
		dl = sortList(dl)
	endif
	
	setdatafolder sdf
	return replaceString(";", dl, sep)
end




Function /S AJD_BrowseForFolder(PromptStr [, StartPath, AbortMode, MultiMode, selectStr])
	//This function opens a data browser in order to browse for a folder.
	//return string: path (list of paths) to the selected data folder(s) incl. terminating colon at end of each path
	//			  "cancelled" if the user cancels the browse window
	//			  note: the path/list returned never has a trailing ";"
	//martin.gysel@psi.ch; last update: 10/09/2010; tested
	//joel.c.corbin@gmail.com; 2015-09-16; updated to add selectStr // jcc
	string PromptStr		//string shown in data browser (cannot be very long)
	string StartPath		//full path to folder that is initially selected when opening the browser
	string selectStr	// All folders containing this string will be selected. e.g. "SP2" will select all SP2_PBP folders.
						// This method does not allow "_SP2:" (raw data) to be selected without selecting "_SP2_PBP" as well.
	variable AbortMode	//0 (default): return "cancelled" if user cancels browse dialog
						//1: abort if user cancels browse dialog
	variable MultiMode	//0 (default): selection of multiple folder is not allowed => repeat prompt
						//1: selection of multiple folders is allowed => return list of selected folders
	
	//preparations
	string savedDF=getdatafolder(1)
	string /g RTStackInfo=GetRTStackInfo(0)		//write stackinfo into global variable in current data folder
	string currproc=AJD_laststringfromlist(RTStackInfo)	//name of current procedure
	string message								//reserve string for abort message
	//set defaults
	if(ParamIsDefault(StartPath))
		StartPath=getdatafolder(1)
	endif
	if(!datafolderexists(startpath))	//check startPath
		StartPath="root:"
	endif
	if (paramisdefault(AbortMode))
		AbortMode=0
	endif
	if (paramisdefault(MultiMode))
		MultiMode=0
	endif
	//browse for folder
	String ParentPath, FldrNam
	ParentPath=AJD_ListChopTail(StartPath, ItemsInList(StartPath, ":")-1, ListSepStr=":")
	FldrNam=AJD_ListChopHead(StartPath, ItemsInList(StartPath, ":")-1, ListSepStr=":")
	ParentPath=ParentPath+":"
	string currFldr, ReturnList
	variable exit, nFldrs, find, repeat
	do
		//browse for folder(s)
		setdatafolder $ParentPath
		if (ParamIsDefault(selectStr) || !strlen(selectStr))
			newdatafolder /o root:Packages
			string /g root:Packages:selectStr= FldrNam
		else
			newdatafolder /o root:Packages
			string /G root:Packages:selectStr= selectStr
		endif
		execute "CreateBrowser prompt=\""+PromptStr+"\", select=root:Packages:selectStr"
		setdatafolder $ParentPath
		NVar Flag=V_Flag
		Svar BrowserList=S_BrowserList
		if (!flag)
			ReturnList="cancelled"
			break
		endif
		//check whether multiple folders were selected
		nFldrs=itemsinlist(BrowserList)
		if (MultiMode==0 && nFldrs>1)
			doalert 0, "none or multiple data folders were selected => try again"
			exit+=1		
			continue
		endif
		//loop over folder list to check all entries
		repeat=0
		ReturnList=""
		for (find=0; find<nFldrs; find+=1)
			currFldr=stringfromlist(find,BrowserList)
			currFldr=RemoveEnding(currFldr,":")						//remove trailing ":" if present
			if (stringmatch("root:ROOT", currFldr))		//data browser returns strange path if root is selected
				currFldr="root"
			endif
			currFldr+=":"
			if(DataFolderExists(currFldr))
				setdatafolder $currFldr
				currFldr=getdatafolder(1)	//make sure that currFldr has correct upper/lower case letters
				ReturnList+=currFldr+";"
			else
				doalert 0, "you must select a data folder, not a wave, string or variable! => try again"
				repeat=1
				break
			endif
		endfor
		if (repeat==0)
			break
		endif
		ReturnList="cancelled"
		exit+=1		
	while (exit<6)		//maximum six attempts
	//abort if needed
	if (AbortMode)
		if (stringmatch(ReturnList, "cancelled"))
			setdatafolder $savedDF
			message="User cancelled procedure "+currproc+"!"
			print message;print RTStackInfo;abort message						
		endif
	endif
	//remove trailing ";"
	ReturnList=AJD_ChopLastCharacterOff(ReturnList,";")
	//finish procedure
	killvariables /z Flag
	killstrings /z BrowserList
	setdatafolder $SavedDF
	return ReturnList
End


// Throw an error in the 'standard' way that is scattered throughout the toolkit
function AJD_SP2_abort(msg[, gotoDF])
// Martin Gysel's approach, function created by joel.c.corbin+sci@gmail.com 2016-02-14
string msg // error message
string gotoDF // go to this DF
	if (!ParamIsDefault(gotoDF))
		setdatafolder $gotoDF
	endif
		
	string /g RTStackInfo= GetRTStackInfo(0)	//write stackinfo into global variable in current data folder
	string currproc=stringFromList(itemsInList(RTStackInfo) - 2, RTStackInfo)
	if (!strlen(msg))
		msg="User cancelled the procedure "+currproc+"!"
	endif
	print msg; print RTStackInfo; abort msg
end


Threadsafe function /S AJD_LastStringFromList(ListStr [,ListSepStr])
	//this function returns the last string contained in a string list
	//martin.gysel@psi.ch; 15/06/2005; tested
	String ListStr		//string containing list
	String ListSepStr	//optional string containing the list separator string
					//default: ";"
	
	if (paramisdefault(ListSepStr))
		ListSepStr=";"
	else
		ListSepStr=ListSepStr[0]
	endif
	return stringfromlist(ItemsInList(ListStr, ListSepStr)-1, ListStr, ListSepStr)
end


Function /S AJD_ListChopTail(ListStr, SplitInd, [ListSepStr])
		String ListStr, ListSepStr
		Variable SplitInd

		//This function chops all items off a list from index "SplitInd" onwards (inclusive)
		//note: the first list element has index 0
		//note: the separator string at the end of ChoppedStr is removed
		//note: if the listsepstr is used, then it must be explicitly defined at function call, i.e. ListSepStr=";"
		//mg, 04.02.05, tested
		
		if (ParamIsDefault(ListSepStr))
			ListSepStr=";"
		endif
		ListSepStr=ListSepStr[0]		//use only first character of listsepstr
		String ChoppedStr=ListStr
		SplitInd=max(0,SplitInd)
		variable index, nItems
		nItems=ItemsInList(ListStr, ListSepStr)
		for (index=SplitInd;index<nItems; index+=1)
			ChoppedStr=RemoveListItem(SplitInd, ChoppedStr,ListSepStr)
		endfor
		//remove last separator
		if(stringmatch(ListSepStr,ChoppedStr[strlen(ChoppedStr)-1]))
			ChoppedStr=ChoppedStr[0,strlen(ChoppedStr)-2]
		endif
		return ChoppedStr
End


Function /S AJD_ListChopHead(ListStr, SplitInd, [ListSepStr])
		String ListStr, ListSepStr
		Variable SplitInd

		//This function chops all items off a list before index "SplitInd" (exclusive)
		//note: the first list element has index 0
		//note: the separator string at the end of ChoppedStr is removed
		//note: if the listsepstr is used, then it must be explicitly defined at function call, i.e. ListSepStr=";"
		//mg, 04.02.05, tested
		
		if (ParamIsDefault(ListSepStr))
			ListSepStr=";"
		endif
		ListSepStr=ListSepStr[0]		//use only first character of listsepstr
		String ChoppedStr=ListStr
		SplitInd=max(0,SplitInd)
		variable index, nItems
		nItems=ItemsInList(ListStr, ListSepStr)
		for (index=0;index<SplitInd; index+=1)
			ChoppedStr=RemoveListItem(0, ChoppedStr,ListSepStr)
		endfor
		//remove last separator
		if(stringmatch(ListSepStr,ChoppedStr[strlen(ChoppedStr)-1]))
			ChoppedStr=ChoppedStr[0,strlen(ChoppedStr)-2]
		endif
		return ChoppedStr
End


Function /S AJD_ChopLastCharacterOff(str,char)
	String str, char
	//This function chops the character "char" off the end of the string "str" if it is there.
	if(strlen(char)>1)
		//return str	//modified on 04.01.2007
		char=char[0]
	endif
	if(stringmatch(char,str[strlen(str)-1]))
		return str[0,strlen(str)-2]
	else
		return str
	endif
End



















//////////////////////////////////////////////////////////
//////////////////PET Toolkit Functions///////////////////
//////////////////////////////////////////////////////////


//Reconstruction of data: Time series
Function pmf_button_pop_reconstTotal(ctrlName) : ButtonControl
	string ctrlName

	pmf_plot_reconstTotal("window")
	pmf_plotck_Reconst_showStacked("window", "ReconstTotal")

	ShowInfo

End


// makes the plot for reconstructed time series 
Function pmf_plot_reconstTotal(graphdest)  	
	string graphdest
	
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar RowDescrWvNm  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RowDescrWvNm
	svar StdDevMxNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:stdDevMxNm
	svar DataMxNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:DataMxNm
	svar RowDescrWvNm  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RowDescrWvNm
	
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar PlotFpeakCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:PlotFpeakCheck
	nvar Reconst_showStackedCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Reconst_showStackedCheck
		
	wave rowDescrWv = $pmfDFnm + rowDescrWvNm
	wave TotalSignal_as_Tseries = $pmfDFnm + "TotalSignal_as_Tseries"			// measured	
	wave ReconstTotalFpeaks =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ReconstTotalFpeaks			// multi-fpeak aware, has one column

	wave fpeakPlot_map = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakPlot_map
	
	// local variables
	string graphNm, FullGraphNm, LegendStr
	variable idex, numSelect
	
	numSelect = dimsize(ReconstTotalFpeaks,1) //imu2.05 was dim 2 -- was that ever correct?
	
	graphNm = "ReconstTotal" 
	if(stringmatch(graphDest, "panel"))
		FullGraphNm = "pmf_plot_panel#" + graphNm
		// clear the old graph, if it exists
		gen_kill_subwindow("pmf_plot_panel", graphNm)		
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(999,239,1314,407)/K=1
	else	// window
		FullGraphNm = "pop_"+graphNm
		string winTitleStr = "Total signal for All Species"
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm/K=1 as  winTitleStr  // make the new one		
	endif
			
	// put measured trace on plot -- only goes on once, no dependence on PlotFpeakCheck
	AppendToGraph/W=$FullGraphNm TotalSignal_as_Tseries vs rowDescrWv
	ModifyGraph/W=$FullGraphNm rgb(TotalSignal_as_Tseries)=(51456,44032,58880), mode(TotalSignal_as_Tseries)=3
	ModifyGraph/W=$FullGraphNm marker(TotalSignal_as_Tseries)=19,msize(TotalSignal_as_Tseries)=2

	for(idex=0; idex<numSelect; idex+=1)
		// put total reconstructed signal
		AppendToGraph/W=$FullGraphNm ReconstTotalFpeaks[][0][idex] vs rowDescrWv
	endfor
	pmf_colorize_tracesSameName(FullGraphNm, "ReconstTotalFpeaks")
		
	// append legend
	LegendStr = "\\s(TotalSignal_as_Tseries) Measured Total Spec Signal\r\\s(ReconstTotalFpeaks) Reconst Total Spec Signal"
	Legend/W=$FullGraphNm/C/N=text0/J/X=-40.00 LegendStr

	ModifyGraph/W=$FullGraphNm zero(left)=1
	//imu2.03 SetAxis/W=$FullGraphNm left 0,*		
	//imu2.03 set axis min to 0 or the lowest value, whichever is lower
	WaveStats/q/m=1 TotalSignal_as_Tseries
	if(V_min > 0)
		SetAxis/W=$FullGraphNm left 0, *
	else
		SetAxis/W=$FullGraphNm left v_min, *
	endif
	Label/W=$FullGraphNm left "Total Mass"

	ModifyGraph grid=2,gridRGB=(34816,34816,34816)		// 1.3J


 	// trying to fix an issue with drawing layers on the panel
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif

End

// updates ReconstOneSpecies or ReconstTotal to show stacked factors, does the work of pmf_check_Reconst_showStacked
Function pmf_plotck_Reconst_showStacked(panelOrWin,graphName)
	String panelOrWin
	string graphName

	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	svar RowDescrWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rowDescrWvNm
	svar DataMxNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:DataMxNm	//1.04A
	wave DataMx = $(pmfDFnm+DataMxNm)		//1.04A
 	wave TotalSignal_as_Tseries = $(pmfDFnm+"TotalSignal_as_Tseries")
 	wave ReconstTotalFpeaks =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ReconstTotalFpeaks			// multi-fpeak aware, has one column
	
	wave p_map = $pmfDFNm+"p_map"
	wave RowDescrWv = $pmfDFNm+rowDescrWvNm
	wave rgbTable = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rgbTable
	
	nvar Reconst_ShowStackedCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Reconst_ShowStackedCheck
	
	string tempStr, thisGraphNm
	variable idex, currentp, nump, maxp
	
	nump = numpnts(p_map)
	maxp = p_map[nump-1]
	currentp = p_map[pdex]
	
	if (!stringmatch(panelOrWin, "window" ))
		thisGraphNm = "pmf_plot_panel#"
	else
		thisGraphNm = "pop_"
	endif
	
	if (stringmatch(graphName, "ReconstTotal"))
		thisGraphNm+="ReconstTotal"
		if (Reconst_ShowStackedCheck)
			for(idex=0;idex<currentp; idex+=1)
				tempStr = "TseriesFactor"+num2istr(idex+1)	// when removing a trace we don't need the entire path
				wave TSeriesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:"+tempStr
				AppendToGraph/W=$thisGraphNm TSeriesFactorX vs RowDescrWv
				
				ModifyGraph/W=$thisGraphNm rgb($tempStr)=(rgbTable[mod(idex, dimsize(rgbTable,0))][0], rgbTable[mod(idex, dimsize(rgbTable,0))][1], rgbTable[mod(idex, dimsize(rgbTable,0))][2])  //DTS 3.00B
				ModifyGraph/W=$thisGraphNm mode($tempStr)=7
				ModifyGraph/W=$thisGraphNm toMode($tempStr)=2
				ModifyGraph/W=$thisGraphNm hbFill($tempStr)=5
				ReorderTraces/W=$thisGraphNm TotalSignal_as_Tseries,{$tempStr}		// reorder traces so that measured is on top
				if (idex == currentp -1)		// the last one is not stacked to the next 1.04A
					ModifyGraph/W=$thisGraphNm toMode($tempStr)=0
				endif
			endfor	
		else
			for(idex=0;idex<maxp; idex+=1)
				tempStr = "TseriesFactor"+num2istr(idex+1)		// when removing a trace we don't need the entire path
				RemoveFromGraph/Z/W=$"pmf_plot_panel#ReconstTotal" $tempStr
			endfor
		endif
			
	else		// individual species
		thisGraphNm+="ReconstOneSpecies"
		if (Reconst_ShowStackedCheck)
			for(idex=0;idex<currentp; idex+=1)
				tempStr = "SpeciesFactor"+num2istr(idex+1)		// when removing a trace we don't need the entire path
				wave SpeciesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:"+tempStr
				AppendToGraph/W=$thisGraphNm/L=left SpeciesFactorX vs RowDescrWv
				
				ModifyGraph/W=$thisGraphNm rgb($tempStr)=(rgbTable[mod(idex,10)][0], rgbTable[mod(idex,10)][1], rgbTable[mod(idex,10)][2])  //DTS 3.00B
				ModifyGraph/W=$thisGraphNm mode($tempStr)=7
				ModifyGraph/W=$thisGraphNm toMode($tempStr)=2
				ModifyGraph/W=$thisGraphNm hbFill($tempStr)=5
				ReorderTraces/W=$thisGraphNm $NameofWave(DataMx),{$tempStr}		// reorder traces so that measured is on top
				if (idex == currentp -1)		// the last one is not stacked to the next 1.04A
					ModifyGraph/W=$thisGraphNm toMode($tempStr)=0
				endif
			endfor	
		else
			for(idex=0;idex<maxp; idex+=1)
				tempStr = "SpeciesFactor"+num2istr(idex+1)		// when removing a trace we don't need the entire path
				RemoveFromGraph/Z/W=$"pmf_plot_panel#ReconstOneSpecies" $tempStr
			endfor
		endif
	endif
	
End


// general purpose function for killing a subwindow in a panel
Function gen_kill_subwindow(parentPanelStr, subWindowStr)
string parentPanelStr, subWindowStr

	string ChildStr, ChildList, FullGraphNm, MyWinList
	variable idex, numList
	
	MyWinList = WinList(parentPanelStr, ";", "WIN:64" )

	if (strLen(MyWinList)>0)
		FullGraphNm =  parentPanelStr+"#"+subWindowStr
		ChildList = ChildWindowList(parentPanelStr)
		numList=itemsinlist(childList)
		
		// clear the old graph, if it exists
		for(idex = 0;idex < numList; idex+= 1)
			ChildStr = stringfromlist(idex, childList)
			if(stringmatch(ChildStr, subWindowStr))
				killwindow $FullGraphNm
				return 1
			endif
		endfor
	else
		return 0		// no child window existed
	endif
	
End

// colorize only those traces that have the same name (as for use in multi fpeak)
Function pmf_colorize_tracesSameName(graphname, traceName)
string graphname, traceName
	
	wave rgbTable = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rgbTable	
	
	variable red, green, blue
	variable i, index, numTraces
	string traceList, traceStr, mytraceNameList

	if (strlen(graphName) == 0)
		return -1
	endif

	traceList = TraceNameList(graphname, ";", 1 )
	numTraces = ItemsInList(traceList)

	mytraceNameList=""
	for(i=0; i<numTraces; i+=1)	
		traceStr = lowerstr(stringfromList(i,traceList))
		if (strsearch(traceStr, lowerstr(traceName),0)==0)
			mytraceNameList+= traceStr+";"
		endif
	endfor
	
	numTraces = ItemsInList(mytraceNameList)

	for(i=0; i<numTraces; i+=1)
		traceStr = stringfromList(i,mytraceNameList)
		index = mod(i, 10)				// Wrap after 10 traces.
		red = rgbTable[index][0]
		green = rgbTable[index][1]
		blue = rgbTable[index][2]

		ModifyGraph/W=$GraphName rgb($traceStr)=(red, green, blue)  // this assumes that we're changing the active graph
	endfor

End


Function pmf_button_pop_FactProfilePlot(ctrlName) : ButtonControl
	string ctrlName

	pmf_plot_factorProfile("window")	
	
	nvar FactorProfile_MaxIs100Check = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorProfile_MaxIs100Check
	nvar FactorProfile_LogCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorProfile_LogCheck
//	pmf_check_FactorProfileLog("",FactorProfile_LogCheck)
//	pmf_check_FactorProfileMaxIs100("",FactorProfile_MaxIs100Check)

	ShowInfo

End

// creates/updates the FactorProfile plot
Function pmf_plot_FactorProfile(graphDest)
	string graphDest
	
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar ColDescrWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColDescrWvNm
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar FactNum= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:factNum
	nvar FullHeight = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FullHeight
	nvar FactorProfile_LogCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorProfile_LogCheck
	nvar plotpcheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotpcheck	
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
//	wave ColDescrWv = $pmfDFNm+ColDescrWvNm	
	wave ColDescrWv = root:ACSM:PMF_Exported_Waves:noNaNs_MSS_base
	wave p_map = $pmfDFNm+"p_map"
		
	// local variables
	string graphNm, FullGraphNm, winTitleStr, AxList, axisName
	variable idex,jdex, LeftAnchor, TopAnchor, SelectDex, numSelect, ScalarVar, solutionSpaceVar, maxp

	if (FactNum>Current_pVal)
		print "// The currently selected factor doesn't exist because the currently selected number of factors is less than the factor."
	endif

	maxp = p_map[numpnts(p_map)-1]
	
	wave ProfileFactorMx = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactor1"
	numSelect = dimsize(ProfileFactorMx,1) //sum(fpeakplot_map)
	
	// setup window
	graphNm = "FactorProfile"
	if(stringmatch(graphDest, "panel"))
		graphNm = "FactorProfile"
		FullGraphNm = "pmf_plot_panel#"+graphNm
		// kill old window
		gen_kill_subwindow("pmf_plot_panel", graphNm)	
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(341,239,656,407)/K=1
	else	// (stringmatch(graphDest, "Window"))
		FullGraphNm = "pop_"+graphNm
		winTitleStr = "Current Factor Profile" 
		
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm as  winTitleStr  // make the new one
		controlbar/t 25
//		CheckBox FactorLogCheckBox,pos={125,5},size={66,14},proc=pmf_check_FactorProfileLog,title="Log Scale"
//		CheckBox FactorLogCheckBox,variable= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:factorProfile_LogCheck
//		CheckBox XaxisTo100,pos={10,5},size={90,14},proc=pmf_check_FactorProfileMaxIs100,title="x-axis max=100"
//		CheckBox XaxisTo100,variable= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorProfile_MaxIs100Check
		//HS v2_09 add window hook to allow some dynamic features
		SetWindow $FullGraphNm hook(FactProfHook) = pmf_FactProfHook
	endif

    ///// PLOTTING
	// 3 cases for profiles: plot one factor, or all on separate axes, or all on same
// particular factor
	if (factnum>0)	// selected a particular factor
		if (factnum <= Current_pVal || plotPCheck!=1)						//  -1 correct for index starting at 0
			wave ProfileFactorMx = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactor"+num2istr(factnum)
			for(SelectDex = 0; SelectDex < numSelect; SelectDex += 1)
				AppendtoGraph/W=$FullGraphNm ProfileFactorMx[][SelectDex] vs colDescrWv
				ModifyGraph/W=$FullGraphNm mode=1	// sticks
	//			ModifyGraph/W=$FullGraphNm muloffset($NameofWave(ProfileFactorMx))={0,1}
				if(numSelect == 1) // current fpeak only, show ordered color
		 			pmf_colorize_1trace(FullGraphNm, factnum-1, "ProfileFactor")
		 		else // color by fpeak
					pmf_colorize_tracesSameName(FullGraphNm, "ProfileFactor"+num2istr(factnum))
				endif
			endfor
			ModifyGraph/W=$FullGraphNm freePos(left)={0,bottom} //imu2.03 changed 10 to 0
			Label/W=$FullGraphNm left "Fraction of signal"
		endif

// factors on own axes				
	elseif (factnum==0 || factnum == -2)	//imu2.03 new "-2" version requested by Pete: overlay TS, show MS separately 
	// make factors on own plots (never all on one plot, as in tseries plots)		
		if (plotpcheck==1)
			maxp = Current_pVal
		endif
//		axissize = (1/maxp* (FullHeight + 0.02)) - 0.02  //imu2.05
		
//		for(idex=Current_pVal-1;idex>=0;idex-=1)
		for(idex=0;idex<maxp;idex+=1)
			wave ProfileFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactor"+num2istr(idex+1)  // will use first fpeak
			for(selectDex=0;selectDex<numselect;selectDex+=1)		
				axisName = "left_" + num2istr(idex) 
				AppendToGraph/W=$FullGraphNm/L=$axisname ProfileFactorX[][selectDex] vs ColDescrWv
				ModifyGraph/W=$FullGraphNm axisEnab($axisname)={real(gen_AxisRange(idex+1, maxp, 0.02)),imag(gen_AxisRange(idex+1, maxp, 0.02))} //Place axes in correct location
//				Label/W=$FullGraphNm $axisname "Fract. of sig."
				ModifyGraph/W=$FullGraphNm lblPos($axisname)=60
				ModifyGraph/W=$FullGraphNm freePos($axisname)={0,bottom}  //imu2.03 changed 10 to 0
//				ModifyGraph/W=$FullGraphNm muloffset($NameofWave(ProfileFactorX))={0,1}
				if(idex != 0)  // bottom graph has automatic zero line
					ModifyGraph/W=$FullGraphNm zero($axisname)=1
				endif
			endfor
			if(numSelect != 1) // current fpeak only, show ordered color
				pmf_colorize_tracesSameName(FullGraphNm, "ProfileFactor"+num2istr(idex+1))
			else
				pmf_colorize_tracesSameName(FullGraphNm, "ProfileFactor")
			endif
			if (idex==0)
				Label/W=$FullGraphNm $axisname  "Fraction of signal"	
			endif
		endfor
		ModifyGraph/W=$FullGraphNm mode=1 // sticks
		
	else		// <0, 
		if (plotpcheck==1)
			maxp = Current_pVal
		endif
		for(idex=0;idex<maxp;idex+=1)
			wave ProfileFactorScaledX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactorScaled"+num2istr(idex+1)		// change in 1.04A
			for(selectDex=0;selectDex<numselect;selectDex+=1)		
				AppendToGraph/W=$FullGraphNm/L=left ProfileFactorScaledX[][selectDex]  vs ColDescrWv
			endfor
			if(numSelect == 1) // current fpeak only, show ordered color
				pmf_colorize_1trace(FullGraphNm, idex, "ProfileFactorScaled"+num2istr(idex+1))
			else // color by fpeak
				pmf_colorize_tracesSameName(FullGraphNm, "ProfileFactorScaled"+num2istr(idex+1))
			endif
		endfor
		Label/W=$FullGraphNm left "Weighted Fraction of signal"
		ModifyGraph/W=$FullGraphNm Mode=1
		ModifyGraph/W=$FullGraphNm toMode=0
		ModifyGraph/W=$FullGraphNm offset={0,0}
		ModifyGraph/W=$FullGraphNm zero(left)=1
		ModifyGraph/W=$FullGraphNm lsize=2
		ModifyGraph/W=$FullGraphNm freePos(left)={0,bottom} //imu2.03 changed 10 to 0
		ModifyGraph toMode=3		// 2.0 RC2

	endif

	ModifyGraph/W=$FullGraphNm axisEnab(bottom)={0.1,1}  //imu2.03 changed 0.05 to 0.1
	ModifyGraph grid=2,gridRGB=(34816,34816,34816)		// 1.3J
	
	// Log axes	
	AxList = AxisList(FullGraphNm)

	// check the list of existing axes; make all left axes log
	for(idex = 0; idex < ItemsInList(AxList); idex += 1)
		axisName = stringFromList(idex, AxList)
		if ( !stringmatch(axisName, "bottom") )
			ModifyGraph/W=$FullGraphNm log($axisName) = FactorProfile_LogCheck
		endif
	endfor
	
	//added in 1.3J
//	pmf_check_FactorProfileMaxIs100("",nan)
	
	ModifyGraph/W=$FullGraphNm lsize=2
	ModifyGraph/W=$FullGraphNm nticks(bottom)=9
	
	// trying to fix an issue with drawing layers on the panel
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif
		
//	pmf_check_rotateTextLabels(FullGraphNm,nan) 		//2.02

End

// simple checkbox function for updating FactorProfile plot
Function pmf_check_FactorProfileLog(ctrlName,checked) : CheckBoxControl
	string ctrlName 
	variable checked

	nvar FactorProfile_LogCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorProfile_LogCheck
	nvar minY_Log_Profiles = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:minY_Log_Profiles  //imu2.03

	variable idex, jdex, numWinList, numAxList
	string AxList, ThisAxisNm, ThisWindowNm
	
	string WindowList
	
	WindowList=WinList("*FactorProfile", ";", "WIN:1")
	WindowList = addListItem("pmf_plot_panel#FactorProfile", WindowList)
	
	numWinList= itemsInList(WindowList)
	for(idex = 0; idex < numWinList; idex += 1)
		ThisWindowNm = stringFromList(idex, WindowList)
		
		// get axes in this window
		AxList = AxisList(ThisWindowNm)
		numAxList = ItemsInList(AxList)
		// check the list of existing axes; make all except the bottom log
		for(jdex = 0; jdex < numAxList; jdex += 1)
			thisAxisNm = stringFromList(jdex, AxList)
			if ( !stringmatch(thisAxisNm, "bottom") )
				ModifyGraph/W=$ThisWindowNm log($thisAxisNm) = FactorProfile_LogCheck
				//imu2.03 applies min Y value for profiles with log axis (and always sets max to 1)
				if(FactorProfile_LogCheck)  
					if(numtype(minY_Log_Profiles) != 2)  // default is NaN, if not NaN, was changed by user 
						SetAxis/W=$ThisWindowNm $thisAxisNm minY_Log_Profiles,1
					else //imu set top to 1
						SetAxis/W=$ThisWindowNm $thisAxisNm *,1
					endif
				else //imu making linear
					SetAxis/W=$ThisWindowNm/A/E=1 $thisAxisNm 
				endif
			endif
		endfor
	endfor
	
End


// checkbox function that controls the x axis of the FactorProfile graph
Function pmf_check_FactorProfileMaxIs100(ctrlName,checked) : CheckBoxControl
	String ctrlName
	Variable checked

	nvar FactorProfile_MaxIs100Check= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorProfile_MaxIs100Check

	variable idex, numWinList
	string ThisWindowNm, WindowList
	
	WindowList=WinList("*FactorProfile", ";", "WIN:1")
	WindowList = addListItem("pmf_plot_panel#FactorProfile", WindowList)
	
	numWinList= itemsInList(WindowList)
	for(idex = 0; idex < numWinList; idex += 1)
		ThisWindowNm = stringFromList(idex, WindowList)
		if (FactorProfile_MaxIs100Check)
			SetAxis/Z/W=$ThisWindowNm bottom *,100		// 2.02 change
		else
			SetAxis/Z/W=$ThisWindowNm bottom *, *		// 2.02 change
		endif
	endfor

End



///////////////////////////////////////////////////////////////////////////////////////
// SPIFFY PLOTTING ADD-ONS
///////////////////////////////////////////////////////////////////////////////////////

// color all traces with traceName according to traceNum value
Function pmf_colorize_1trace(graphname, traceNum, traceName)
string graphName, traceName
variable TraceNum
	
	wave rgbTable = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rgbTable

	string thisTraceList, thisTraceStr, mytraceNameList
	variable red, green, blue, index, numTraces

	if (strlen(graphName) == 0)
		return -1
	endif

	red = rgbTable[mod(TraceNum, dimsize(rgbTable,0))][0] // 3.00B 
	green = rgbTable[mod(TraceNum, dimsize(rgbTable,0))][1]
	blue = rgbTable[mod(TraceNum, dimsize(rgbTable,0))][2]
	
	thisTraceList = TraceNameList(graphname, ";", 1 )
	numTraces = ItemsInList(thisTraceList)

	mytraceNameList=""
	for(index=0; index<numTraces; index+=1)	
		thisTraceStr = stringfromList(index,thisTraceList)
		if (strsearch(thisTraceStr, traceName,0, 2)==0) //imu2.04 added ignore case flag
			mytraceNameList+= thisTraceStr+";"
		endif
	endfor
	
	numTraces = ItemsInList(mytraceNameList)

	for(index=0; index<numTraces; index+=1)
		thisTraceStr = stringfromList(index,mytraceNameList)
		ModifyGraph/W=$GraphName rgb($thisTraceStr)=(red, green, blue)  // this assumes that we're changing the active graph
	endfor

End

//imu2.04
// returns high and low axis ranges as a complex number (real=low, imag=high)
function/C gen_AxisRange(ThisFactorNum, numFactors, AxisSpace)
	// factorNum is a counting number (1, 2, 3, ...) not Igor number (0, 1, 2, ...) 
	variable ThisFactorNum, numFactors, AxisSpace
	
	if(AxisSpace > 1)
		AxisSpace/=100
	endif
	
	variable axisSize = (1 - (numFactors-1)*AxisSpace)/NumFactors

	if(ThisFactorNum == NumFactors)  // last factor, max axis = 1   //imu2.05  old version had a rounding error with 11 factors
		return cmplx((ThisFactorNum-1)*(axissize+axisSpace),1)
	else  // in the middle; calculation is ok
		return cmplx((ThisFactorNum-1)*(axissize+axisSpace),(ThisFactorNum)*(axissize)+(ThisFactorNum-1)*AxisSpace)
	endif
 
end

// new in 2.02
Function pmf_check_rotateTextLabels(ctrlName,checked) : CheckBoxControl
	String ctrlName
	Variable checked

	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	svar ColDescrWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColDescrWvNm
	svar ColDesTxtWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColDesTxtWvNm

	wave ColDescrWv = $(pmfDFnm+ColDescrWvNm)
	wave/t ColDescrTxtWv = $(pmfDFnm+ColDesTxtWvNm)

	svar ResidualRatios_Str= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualRatios_Str

	// 	global variable added in version 2.02.
	gen_initializeGlobalNVar("root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rotateTextLabels", 0)
	nvar rotateTextLabels = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rotateTextLabels
	
	strswitch(ctrlName)

	case "RotateTextLabels":
		if (rotateTextLabels)
			ModifyGraph/W=pmf_plot_panel#FactorProfile tkLblRot(bottom)=90,userticks(bottom)={ColDescrWv,ColDescrTxtWv}, fSize(bottom)=8
			ModifyGraph/W=pmf_plot_panel#ScaResidAllSpecies tkLblRot(bottom)=90,userticks(bottom)={ColDescrWv,ColDescrTxtWv}, fSize(bottom)=8
			if (stringmatch(ResidualRatios_Str, "profiles") )
				ModifyGraph/W=pmf_plot_panel#ResidualRatios tkLblRot(bottom)=90,userticks(bottom)={ColDescrWv,ColDescrTxtWv}, fSize(bottom)=8
			endif
			
			if (strlen(WinList("pop_FactorProfile", ";", "WIN:1"))>0)
				ModifyGraph/W=pop_FactorProfile tkLblRot(bottom)=90,userticks(bottom)={ColDescrWv,ColDescrTxtWv}, fSize(bottom)=8
			endif
			if (strlen(WinList("pop_ScaResidAllSpecies", ";", "WIN:1"))>0)
				ModifyGraph/W=pop_ScaResidAllSpecies tkLblRot(bottom)=90,userticks(bottom)={ColDescrWv,ColDescrTxtWv}, fSize(bottom)=8
			endif
			if (strlen(WinList("pop_ResidualRatios", ";", "WIN:1"))>0)
				if (stringmatch(ResidualRatios_Str, "profiles") )
					ModifyGraph/W=pop_ResidualRatios tkLblRot(bottom)=90,userticks(bottom)={ColDescrWv,ColDescrTxtWv}, fSize(bottom)=8
				endif
			endif		
			// 2.08
			if (FindListItem("FamilyColored", ChildWindowList("pmf_plot_panel"))>=0)
				nvar ColorFamilyUMR =  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColorFamilyUMR
				if (!ColorFamilyUMR)  // HR
					ModifyGraph/W=pmf_plot_panel#familyColored tkLblRot(bottom)=90,userticks(bottom)={ColDescrWv,ColDescrTxtWv}, fSize(bottom)=8
					if (strlen(WinList("pop_familyColored", ";", "WIN:1"))>0)
						ModifyGraph/W=pop_familyColored tkLblRot(bottom)=90,userticks(bottom)={ColDescrWv,ColDescrTxtWv}, fSize(bottom)=8
					endif
				endif
			endif				

		else
			ModifyGraph/W=pmf_plot_panel#FactorProfile  tkLblRot=0,userticks(bottom)=0, fSize(bottom)=10
			ModifyGraph/W=pmf_plot_panel#ScaResidAllSpecies  tkLblRot=0,userticks(bottom)=0, fSize(bottom)=10
			if (stringmatch(ResidualRatios_Str, "profiles") )
				ModifyGraph/W=pmf_plot_panel#ResidualRatios tkLblRot=0,userticks(bottom)=0, fSize(bottom)=10
			endif
	
			if (strlen(WinList("pop_FactorProfile", ";", "WIN:1"))>0)
				ModifyGraph/W=pop_FactorProfile  tkLblRot=0,userticks(bottom)=0, fSize(bottom)=10
			endif
			if (strlen(WinList("pop_ScaResidAllSpecies", ";", "WIN:1"))>0)
				ModifyGraph/W=pop_ScaResidAllSpecies  tkLblRot=0,userticks(bottom)=0, fSize(bottom)=10
			endif
			if (strlen(WinList("pop_ResidualRatios", ";", "WIN:1"))>0)
				if (stringmatch(ResidualRatios_Str, "profiles") )
					ModifyGraph/W=pop_ResidualRatios  tkLblRot=0,userticks(bottom)=0, fSize(bottom)=10
				endif
			endif		
	
			// 2.08
			if (FindListItem("FamilyColored", ChildWindowList("pmf_plot_panel"))>=0)
				nvar ColorFamilyUMR =  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColorFamilyUMR
				if (!ColorFamilyUMR)  // HR
					ModifyGraph/W=pmf_plot_panel#familyColored  tkLblRot=0,userticks(bottom)=0, fSize(bottom)=10
					if (strlen(WinList("pop_familyColored", ";", "WIN:1"))>0)
						ModifyGraph/W=pop_familyColored  tkLblRot=0,userticks(bottom)=0, fSize(bottom)=10
					endif
				endif
			endif				

		endif
	break 
	default  :  //  This function was not called from the checkbox in the panel, rather it was called via a "PMF_plot_XX function and the ctrlName is the actual name of the graph	
		if (strsearch(ctrlName,"FactorProfile", 0)  >=0 || strsearch(ctrlName,"ScaResidAllSpecies", 0)  >=0)
			if (rotateTextLabels)
				ModifyGraph/W=$ctrlName tkLblRot(bottom)=90,userticks(bottom)={ColDescrWv,ColDescrTxtWv}, fSize(bottom)=8
			else
				ModifyGraph/W=$ctrlName  tkLblRot=0,userticks(bottom)=0, fSize(bottom)=10
			endif	
		elseif (FindListItem("FamilyColored", ChildWindowList("pmf_plot_panel"))>=0 )		
			nvar ColorFamilyUMR =  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColorFamilyUMR
			if (!ColorFamilyUMR)  // HR
				if (rotateTextLabels)
					ModifyGraph/W=$ctrlName tkLblRot(bottom)=90,userticks(bottom)={ColDescrWv,ColDescrTxtWv}, fSize(bottom)=8
				else
					ModifyGraph/W=$ctrlName  tkLblRot=0,userticks(bottom)=0, fSize(bottom)=10
				endif	
			endif				
		endif
	endswitch
		
End


// For initializing global variables
Function gen_initializeGlobalNVar(NVarName, NVarVal)
string NVarName
variable NVarVal

	nvar/z myVar = $NVarName
	if (!NVar_Exists(myVar))
		variable/g $NVarName
		NVar/z myVar = $NVarName
		myVar = NVarVal
	endif

End

Function pmf_button_pop_FactTser_Tseries(ctrlName) : ButtonControl
	string ctrlName
	
	svar FactorTseries_Str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorTseries_Str
	string tempStr = FactorTseries_Str
	
	DFREF currdf = getdatafolderDFR()
	
	setdatafolder root:ACSM:PMF_Exported_Waves:pmf_plot_globals:
	string/g diurnaltype = "tseries"
	
	setdatafolder currdf

	FactorTseries_Str = "tseries"
	pmf_plot_FactorTseries("window")
	FactorTseries_Str = tempStr

	ShowInfo

End


// creates/updates FactorTseries plot, uses FactorTseries_Str set by radio buttons
Function pmf_plot_FactorTseries(graphDest)	
	string graphDest

	svar FactorTseries_Str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorTseries_Str

	if (stringmatch(FactorTseries_Str, "tseries"))
		pmf_plot_TseriesTSFactor(graphDest)
	elseif (stringmatch(FactorTseries_Str, "fract"))
		pmf_plot_TseriesFractFactor(graphDest)
	else
		pmf_plot_TseriesDiurnalFactor(graphDest)
	endif

End



// displays Tseries for one factor in panel, or window
Function pmf_plot_TseriesTSFactor(graphDest)	
	string graphDest
	
	// get global strings for data location, waves
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar RowDescrWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rowDescrWvNm
	
	// get global variables
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar Factnum = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Factnum
	nvar FullHeight = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FullHeight
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
	nvar plotPCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotPCheck

	svar FactorTseries_Str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorTseries_Str

	// access waves
	wave p_map = $pmfDFNm+"p_map"
//	wave RowDescrWv = $pmfDFNm+rowDescrWvNm
	wave RowDescrWv = root:ACSM:PMF_Exported_Waves:t_start	
	wave fpeak_map = $pmfDFNm+"fpeak_map"
	
	// local variables and strings
	variable idex,jdex, fpeakCounter, LeftAnchor, TopAnchor, numfpeakPlot_map, selectDex, numSelect, maxp
	string graphNm, winTitleStr, FullGraphNm,LegendStr, AxisName, AxList
		
	wave TSeriesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TSeriesFactor1"
	numSelect = dimsize(TSeriesFactorX,1)
	
	maxp = p_map[numpnts(p_map)-1]
		
	// setup window
	graphNm = "FactorTseries"
	if(stringmatch(graphDest, "panel"))
		FullGraphNm = "pmf_plot_panel#"+graphNm
		// clear the old graph, if it exists
		gen_kill_subwindow("pmf_plot_panel", graphNm)				
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(12,239,327,407)/K=1
	else	// window
		FullGraphNm = "pop_"+graphNm
		winTitleStr = "Current Factor Contribution tseries" 
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm/K=1 as  winTitleStr  // make the new one
	endif

	// 3 cases for plotting, based on factnum: particular factor is selected, plot all on separate axes, or plot all on one axis			
	// plot a selected FACTOR
	if (factnum>0)	// particular factor selected
		// only display if that factor exists for the selected p
		if (factnum <= Current_pVal || plotPCheck!=1)						//  -1 correct for index starting at 0
		
			for(selectdex = 0; selectdex <numselect; selectdex += 1)
				wave TSeriesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TSeriesFactor"+num2istr(factnum)
				AppendToGraph/W=$FullGraphNm  TSeriesFactorX[][selectdex] vs rowDescrWv
			endfor
			ModifyGraph/W=$FullGraphNm freePos(left)={0,bottom}
			Label/W=$FullGraphNm left "Mass"
			if(numSelect == 1) // current fpeak only, show ordered color
				pmf_colorize_1trace(FullGraphNm, factnum-1, "TSeriesFactor"+num2istr(factnum))
			else // color by fpeak
				pmf_colorize_tracesSameName(FullGraphNm, "TSeriesFactor"+num2istr(factnum))
			endif
		endif

	// plot all factors on own axes
	elseif (factnum==0)		// plot all factors on their own axes
		if (plotpcheck==1)
			maxp = Current_pVal
		endif
//		axisSize = (1/maxp * (FullHeight + 0.02)) - 0.02 //imu2.05
		for(idex=0;idex<maxp;idex+=1)
//		for(idex=Current_pVal-1;idex>=0;idex-=1)
			wave TSeriesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TSeriesFactor"+num2istr(idex+1)
			for(selectdex = 0; selectdex < numselect; selectdex += 1)
				axisName = "left_new_" + num2istr(idex) 
				AppendToGraph/W=$FullGraphNm/L=$axisname TSeriesFactorX[][selectdex] vs rowDescrWv
				ModifyGraph/W=$FullGraphNm axisEnab($axisname)={real(gen_AxisRange(idex+1, maxp, 0.02)),imag(gen_AxisRange(idex+1, maxp, 0.02))}, freePos($axisname)=0   //Place axes in correct location
				ModifyGraph/W=$FullGraphNm zero($axisname)=1	// zero lines on other axes					
				ModifyGraph/W=$FullGraphNm lblPos($axisname)=40
				ModifyGraph/W=$FullGraphNm freePos($axisname)={0,bottom}
			endfor
			if(numSelect != 1) // current fpeak only, show ordered color
				pmf_colorize_tracesSameName(FullGraphNm, "TSeriesFactor"+num2istr(idex+1))
			else
				pmf_colorize_tracesSameName(FullGraphNm, "TSeriesFactor")
			endif
			if (idex == 0)
				Label/W=$FullGraphNm $axisname "Mass"
			endif
		endfor	
			
	// All factors on same axis
	elseif (factnum<0)		// plot all factors on same axis
		if (plotpcheck==1)
			maxp = Current_pVal
		endif
		for(idex=0;idex<maxp;idex+=1)
			wave TSeriesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TSeriesFactor"+num2istr(idex+1)
			for(selectdex=0;selectdex<numselect;selectdex+=1)
				AppendToGraph/W=$FullGraphNm TSeriesFactorX[][selectdex] vs rowDescrWv
			endfor
			Label/W=$FullGraphNm left "Mass"
			ModifyGraph/W=$FullGraphNm freePos(left)={0,bottom}
			if(numSelect == 1) // current fpeak only, show ordered color
				pmf_colorize_1trace(FullGraphNm, idex, "TSeriesFactor"+num2istr(idex+1))
			else // color by fpeak
				pmf_colorize_tracesSameName(FullGraphNm, "TSeriesFactor"+num2istr(idex+1))
			endif
		endfor
	endif
	
	ModifyGraph grid=2,gridRGB=(34816,34816,34816)		// 1.3J

	// autoscale vertical axes from 0
	// Log axes	
	AxList = AxisList(FullGraphNm)

	// check the list of existing axes; make all left axes log
	for(idex = 0; idex < ItemsInList(AxList); idex += 1)
		AxisName = stringFromList(idex, AxList)
		if ( !stringmatch(AxisName, "bottom") )
			SetAxis/W=$FullGraphNm/A/E=1 $AxisName
		endif
	endfor

	// legend very confusing with mulitple ps being allowed.  Simply removed in 1.3J
	LegendStr = ""
	if (numSelect != 1) // = 1 is current, don't need fpeak legend
//		fpeakCounter = 0
//		for(jdex = 0; jdex < numfpeakPlot_map; jdex += 1)
//			if(fpeakPlot_map[jdex] == 1) // add to legend
//				fpeakCounter += 1
//				LegendStr += "\\s(Gmx4d#" + num2istr(fpeakCounter*p_map[pdex] - 1) + ") fpeak = " 
//				LegendStr += num2str(fpeak_map[jdex]) + "\r"
//			endif
//		endfor
	endif
		
	ModifyGraph/W=$FullGraphNm axisEnab(bottom)={0.05,1}		// too squishy otherwise
	
	Legend/C/N=text0/J/X=-40.00/W=$FullGraphNm LegendStr
	
	// trying to fix an issue with drawing layers on the panel
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif

End


//imu2.04 added in this version
// displays stacked fraction of tseries for each factor + residual in panel, or window
// for single solution space, fills to next
//	multiple solution space, does not fill (colors by solution space)
Function pmf_plot_TseriesFractFactor(graphDest)	
	string graphDest
	
	// get global strings for data location, waves
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar RowDescrWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rowDescrWvNm
	
	// get global variables
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar Factnum = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Factnum
	nvar FullHeight = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FullHeight
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
	nvar plotPCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotPCheck

	svar FactorTseries_Str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorTseries_Str

	// access waves
	wave p_map = $pmfDFNm+"p_map"
//	wave RowDescrWv = $pmfDFNm+rowDescrWvNm	
	wave RowDescrWv = root:ACSM:PMF_Exported_Waves:t_start
	wave fpeak_map = $pmfDFNm+"fpeak_map"
	
	// local variables and strings
	variable idex,jdex, fpeakCounter, LeftAnchor, TopAnchor, numfpeakPlot_map, selectDex, numSelect, maxp
	string graphNm, winTitleStr, FullGraphNm,LegendStr="", AxisName, AxList  //3.05E
		
	wave TSeriesFractFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TSeriesFractFactor1" //imu2.04
	numSelect = dimsize(TSeriesFractFactorX,1) //imu2.04
	
	maxp = p_map[numpnts(p_map)-1]
		
	// setup window
	graphNm = "FactorTseries"
	if(stringmatch(graphDest, "panel"))
		FullGraphNm = "pmf_plot_panel#"+graphNm
		// clear the old graph, if it exists
		gen_kill_subwindow("pmf_plot_panel", graphNm)				
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(12,239,327,407)/K=1
	else	// window
		FullGraphNm = "pop_"+graphNm
		winTitleStr = "Current Factor Contribution tseries" 
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm/K=1 as  winTitleStr  // make the new one
	endif

	// 3 cases for plotting, based on factnum: particular factor is selected, plot all on separate axes, or plot all on one axis			
	// plot a selected FACTOR
	if (factnum>0)	// particular factor selected
		// only display if that factor exists for the selected p
		if (factnum <= Current_pVal || plotPCheck!=1)						//  -1 correct for index starting at 0
		
			for(selectdex = 0; selectdex <numselect; selectdex += 1)
				wave TSeriesFractFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TSeriesFractFactor"+num2istr(factnum)
				AppendToGraph/W=$FullGraphNm  TSeriesFractFactorX[][selectdex] vs rowDescrWv
			endfor
			ModifyGraph/W=$FullGraphNm freePos(left)={0,bottom}
			Label/W=$FullGraphNm left "Fraction of Mass"
			if(numSelect == 1) // current fpeak only, show ordered color
				pmf_colorize_1trace(FullGraphNm, factnum-1, "TSeriesFractFactor"+num2istr(factnum))
			else // color by fpeak
				pmf_colorize_tracesSameName(FullGraphNm, "TSeriesFractFactor"+num2istr(factnum))
			endif
		endif

	// plot all factors on own axes
	elseif (factnum==0)		// plot all factors on their own axes
		if (plotpcheck==1)
			maxp = Current_pVal
		endif
//		axisSize = (1/maxp * (FullHeight + 0.02)) - 0.02  //imu2.05
		for(idex=0;idex<maxp;idex+=1)
//		for(idex=Current_pVal-1;idex>=0;idex-=1)
			wave TSeriesFractFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TSeriesFractFactor"+num2istr(idex+1)
			for(selectdex = 0; selectdex < numselect; selectdex += 1)
				axisName = "left_new_" + num2istr(idex) 
				AppendToGraph/W=$FullGraphNm/L=$axisname TSeriesFractFactorX[][selectdex] vs rowDescrWv
				ModifyGraph/W=$FullGraphNm axisEnab($axisname)={real(gen_AxisRange(idex+1, maxp, 0.02)),imag(gen_AxisRange(idex+1, maxp, 0.02))}, freePos($axisname)=0   //Place axes in correct location
				ModifyGraph/W=$FullGraphNm zero($axisname)=1	// zero lines on other axes					
				ModifyGraph/W=$FullGraphNm lblPos($axisname)=40
				ModifyGraph/W=$FullGraphNm freePos($axisname)={0,bottom}
			endfor
			if(numSelect != 1) // current fpeak only, show ordered color
				pmf_colorize_tracesSameName(FullGraphNm, "TSeriesFractFactor"+num2istr(idex+1))
			else
				pmf_colorize_tracesSameName(FullGraphNm, "TSeriesFractFactor")
			endif
			if (idex == 0)
				Label/W=$FullGraphNm $axisname "Fraction of Mass"
			endif
		endfor	
			
	// All factors on same axis
	elseif (factnum<0)		// plot all factors on same axis
		if (plotpcheck==1)
			maxp = Current_pVal
		endif
		for(idex=0;idex<maxp;idex+=1)
			wave TSeriesFractFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TSeriesFractFactor"+num2istr(idex+1)
			for(selectdex=0;selectdex<numselect;selectdex+=1)
				AppendToGraph/W=$FullGraphNm TSeriesFractFactorX[][selectdex] vs rowDescrWv
			endfor
			Label/W=$FullGraphNm left "Fraction of Mass"
			ModifyGraph/W=$FullGraphNm freePos(left)={0,bottom}
			if(numSelect == 1) // current fpeak only, show ordered color
				pmf_colorize_1trace(FullGraphNm, idex, "TSeriesFractFactor"+num2istr(idex+1))
			else // color by fpeak
				pmf_colorize_tracesSameName(FullGraphNm, "TSeriesFractFactor"+num2istr(idex+1))
			endif
			ModifyGraph/W=$FullGraphNm mode=7,hbFill=5,toMode=3 // stack and shade
			SetDrawEnv ycoord= left, linefgc= (0,65280,65280)
			DrawLine 0,1,1,1
			SetDrawEnv linethick= 1.5
		endfor
	endif
	
	ModifyGraph grid=2,gridRGB=(34816,34816,34816)		// 1.3J

	// autoscale vertical axes from 0
	// Log axes	
	AxList = AxisList(FullGraphNm)

	// check the list of existing axes; make all left axes log
	for(idex = 0; idex < ItemsInList(AxList); idex += 1)
		AxisName = stringFromList(idex, AxList)
		if ( !stringmatch(AxisName, "bottom") )
			SetAxis/W=$FullGraphNm/A/E=1 $AxisName
		endif
	endfor

	// legend very confusing with mulitple ps being allowed.  Simply removed in 1.3J
	if (numSelect != 1) // = 1 is current, don't need fpeak legend
		LegendStr = ""
//		fpeakCounter = 0
//		for(jdex = 0; jdex < numfpeakPlot_map; jdex += 1)
//			if(fpeakPlot_map[jdex] == 1) // add to legend
//				fpeakCounter += 1
//				LegendStr += "\\s(Gmx4d#" + num2istr(fpeakCounter*p_map[pdex] - 1) + ") fpeak = " 
//				LegendStr += num2str(fpeak_map[jdex]) + "\r"
//			endif
//		endfor
	endif
		
	ModifyGraph/W=$FullGraphNm axisEnab(bottom)={0.05,1}		// too squishy otherwise
	
	Legend/C/N=text0/J/X=-40.00/W=$FullGraphNm LegendStr
	
	// trying to fix an issue with drawing layers on the panel
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif

End



// creates FactorTSeries plot for "diurnal" option
Function pmf_plot_TseriesDiurnalFactor(graphDest)
	string graphDest
		
	// get global variables
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar diurnalType = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnalType
	
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar factnum = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:factnum
	nvar FullHeight = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FullHeight
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:current_pVal
	nvar plotpcheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotpcheck
	wave fpeakplot_map = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakplot_map
	wave p_map = $pmfDFNm+"p_map"

	
	// local variables and strings
	variable idex,jdex, selectdex, numselect, maxp
	
	string FullGraphNm, LegendStr="", TraceList, ThisTraceNm, AxisName	
	string graphNm, winTitleStr, idexStr, AxList

	wave TSeriesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TSeriesFactor1"
	numselect = dimsize(TSeriesFactorX,1)

	maxp = p_map[numpnts(p_map)-1]
	
	// get x wave for this diurnalType  //imu2.05
	strswitch(diurnalType)
		//2.09A  DTS added a /z to the TimeXWv designation
		case "diurnal":
			wave/z TimeXWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:diurnalHours  //imu2.06  now in plot_globals:diurnals
			wave/T/z TimeXtxtWv = $""
			break
		case "month":
			wave/z TimeXWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:monthVals
			wave/T/z TimeXtxtWv = $""
			break
		case "dayOfWeek":
			wave/z TimeXWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:dayOfWeekVals
			wave/T/z TimeXtxtWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:dayOfWeekNms
			break
		case "WeekDayEnd":
			wave/z TimeXWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:WeekDayEndVals
			wave/T/z TimeXtxtWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:WeekDayEndNms
			break
	endswitch

	
	// setup window
	if(stringmatch(graphDest, "panel"))
		// kill old window
		graphNm = "FactorTseries"
		FullGraphNm = "pmf_plot_panel#"+graphNm
	
		// clear the old graph, if it exists
		gen_kill_subwindow("pmf_plot_panel", graphNm)
		
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(12,239,327,407)/K=1
	else	// window
		FullGraphNm = "pop_DiurnalProfiles"
		 winTitleStr = "Current Factor Diurnal Profiles" 
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm/K=1 as  winTitleStr  // make the new one
	endif
	
	// 3 cases for plotting, based on factnum: particular factor is selected, plot all on separate axes, or plot all on one axis			
	// plot a selected FACTOR
	if (factnum>0)	// particular factor selected
		idexStr = num2istr(factnum)
		// only display if that factor exists for the selected p
		if (factnum <=  Current_pVal  || plotPCheck!=1)

			// a very inelegant solution to the problem of the box plot generator needing 1 dimensional waves
			for(selectdex=0;selectdex<numselect;selectdex+=1)
				wave diurnalMedian_tsX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:Median_ts" + idexStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalP0_tsX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P0_ts" + idexStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalP25_tsX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P25_ts" + idexStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalP75_tsX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P75_ts" + idexStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalP100_tsX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P100_ts" + idexStr+"_"+diurnalType+"_f"+num2istr(selectdex)			

				SetDataFolder root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:
				gen_fBoxPlot_graphAxNm(diurnalMedian_tsX,diurnalP75_tsX, diurnalP25_tsX, diurnalP100_tsX, diurnalP0_tsX, TimeXWv, 0.3, 0, $"", $"", 0, 0, 0,FullGraphNm, "left")

				SetDataFolder root:ACSM:PMF_Exported_Waves:pmf_plot_globals:
			endfor

			if(numselect == 1) // current fpeak only, show ordered color
				pmf_colorize_1trace(FullGraphNm, factnum-1,"Median_ts"+idexStr)
				pmf_colorize_1trace(FullGraphNm, factnum-1,"P0_ts"+idexStr)
				pmf_colorize_1trace(FullGraphNm, factnum-1,"P25_ts"+idexStr)
				pmf_colorize_1trace(FullGraphNm, factnum-1,"P75_ts"+idexStr)
				pmf_colorize_1trace(FullGraphNm, factnum-1,"P100_ts"+idexStr)
			else // color by fpeak
				pmf_colorize_tracesSameName(FullGraphNm, "Median_ts"+idexStr)
				pmf_colorize_tracesSameName(FullGraphNm, "P0_ts"+idexStr)
				pmf_colorize_tracesSameName(FullGraphNm, "P25_ts"+idexStr)
				pmf_colorize_tracesSameName(FullGraphNm, "P75_ts"+idexStr)
				pmf_colorize_tracesSameName(FullGraphNm, "P100_ts"+idexStr)
			endif

			ModifyGraph/W=$FullGraphNm freePos(left)={0,bottom}
			Label/W=$FullGraphNm left "Mass"
			// 4 waves + error bars
		endif
	
	// plot all factors on own axes
	elseif (factnum==0)		// plot all factors on their own axes
		if (plotpcheck==1)
			maxp = Current_pVal
		endif
//		axisSize = (1/maxp * (FullHeight + 0.02)) - 0.02 //imu2.05

		for(idex=0;idex< maxp;idex+=1)
//		for(idex=Current_pVal-1;idex>=0;idex-=1)
			idexStr = num2istr(idex+1)
			axisName = "left_new_" + num2istr(idex) 

			// a very inelegant solution to the problem of the box plot generator needing 1 dimensional waves
			for(selectdex=0;selectdex<numselect;selectdex+=1)
				wave diurnalMedian_tsX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:Median_ts" + idexStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalP0_tsX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P0_ts" + idexStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalP25_tsX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P25_ts" + idexStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalP75_tsX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P75_ts" + idexStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalP100_tsX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P100_ts" + idexStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
			
				// boxplot code for this factor = factnum
				SetDataFolder root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals
				gen_fBoxPlot_graphAxNm(diurnalMedian_tsX, diurnalP75_tsX, diurnalP25_tsX, diurnalP100_tsX, diurnalP0_tsX, TimeXWv, 0.3, 0, $"", $"", 0, 0, 0,FullGraphNm, axisname)
				SetDataFolder root:ACSM:PMF_Exported_Waves:pmf_plot_globals:
			endfor

			if(numselect == 1) // current fpeak only, show ordered color
				pmf_colorize_1trace(FullGraphNm, idex,"Median_ts"+idexStr)
				pmf_colorize_1trace(FullGraphNm, idex,"P0_ts"+idexStr)
				pmf_colorize_1trace(FullGraphNm, idex,"P25_ts"+idexStr)
				pmf_colorize_1trace(FullGraphNm, idex,"P75_ts"+idexStr)
				pmf_colorize_1trace(FullGraphNm, idex,"P100_ts"+idexStr)
			else // color by fpeak
				pmf_colorize_tracesSameName(FullGraphNm, "Median_ts"+idexStr)
				pmf_colorize_tracesSameName(FullGraphNm, "P0_ts"+idexStr)
				pmf_colorize_tracesSameName(FullGraphNm, "P25_ts"+idexStr)
				pmf_colorize_tracesSameName(FullGraphNm, "P75_ts"+idexStr)
				pmf_colorize_tracesSameName(FullGraphNm, "P100_ts"+idexStr)
			endif
		
			ModifyGraph/W=$FullGraphNm axisEnab($axisname)={real(gen_AxisRange(idex+1, maxp, 0.02)),imag(gen_AxisRange(idex+1, maxp, 0.02))}, freePos($axisname)=0   //Place axes in correct location
			ModifyGraph/W=$FullGraphNm zero($axisname)=1	// zero lines on other axes					
			ModifyGraph/W=$FullGraphNm freePos($axisname)={0,bottom}
			ModifyGraph/W=$FullGraphNm lblPos($axisname)=40

			if (idex == 0)
				Label/W=$FullGraphNm $axisname "Mass"
			endif
		endfor

	// All factors on same axis -- show only mean and median for each, plot as lines and markers
	elseif (factnum<0)		// plot all factors on same axis
		if (plotpcheck==1)
			maxp = Current_pVal
		endif
		// current fpeak only
		for(idex=0;idex<maxp;idex+=1)
			idexStr = num2istr(idex+1)
			// get waves for this factor = factnum		
			for (selectDex=0;selectDex<numselect;selectDex+=1)// boxplot code for this factor = factnum
				wave diurnalMedian_tsX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:Median_ts" + idexStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalMean_tsX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:Mean_ts" + idexStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
				appendToGraph/W=$FullGraphNm diurnalMedian_tsX vs TimeXWv
				appendToGraph/W=$FullGraphNm diurnalMean_tsX vs TimeXWv
				ModifyGraph/W=$FullGraphNm lstyle($NameofWave(diurnalMean_tsX))=1
				ModifyGraph/W=$FullGraphNm marker($NameofWave(diurnalMean_tsX))=8
				LegendStr += "\\s(" +NameofWave(diurnalMedian_tsX)+") " + NameofWave(diurnalMedian_tsX) + "\r"
				LegendStr += "\\s(" +NameofWave(diurnalMean_tsX)+") " + NameofWave(diurnalMean_tsX) + "\r"
			endfor

			if(numselect == 1) // current fpeak only, show ordered color
				pmf_colorize_1trace(FullGraphNm, idex, "Median_ts"+idexStr)
				pmf_colorize_1trace(FullGraphNm, idex, "Mean_ts"+idexStr)
			else // color by fpeak
				pmf_colorize_tracesSameName(FullGraphNm, "diurnalMedian_ts"+idexStr)
				pmf_colorize_tracesSameName(FullGraphNm, "Mean_ts"+idexStr)
			endif

		endfor

		ModifyGraph/W=$FullGraphNm freePos(left)={0,bottom}
		Label/W=$FullGraphNm left "Mass"
		ModifyGraph/W=$FullGraphNm mode=4,marker=19		// lines and markers		
		LegendStr =LegendStr[0, strlen(LegendStr)-2]
		Legend/W=$FullGraphNm/C/N=text0/J/X=-40.00 LegendStr

	endif
	
	ModifyGraph grid=2,gridRGB=(34816,34816,34816)		// 1.3J
	ModifyGraph/W=$FullGraphNm axisEnab(bottom)={0.05,1}
	// autoscale vertical axes from 0
	AxList = AxisList(FullGraphNm)

	//imu2.05
	//if dayOfWeek or WeekDayEnd, do userTicks with text wave
	if(waveExists(TimeXtxtWv))
		ModifyGraph/W=$FullGraphNm userticks(bottom)={TimeXWv,TimeXtxtWv}
	endif

	// check the list of existing axes; make all left axes log
	for(idex = 0; idex < ItemsInList(AxList); idex += 1)
		axisName = stringFromList(idex, AxList)
		if ( !stringmatch(axisName, "bottom") )
			SetAxis/W=$FullGraphNm/A/E=1 $axisName
		endif
	endfor		
	
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif
		
End



///////////////////////////////////////////////////////////////////////////////////////
// fBoxPlot
///////////////////////////////////////////////////////////////////////////////////////
// renamed from fBoxPlot_graphAxNm
Function gen_fBoxPlot_graphAxNm(median, boxTop, boxBottom, whiskerTop, whiskerBottom, XWave, BoxWidth, ColoredBoxes, OUTY, OUTX, FillRed, FillGreen, FillBlue, DisplayLocation, AxNm)
	wave/Z median, boxTop, boxBottom, whiskerTop, whiskerBottom
	wave/Z XWave		// if null wave, use X scaling, which will be point scaling.
	variable BoxWidth	// width of the box part of the display, in X units of the X wave.
	variable ColoredBoxes // setting this to non-zero puts a colored rectangle behind each box. You can color them individually if you want.
	wave/Z OUTY, OUTX
	variable FillRed, FillGreen, FillBlue
	string DisplayLocation, AxNm
	
	string WName, WCompleteName, medianCompleteName, medianName
	string GraphNote=""
	
	GraphNote += "BOXWIDTH="+num2str(BoxWidth)+";"
	if (ColoredBoxes)
		GraphNote += "COLOREDBOXES=1;"
	else
		GraphNote += "COLOREDBOXES=0;"
	endif
	GraphNote += "FILLRED="+num2istr(FillRed)+";"
	GraphNote += "FILLGREEN="+num2istr(FillGreen)+";"
	GraphNote += "FILLBLUE="+num2istr(FillBlue)+";"
	
	if (!WaveExists(median))
		DoAlert 0, "The median wave does not exists"
		return -1
	endif
	if (!WaveExists(boxTop))
		DoAlert 0,  "The wave giving the tops of the boxes does not exist"
		return -1
	endif
	if (!WaveExists(boxBottom))
		DoAlert 0,  "The wave giving the bottoms of the boxes does not exist"
		return -1
	endif
	
	medianCompleteName = GetWavesDataFolder(median, 2)
	medianName = NameOfWave(median)
	variable nWavePnts=numpnts(median)
	string boxTopCompleteName = GetWavesDataFolder(boxTop, 2)
	string boxBottomCompleteName = GetWavesDataFolder(boxBottom, 2)
	
	GraphNote += "MEDIANwave="+medianCompleteName+";"
	GraphNote += "BOXTOPwave="+boxTopCompleteName+";"
	GraphNote += "BOXBOTTOMwave="+boxBottomCompleteName+";"
	
	if (!WaveExists(boxTop))
		DoAlert 0,  "The wave specifying the tops of the boxes does not exist"
		return -1
	endif
	if (numpnts(boxTop) != nWavePnts)
		DoAlert 0,  "The wave "+NameOfWave(boxTop)+" does not have the same number of points as "+NameOfWave(median)
		return -1
	endif
		
	if (!WaveExists(boxBottom))
		DoAlert 0,  "The wave specifying the bottoms of the boxes does not exist"
		return -1
	endif
	if (numpnts(boxBottom) != nWavePnts)
		DoAlert 0,  "The wave "+NameOfWave(boxBottom)+" does not have the same number of points as "+NameOfWave(median)
		return -1
	endif
		
	// make a dependency formula for the error bar wave for the box tops
	WName = NameOfWave(boxTop)
	WCompleteName = GetWavesDataFolder(boxTop,2)
	Duplicate/O boxTop, $(WName+"EB")
	Wave boxTopEB = $(WName+"EB")
	SetFormula boxTopEB, WCompleteName+"-"+medianCompleteName
	
	GraphNote += "BOXTOPEBwave="+GetWavesDataFolder(boxTopEB,2)+";"
	
	// make a dependency formula for the error bar wave for the box bottoms
	WName = NameOfWave(boxBottom)
	WCompleteName = GetWavesDataFolder(boxBottom,2)
	Duplicate/O boxBottom, $(WName+"EB")
	Wave boxBottomEB = $(WName+"EB")
	SetFormula boxBottomEB, medianCompleteName+"-"+WCompleteName
	
	GraphNote += "BOXBOTTOMEBwave="+GetWavesDataFolder(boxBottomEB,2)+";"
	
	if (WaveExists(whiskerTop))
		// make a dependency formula for the error bar wave for the whisker tops
		WName = NameOfWave(whiskerTop)
		WCompleteName = GetWavesDataFolder(whiskerTop,2)
		Duplicate/O whiskerTop, $(WName+"EB")
		Wave whiskerTopEB = $(WName+"EB")
		SetFormula whiskerTopEB, WCompleteName+"-"+boxTopCompleteName
	
		GraphNote += "WHISKERTOPEBwave="+GetWavesDataFolder(whiskerTopEB,2)+";"
	else
		GraphNote += "WHISKERTOPEBwave=_NONE_;"
	endif
	
	if (WaveExists(whiskerBottom))
		// make a dependency formula for the error bar wave for the whisker bottoms
		WName = NameOfWave(whiskerBottom)
		WCompleteName = GetWavesDataFolder(whiskerBottom,2)
		Duplicate/O whiskerBottom, $(WName+"EB")
		Wave whiskerBottomEB = $(WName+"EB")
		SetFormula whiskerBottomEB, boxBottomCompleteName+"-"+WCompleteName
	
		GraphNote += "WHISKERBOTTOMEBwave="+GetWavesDataFolder(whiskerBottomEB,2)+";"
	else
		GraphNote += "WHISKERBOTTOMEBwave=_NONE_;"
	endif
	
	// now make the graph
	if (WaveExists(XWave))
//		AppendToGraph/W=$DisplayLocation/L=$AxNm median vs XWave		// changed in 1.3J
		AppendToGraph/W=$DisplayLocation/L=$AxNm median vs XWave
		AppendToGraph/W=$DisplayLocation/L=$AxNm boxTop vs XWave
		AppendToGraph/W=$DisplayLocation/L=$AxNm boxBottom vs XWave
		GraphNote += "Xwave="+GetWavesDatafolder(XWave,2)+";"
	else
		AppendToGraph/W=$DisplayLocation/L=$AxNm median, median, boxTop, boxBottom
		GraphNote += "Xwave=_NONE_;"
	endif

	GraphNote += "BOXTRACE="+medianName+"#1;"
	GraphNote += "MEDIANLINETRACE="+medianName+";"

	ModifyGraph/W=$DisplayLocation mode($NameofWave(boxTop)) = 2, mode($NameofWave(boxBottom)) = 2
//	ErrorBars/W=$DisplayLocation/L=0 $(medianName+"#1") BOX,const=(BoxWidth),wave=(boxTopEB,boxBottomEB)
//	ErrorBars/W=$DisplayLocation/T=0 $(medianName) X,const=(BoxWidth)		// change in 1.3J
	ErrorBars/W=$DisplayLocation/L=0 $(medianName) BOX,const=(BoxWidth),wave=(boxTopEB,boxBottomEB)
	ModifyGraph/W=$DisplayLocation mode($(medianName))=3, marker=9

	if (WaveExists(whiskerBottom))
		ErrorBars/W=$DisplayLocation/T=0 $(NameOfWave(boxBottom)) Y,wave=(,whiskerBottomEB)
		GraphNote += "WHISKERBOTTOMTRACE="+NameOfWave(boxBottom)+";"
	else
		GraphNote += "WHISKERBOTTOMTRACE=_NONE_;"
	endif

	if (WaveExists(whiskerTop))
		ErrorBars/W=$DisplayLocation/T=0 $(NameOfWave(boxTop)) Y,wave=(whiskerTopEB,)
		GraphNote += "WHISKERTOPTRACE="+NameOfWave(boxTop)+";"
	else
		GraphNote += "WHISKERTOPTRACE=_NONE_;"
	endif

	if ( WaveExists(XWave) %& (WaveType(XWave) == 0) )
		ModifyGraph/W=$DisplayLocation toMode=-1
	endif

	if (WaveExists(OUTY) && WaveExists(OUTX))
		if (WaveExists(XWave))
			OUTX = XWave[OUTX[p]]
		endif
		if (WaveType(XWave) == 0)
			AppendToGraph/W=$DisplayLocation/L=$AxNm/T OUTY vs OUTX
		else
			AppendToGraph/W=$DisplayLocation/L=$AxNm OUTY vs OUTX
		endif
		ModifyGraph/W=$DisplayLocation mode($NameOfWave(OUTY))=3,marker($NameOfWave(OUTY))=8
		if (WaveType(XWave) == 0)
			SetAxis/W=$DisplayLocation top -(BoxWidth+.5), numpnts(XWave)-.5	// I have a bad feeling about this...
			ModifyGraph/W=$DisplayLocation noLabel(top)=2,axThick(top)=0
		endif
		GraphNote += "OUTLIERwaveY="+GetWavesDataFolder(OUTY, 2)+";"
		GraphNote += "OUTLIERwaveX="+GetWavesDataFolder(OUTX, 2)+";"
		GraphNote += "OUTLIERTRACE="+NameOfWave(OUTY)+";"
	else
		GraphNote += "OUTLIERwaveY=_NONE_;"
		GraphNote += "OUTLIERwaveX=_NONE_;"
		GraphNote += "OUTLIERTRACE=_NONE_;"
	endif

	SetWindow $DisplayLocation, note=GraphNote
//	DoUpdate  //imu2.05 commented out to try to speed panel update
	PMF_BoxPlotColorBoxes(DisplayLocation)

End



Function PMF_BoxPlotColorBoxes(GraphName)
	String GraphName
	
	if (strlen(GraphName) == 0)
		GraphName = WinName(0,1)
	endif
	GetWindow $GraphName,note
	String GraphNote = S_value
	
	Variable ColoredBoxes = NumberByKey("COLOREDBOXES", GraphNote, "=", ";")
	if (NumType(ColoredBoxes) != 0)
		return -1
	endif
	if (ColoredBoxes)
		// extract info from window note
		String medianWaveName = StringByKey("MEDIANWAVE", GraphNote, "=", ";")
		Wave/Z median=$medianWaveName
		if (!WaveExists(median))
			return -2
		endif
		String X_WaveName = StringByKey("XWAVE", GraphNote, "=", ";")
		Wave/Z XWave = $X_WaveName
		Variable BoxWidth = NumberByKey("BOXWIDTH", GraphNote, "=", ";")
		if (numtype(BoxWidth) != 0)
			return -3
		endif
		String BoxTopWave = StringByKey("BOXTOPWAVE", GraphNote, "=", ";")
		Wave/Z boxTop = $BoxTopWave
		if (!WaveExists(boxTop))
			return -4
		endif
		String BoxBottomWave = StringByKey("BOXBOTTOMWAVE", GraphNote, "=", ";")
		Wave/Z boxBottom = $BoxBottomWave
		if (!WaveExists(boxBottom))
			return -4
		endif
		Variable FillRed = NumberByKey("FILLRED", GraphNote, "=", ";")
		if (NumType(FillRed) != 0)
			return -1
		endif
		Variable FillGreen = NumberByKey("FILLGREEN", GraphNote, "=", ";")
		if (NumType(FillGreen) != 0)
			return -1
		endif
		Variable FillBlue = NumberByKey("FILLBLUE", GraphNote, "=", ";")
		if (NumType(FillBlue) != 0)
			return -1
		endif
		
		Variable NBoxes=numpnts(median)
		Variable i=0
		Variable left, right
		SetDrawLayer/W=$GraphName/K UserAxes
		do
			if ( (WaveExists(XWave) %& (WaveType(XWave) != 0)) )
				left = XWave[i]-BoxWidth
				right = XWave[i]+BoxWidth
			else
				Variable Offset = .5*WaveExists(XWave)
				left = i-BoxWidth+Offset
				right = 	i+BoxWidth+Offset
			endif
			SetDrawLayer/W=$GraphName UserAxes
			SetDrawEnv/W=$GraphName fillfgc=(FillRed, FillGreen, FillBlue),fillpat=1,xcoord=bottom, ycoord=left, linethick=0
			DrawPoly/W=$GraphName left, boxTop[i], 1, 1, {left, boxTop[i], right, boxTop[i], right, boxBottom[i], left, boxBottom[i]}
			i += 1
		while (i < NBoxes)
	else
		SetDrawLayer/W=$GraphName/K UserAxes
	endif
	
	return 0
end





Function pmf_button_pop_FactTser_Diurnal(ctrlName) : ButtonControl
	string ctrlName
	
	svar FactorTseries_Str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorTseries_Str
	string tempStr = FactorTseries_Str
	
	DFREF currdf = getdatafolderDFR()
	
	setdatafolder root:ACSM:PMF_Exported_Waves:pmf_plot_globals:
	string/g diurnaltype = "diurnal"
	
	setdatafolder currdf
	

	FactorTseries_Str = "diurnal"
	pmf_plot_TseriesDiurnalFactor("window")
	FactorTseries_Str = tempStr
	
	ShowInfo

End



Function pmf_button_pop_FactTser_Fract(ctrlName) : ButtonControl
	string ctrlName
	
	svar FactorTseries_Str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorTseries_Str
	string tempStr = FactorTseries_Str
	
		DFREF currdf = getdatafolderDFR()
	
	setdatafolder root:ACSM:PMF_Exported_Waves:pmf_plot_globals:
	string/g diurnaltype = "fract"
	
	setdatafolder currdf

	FactorTseries_Str = "fract"
	pmf_plot_FactorTseries("window")
	FactorTseries_Str = tempStr

	ShowInfo

End


Function pmf_button_pop_VarianceFract(ctrlName) : ButtonControl
string ctrlName
	
	svar variance_Str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Str
	string tempStr = variance_Str
	
//	DFREF currdf = getdatafolderDFR()
//	
//	setdatafolder root:ACSM:PMF_Exported_Waves:pmf_plot_globals:
//	string/g diurnaltype = "fract"
//	
//	setdatafolder currdf

	variance_Str = "fract"
	pmf_plot_variance("window")
	variance_Str = tempStr

	ShowInfo

End


// code to make variance plot on panel or as popped plot
Function pmf_plot_variance(graphDest)	
	string graphDest
	
	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	wave/T var_Labels = $pmfDFnm + "var_Labels"
	wave/T fpeak_map_textWv =  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeak_map_textWv

	wave variance_Fract_Residual = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Fract_Residual		//1.3J
	wave variance_Fpeak_Residual = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Fpeak_Residual

	svar Variance_str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Variance_str	
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal	

	string ThisWvNm, FullGraphNm, graphNm, winTitleStr
	variable idex, tempSumVar
	
	make/o/n=(numpnts(variance_Fpeak_Residual)) tempSumWave
	
	// setup window
	graphNm = "Variance"

	if(stringmatch(graphDest, "panel"))
		// kill old window
		FullGraphNm = "pmf_plot_panel#"+graphNm
		// clear the old graph, if it exists
 		gen_kill_subwindow("pmf_plot_panel", graphNm)		
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(615,30,836,116)/K=1
	else	// window
		FullGraphNm = "pop_"+graphNm
		winTitleStr = "Factor Variance" 
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm/K=1 as  winTitleStr  // make the new one
	endif
	
	if (stringmatch(variance_str,"fract") )
		appendtograph/W=$FullGraphNm variance_Fract_Residual vs var_Labels		//2.0 RC1
		tempSumVar=0
		for (idex =0; idex <Current_pVal; idex += 1)
//		for (idex = Current_pVal-1; idex >=0; idex -= 1)
			ThisWvNm="variance_Fract_Factor" + num2istr(idex + 1)
			wave variance_Fract_FactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:"+ThisWvNm			
			appendtograph/W=$FullGraphNm variance_Fract_FactorX vs var_Labels
			pmf_colorize_1trace(FullGraphNm, idex,ThisWvNm)
			tempSumVar+=	variance_Fract_FactorX[3]	
		endfor
		variance_Fract_Residual = {0,0,0,1-tempSumVar}
//		appendtograph/W=$FullGraphNm variance_Fract_Residual vs var_Labels
		ModifyGraph rgb(variance_Fract_Residual)=(0,0,0), hbFill(variance_Fract_Residual)=2
		ModifyGraph/W=$FullGraphNm tomode= 3
	else		// fpeak type
		appendtograph/W=$FullGraphNm variance_Fpeak_Residual vs fpeak_map_textWv   //2.0 RC1
		tempSumWave=0
		for (idex = 0; idex < Current_pVal; idex += 1)
//		for (idex = Current_pVal-1; idex >=0; idex -= 1)
			ThisWvNm="variance_Fpeak_Factor" + num2istr(idex + 1)
			wave variance_Fpeak_FactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:"+ThisWvNm			
			appendtograph/W=$FullGraphNm variance_Fpeak_FactorX vs fpeak_map_textWv
			pmf_colorize_1trace(FullGraphNm, idex,ThisWvNm)
			tempSumWave+=variance_Fpeak_FactorX
		endfor
		variance_Fpeak_Residual = 1- tempSumWave
//		appendtograph/W=$FullGraphNm variance_Fpeak_Residual vs fpeak_map_textWv
		ModifyGraph rgb(variance_Fpeak_Residual)=(0,0,0), hbFill(variance_Fpeak_Residual)=2
		ModifyGraph/W=$FullGraphNm tomode= 3
	endif
	
	// autoscale to 0
	SetAxis/W=$FullGraphNm left 1,0
	// move bottom axis down a little
	ModifyGraph/W=$FullGraphNm axOffset(bottom) = -1.8

	// legend at side
	Legend/W=$FullGraphNm
	Legend/W=$FullGraphNm/C/N=text0/J/X=-78.00/Y=16.74
	
	Killwaves/z tempSumWave
		
End


//Button that Preps the PET variables 
Function PET_Prep_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
		
			//Have a DoAlert with a message
			DoAlert/T="PET PMF Data Folder Preperation" 2, "This button will initalize the PET PMF Data folder prep. This will create the folders, variables and strings needed for my adaptation of the PET PMF toolkit. To ensure the code works well ensure that all of the waves that are saved from PET PMF toolkit EXACTLY as they are found there." 
			If(V_Flag == 1) //Yes Clicked
				//Do Nothing
			elseif(V_Flag == 2)//No Clicked
				Abort "User Cancellation. Aborting the Procedure."
			Endif
		
		
		
		
		
			//Get a list of DFs
			setdatafolder root: 
			DFREF Base_DF = getdatafolderDFR()
			variable nfolders = CountobjectsDFR(Base_DF,4)
			string DF_List = "" 
			variable i 
			for(i=0;i<nfolders;i++)
				DF_List += getindexedObjNameDFR(Base_DF, 4,i)
				DF_List +=";"
			Endfor
			
			//Get the ACSM Folder (if it does not exist then create it)
			string DF_ACSM = ""
			variable index_ACSM = strsearch(DF_List, "ACSM",2)
			if(index_ACSM == -1)	//if the ACSM folder does not exist
				newdatafolder/S root:ACSM
				DFREF ACSM_DF = getdatafolderDFR()
				// make all datafolders
				newdatafolder/S PMF_Exported_Waves
				DFREF ExportedWaves_DF = getdatafolderDFR()
				newdatafolder pmf_calc_globals
				newdatafolder pmf_prep_globals
				newdatafolder diurnals
				newdatafolder EvaluationPanelGlobals
				newdatafolder/S Packages
				newdatafolder/S SNRAnalysis
				newdatafolder SNRAnal
				
				setdatafolder ExportedWaves_DF
				DFREF PMF_DF = getdatafolderDFR()
				newdatafolder/S pmf_plot_globals
				DFREF PET_plotglobals_DF = getdatafolderDFR()
				newdatafolder/S diurnals
				DFREF PER_plotglobals_DF = getdatafolderDFR()
			elseif(numtype(index_ACSM) == 0) //If it does exist
				setdatafolder root:ACSM:
				DFREF ACSM_DF = getdatafolderDFR()
				// make all datafolders
				newdatafolder/S PMF_Exported_Waves
				DFREF PMF_DF = getdatafolderDFR()
				newdatafolder/S pmf_plot_globals
				DFREF PET_plotglobals_DF = getdatafolderDFR()
				newdatafolder/S diurnals
				DFREF PER_plotglobals_DF = getdatafolderDFR()
			endif
			
			setdatafolder ExportedWaves_DF
			variable/G CalcedSeedOrFpeak
			variable/G ModelError
			variable/G pmf_ini_info_C1
			variable/G pmf_ini_info_C2
			variable/G pmf_ini_info_C3
			variable/G pmf_ini_info_EM
			variable/G pmf_ini_info_InitiallySkipped
			variable/G pmf_ini_info_OutlierDistance
			variable/G pmf_ini_info_robust
			variable/G pmf_ini_info_Seed
			string/G s_Path
			string/G S_waveNames
			string/G S_fileName
			
			setdatafolder EvaluationPanelGlobals
			string/G ColDescrWvNmStr
			string/G ColDesTxtWvNmStr
			string/G DataMxNmStr
			string/G RowDescrWvNmStr
			string/G StdDevMxNmStr
			
			setdatafolder ExportedWaves_DF
			setdatafolder pmf_calc_globals
			variable/G consecStepsLevel1
			variable/G consecStepsLevel2
			variable/G consecStepsLevel3
			variable/G convPropQexp
			variable/G defaultFpeak
			variable/G defaultSeed
			variable/G deltaQlevel1
			variable/G deltaQlevel2
			variable/G deltaQlevel3
			variable/G exploreOrBootstrap
			variable/G fpeak_delta
			variable/G fpeak_max
			variable/G fpeak_method
			variable/G fpeak_min
			variable/G maxCumStepsLevel1
			variable/G maxCumStepsLevel2
			variable/G maxCumStepsLevel3
			variable/G numIterations
			variable/G pmfModelError
			variable/G p_max
			variable/G p_min
			variable/G runPMFinBackground
			variable/G saveExpAfterPMF
			variable/G saveLogs
			variable/G SeedOrFpeak
			variable/G WhiskerDiurnal
			variable/G whiskerScaResid
			string/G BatchFilePathStr
			string/G ColDescrWvNm
			string/G ColDesTxtWvNm
			string/G DataMxNm
			string/G fpeak_methodStr
			string/G pmfDFNm
			string/G PMFexefilename
			string/G PMFexefilenameOther
			string/G PMFexeList
			string/G pmf_exePathStr
			string/G pmf_exePathStrFormatted
			string/G RowDescrWvNm
			string/G StdDevMxNm
			
			setdatafolder ExportedWaves_DF
			setdatafolder pmf_prep_globals
			variable/G badSNR
			variable/G dnwtMagBad
			variable/G dnwtMagWeak
			variable/G orgMDL
			variable/G pmfModelError
			variable/G pntsToSmooth
			variable/G removeIsotpesHR
			variable/G spkThreshold
			variable/G sotredWvNms
			variable/G TDCmz
			variable/G UseTDCmz
			variable/G weakSNR
			string/G ColDescrWvNm = "MSS_base"
			string/G ColDescrWvNm_last = "noNaNs_MSS_base" 
			string/G ColDescrWvNm_st4 = "noNaNs_MSS_base_st4"
			string/G ColDesTxtWvNm = "mz_text"
			String/G ColDesTxtWvNm_last = "noNaNs_mz_text"
			String/G ColDesTxtWvNm_st4 = "noNaNs_mz_text_st4"
			String/G DataMxNm = "Org_data_2D"
			String/G DataMxNm_last = "noNaNs_Org_data_2D_RemSpk"
			String/G ErrMxNm_Dnwt = "noNaNs_Org_err_2D_minPropWk"
			String/G ErrMxNm_Dnwt44 = "noNaNs_Org_err_2D_minPropWk44"
			String/G ErrMxNm_last = "noNaNs_Org_err_2D_minPropWk44" 
			String/G ErrMxNm_MinErr = "Org_err_2D_min" 
			String/G ErrMxNm_PropSmth = "Org_err_2D_minProp"
			String/G ErrMxNm_RemNaNs = "noNaNs_Org_err_2D_minProp"
			String/G ErrMxNm_RemSpike = "Org_data_2D_RemSpk"
			String/G mz44List
			String/G mz44List_dnwted = "44;28;18;17;16;"
			String/G OneIonWvNm = "MinErr"
			String/G pmfDFNm = "root:ACSM:PMF_Exported_Waves:"
			String/G preppedPmfDFNm 
			String/G RowDescrWvNm = "t_start"
			String/G RowDescrWvNm_last = "noNaNs_t_start"
			String/G SNRwvNm = "noNaNs_Org_data_2D_RemSpk_SNRwv" 
			String/G StdDevMxNm = "Org_err_2D"
			
			
			setdatafolder PET_plotglobals_DF
			
			//Create all variables and strings needed
			
			//Others
			variable/G SpeciesNmCheckDisable =1
			Variable/G rotateTextLabels = 0
			variable/G minY_Log_Profiles = nan
			variable/G ElemCalsDone = 0
			variable/G ColorFamilyUMR = 0
			variable/G CurrentDeltaQ_fpeak = 0 
			variable/G CurrentDeltaQ_p = 0 
			variable/G CurrentMaxQ_fpeak = 0 
			variable/G CurrentMaxQ_p = 0 
			variable/G Current_fpeakVal = 0 
			variable/G Current_pVal = 0 
			variable/G dataTypeHR = 0 
			variable/G displayFactorSpaceOrFPeak = 1
			
			string/g StdDevMxNm = "noNaNs_Org_err_2D_minPropWk44"
			string/g speciesNumStr 
			string/g ScaResidAllSpecies_Str
			string/g RowDescrWvNm = "t_start"
			string/g pmfDFnm = "root:ACSM:PMF_Exported_Waves:pmf_plot_globals:"
			string/g ColDescrWvNm = "noNaNs_MSS_base"
			string/g ColDesTxtWvNm = "noNaNs_mz_text"
			string/g DataMxNm = "noNaNs_Org_data_2D_RemSpk"
			string/g diurnalType 
			
			wave p_map_textWv
			variable npnts = dimsize(p_map_textWv,0)
			make/o/d/n=(10) p_map = p+1 //Assuming 10 factors solution
			wave fpeak_map_textWv
			npnts = dimsize(fpeak_map_textWv,0)
			make/o/d/n=(11) fpeak_map = (p*0.2)-1
			make/o/d/n=(4)/t var_Labels
			var_Labels[0]="Var_Profiles"
			var_Labels[1]="Var_Tseries"
			var_Labels[2]="Var_Matrix"
			var_Labels[3]="Fract_Mass"
			wave/T var_Labels
			
			
			
						// we want to initialize these values (but maybe not all?) every time
			variable/G fpeakdex = 0		// for slider positions...
			variable/G pdex = 0 			// for slider positions

			variable/G plotPCheck = 1				// =1 -> current;  =2 -> all;  =3 -> selected
			variable/G plotFpeakCheck=1 			// =1 -> current;  =2 -> all;  =3 -> selected
			variable/G factNum=0					// current factor, changed from default = 1 to default = 0
			variable/G speciesNumIndex=0 // species displayed, start counting from 0  

			//	variables for checkboxes on panel	
			variable/G FactorProfile_LogCheck=0				// whether left axes are log in #CurentProfiles
			variable/G FactorProfile_MaxIs100Check=0
			variable/G Qvs_LogCheck=0			// whether left axis is log in #QvsP 
			variable/G Qvs_maxRotMxCheck =0	// whether to display MaxRotMx traces
			variable/G Qvs_minQ = 1	// whether to display the minimum Q
			variable/G ScaResidOneSpecies_GaussCheck=0		// append gauss for #ScaResidOneSpecies
			variable/G ScaResidOneSpecies_LogCheck=0		// left axis log for #ScaResidOneSpecies
			variable/G Reconst_ShowStackedCheck=0			// whether left axes are log in #CurentProfiles
			variable/G ScaResidAllSpecies_MinMaxCheck = 90

			// strings to hold the choice for radio buttons
			string/G ScaResidAllSpecies_Str = "boxplot"	// or "hist"
			string/G Variance_Str = "fract"				//  or "fpeak", string to keep track of whether Variance plot is fact or fpeak
			string/G FactorTseries_Str= "tseries"		//  or "diurnal", string to keep track of whether FactorTseries plot is tseries or diurnal plot
			string/G ResidualRatios_Str = "tseries"		//  or "profiles" or "diurnal", string to keep track of whether ResidualRatios plot is tseries or profiles		
			string/G RvsR_Str = "current"			// current, allfpeak, or pless1

			// variables for BoxPlots
			variable/G boxStartBins = -10
			variable/G boxEndBins  =  10
			variable/G boxBinWidth  = 0.5
			variable/G boxNumBins= (BoxEndBins-BoxStartBins)/BoxBinWidth			
			variable/G boxWidth = 0.5			// results in top 25% and bottom 25% for box edges.
			variable/G WhiskerWidth = 1		// results in absolute min and max
			
			variable/G fullHeight = 1					// scaling factor for Profiles Plots

			// display variables for place near Q plots
			variable/G root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentMaxQ_p
			variable/G root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentDeltaQ_p
			variable/G root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentMaxQ_fpeak
			variable/G root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentDeltaQ_fpeak

			variable/g root:ACSM:PMF_Exported_Waves:pmf_plot_globals:displayFactorSpaceOrFPeak = 0		//1.3J  0 means vary fpeak or seed.  1 mean vary factor space

			string/g root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RvsR_Str ="pearson"		//1.04A 

			string/g root:ACSM:PMF_Exported_Waves:pmf_plot_globals:speciesNumStr=""		//1.3J
			svar speciesNumStr = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:speciesNumStr
			
			
			//do the same for diurnals
			setdatafolder PER_plotglobals_DF
			string/g diurnalTypeList = "diurnal;month;dayOfWeek;WeekDayEnd;"
			
			setdatafolder ACSM_DF
			
		case 2:
			break
		endswitch
end



Function PET_nfactorButt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			variable v_Flag
			if(V_flag==1)
			elseif(V_Flag==2)
				abort "Aborting procedure."
			endif
			variable nfactors
			prompt nfactors, "What is the number of solutions desired."
			doprompt "Please enter the following information.", nfactors
			setdatafolder root:ACSM:PMF_Exported_Waves:pmf_plot_globals:
			nvar Current_Pvalvar =  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
			//nvar nsolutionsvar = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:factNum
			Current_Pvalvar = nfactors
			//nsolutionsvar = nfactors
		case 2:
			break
		endswitch
end




/////////////////////////////////////////////////////////////////////////////////////
// BIG PANEL SLIDERS AND SELECTIONS CONTROLS
////////////////////////////////////////////////////////////////////////////////////
// If p changes, all these functions must be called to update the plots
Function pmf_slider_p(ctrlName,sliderValue,event) : SliderControl
	string ctrlName  
	variable sliderValue  
	variable event  // bit field: bit 0: value set, 1: mouse down, 2: mouse up, 3: mouse moved
	
	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	nvar Current_pVal =  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
	nvar pdex=  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar factNum=  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:factNum
	wave p_map =$pmfDFnm+"p_map"
		
	if(  !(event %& 0x4))
		pdex = sliderValue	
		Current_pVal = p_map[pdex]
		return 0
	else //(event %& 0x4)		// mouse up
		pdex = sliderValue	
		Current_pVal = p_map[pdex]
		factNum = min (factNum, Current_pVal)		//1.3K
		pmf_check_plotp("CurrPCheckBox",1)
 		//pmf_update_pPlots()	//imu2.05 already updated in pmf_check_plotp
 		// added by DTS to allow the scatter and eval panels to both be affected by a slider switch
 		DoWindow/F scat_PMF_scatterPanel
 		if (V_flag==1)		// window exists
			nvar pdex_scat = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex_scat
 			pdex_scat = pdex
 			Slider scat_p_slider value = pdex //imu2.04 was scat_slider_p; think this created extra slider
 			scat_update_Plots()		
 			DoWindow/F pmf_plot_panel
		endif
	endif

End


// radio button checkbox control can update up to 6 (3 fpeak, 3p) radio control buttons in parameter control section 
Function pmf_check_plotp(ctrlName,checked) : CheckBoxControl
	string ctrlName
	variable checked
	
	nvar PlotfpeakCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:PlotfpeakCheck
	nvar fpeakdex= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	wave fpeakPlot_map = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakPlot_map
//	wave fpeakSelect_map = root:pmf_plot_globals:fpeakSelect_map

	nvar PlotpCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:PlotpCheck
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pDex	
	wave pPlot_map = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pPlot_map
	wave pSelect_map  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pSelect_map
			
	nvar displayFactorSpaceOrFPeak = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:displayFactorSpaceOrFPeak

	nvar factNum = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:factNum

	if (stringmatch(ctrlName, "SelectpCheckBox"))
		wavestats/q/m=1 pSelect_map
		if ((!v_max >0))
			abort "No p values were selected via in the p table - aborting from pmf_check_plotp"
		endif
	endif

	ctrlName = lowerstr(ctrlName)
	strswitch (ctrlName)
	case "currpcheckbox":
		PlotpCheck = 1	// current p only
		pplot_map = 0	// "clear" old wave
		pplot_map[pdex] = 1 // set only this p to plot
		displayFactorSpaceOrFPeak = 1		// 0 means vary fpeak
		break
	case "allpcheckbox":
		PlotpCheck = 2
		PlotfpeakCheck=1
		fpeakPlot_map=0; fpeakPlot_map[fpeakdex]=1
		pplot_map = 1 	// set all fpeaks to plot
		displayFactorSpaceOrFPeak = 1		// 0 means vary fpeak
		break
	case "selectpcheckbox":
		PlotpCheck = 3
		PlotfpeakCheck=1
		fpeakplot_map=0; fpeakplot_map[fpeakdex]=1
		pPlot_map = selectnumber(pSelect_map[p]==1, 0, 1)
		displayFactorSpaceOrFPeak = 1		// 0 means vary fpeak
		break
	default :
		displayFactorSpaceOrFPeak = 0		// 0 means vary fpeak
	endswitch
	
	//meh these arn't included with my adaptation of the code. 

//	CheckBox CurrpCheckBox,value= PlotpCheck==1
//	CheckBox AllpCheckBox,value= PlotpCheck==2
//	CheckBox SelectpCheckBox, value = PlotpCheck==3
//	CheckBox CurrFpeakCheckBox,value= PlotFpeakCheck==1
//	CheckBox AllFpeakCheckBox,value= PlotFpeakCheck==2
//	CheckBox SelectFpeakCheckBox, value = PlotFpeakCheck==3

	if (PlotpCheck!=1)		// many fpeaks, remove the stacked factors option.
		Checkbox ShowStackedFactors value= 0
	endif

	if (PlotpCheck!=1 &&factNum<1)
		factNum=1
	endif

	// update graphs
	pmf_update_fpeakOrFactorSpace()

End



///////////////////////////////////////////////////////////////////////////////////////
// Updates the scatter, R_category and time series or MS plots for each factor
Function scat_update_Plots()

	svar ExtData_ScatterPanelType = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ExtData_ScatterPanelType
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm	
	wave p_map = $pmfDFNm+"p_map"
	variable idex, nump, maxp

	nump = numpnts(p_map)
	maxp = p_map[nump-1]

	for( idex = 0; idex < maxp; idex += 1)
		scat_plot_ScatterFactor("scatterPanel",idex)
		scat_plot_R_category("scatterPanel",idex, ExtData_ScatterPanelType)
		if(stringmatch(ExtData_ScatterPanelType, "ts"))
			scat_make_RForCurrFactorWvs("tseries")
			scat_plot_Tseries("scatterPanel",idex+1)
			scat_plot_ExtDataFactors("scatterPanel",idex+1)
		else // ms
			scat_make_RForCurrFactorWvs("profiles")
			scat_plot_Profiles("scatterPanel",idex+1)
			scat_plot_ExtDataFactors("scatterPanel",idex+1)
		endif		
	endfor

End


//  do all calcs and replot everything when a radio button for multiple solution spaces is pressed
Function pmf_update_fpeakOrFactorSpace()
	
	nvar PlotfpeakCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:PlotfpeakCheck		// indicates we are plotting multiple solution spaces
	nvar PlotpCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:PlotpCheck		// indicates we are plotting multiple solution spaces

	pmf_calc_ReconstResidMSTSMxs()			// updates the fpeak or factor space '3rd dimension'
	pmf_calc_diurnMx3d()

	pmf_calc_TSeriesFactorX()
	pmf_calc_TSeriesFractFactorX() //imu2.04
	pmf_calc_TseriesDiurnalFactorX()
	pmf_calc_profilesFactorX()
	pmf_calc_SpeciesFactorX()
	pmf_calc_ReconSpeciesFpeaks()  // updates QcontrSpeciesFpeaks

	pmf_calc_scaResidAllSpecies()
	pmf_calc_scaResidOneSpecies()
	pmf_calc_residualRatios()  
	//pmf_calc_TseriesDiurnalFactorX()		//imu2.05 no longer needed twice; all diurnals calc after running PMF   //2.00A, have to do this twice, once after the resid ratios have been calced
	
	pmf_calc_Qvs()  
	pmf_calc_RvsR()
 	pmf_calc_RotMx2d() 
	pmf_calc_Variance()	
	
	nvar/z dataTypeHR = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:dataTypeHR	
	if (NVar_exists(dataTypeHR) && dataTypeHR>=1)
		pmf_calcFamilyColoredProfiles()		//2.08
	endif
	
	DoWindow/F pmf_plot_panel
	if (V_flag==1)		// window exists
	
		pmf_plot_variance("panel")  //imu2.05
		//imu2.05 RotMx updates automatically, don't need to replot
		pmf_plot_Qvsfpeakorseed("panel") 
		pmf_plot_Qvsp("panel")

		pmf_plot_FactorTseries("panel")
		pmf_plot_factorProfile("panel")  
		pmf_plot_reconstOneSpecies("panel")
		pmf_plot_reconstTotal("panel")
		pmf_plotck_Reconst_showStacked("panel", "ReconstTotal")
		pmf_plotck_Reconst_showStacked("panel", "ReconstSpecies")

		pmf_plot_ScaResidAllSpecies("panel")		//2.0 RC3
		//imu2.05 ScaResidOneSpecies updates automatically, doesn't need to replot
		pmf_plot_residualRatios("panel")
	
		pmf_plot_RvsR("panel")  //imu2.05

		if (NVar_exists(dataTypeHR) && dataTypeHR>=1)
			pmf_plot_ColorFamily("panel")		//2.08
			if(dataTypeHR==1)  //3.05E
				pmf_plot_ElemRatio("panel")	//2.08
			endif
		endif
		
		if (PlotfpeakCheck==1 && PlotpCheck==1)
			pmf_plot_convergence()
		endif
	
	endif
End

///////////////////////////////////////////////////////////////////////////////////////
Function scat_plot_ScatterFactor(graphDest,FactorDex)
	string graphDest
	variable FactorDex
	
	// get Wvs to append
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar ExtData_ScatterPanelType = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ExtData_ScatterPanelType
	svar ThisExtWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:$"ExtData_Factor" + num2istr(FactorDex + 1) + "vsExtFactorNm"

	string ThisWvFullPath, graphNm, winTitleStr, FullGraphNm, CurrentFactorNm
	variable idex, ThisFactorTop,ThisFactorLeft
	
	graphNm = "Factor" + num2istr(FactorDex +1) +"Scatter"
	if(stringmatch(graphDest, "Scatterpanel"))
		FullGraphNm = "scat_pmf_Scatterpanel#"+graphNm
 		gen_kill_subwindow("scat_pmf_Scatterpanel", graphNm)
 		
		// and make the new one
		ThisFactorTop = scat_ScatterPanel_TopAnchor(FactorDex+1)
		ThisFactorLeft = scat_ScatterPanel_LeftAnchor(FactorDex+1)
		
		display/HOST=scat_pmf_ScatterPanel/N=$graphNm/W=(ThisFactorLeft+258,ThisFactorTop+20,ThisFactorLeft+416,ThisFactorTop+153)/K=1
	else	// window
		FullGraphNm = "pop_"+graphNm
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		
		display/N=$FullGraphNm/K=1 as FullGraphNm  // make the new one
	endif
	
	// If ThisExtWvNm is null, hasn't been selected before; don't plot
	if(stringmatch(ThisExtWvNm, ""))
		return(0)
	endif
		
	if(stringmatch(ExtData_ScatterPanelType, "ts"))
		CurrentFactorNm = "TseriesFactor" + num2istr(FactorDex + 1)
		wave/z CurrentFactorWv = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:" + CurrentFactorNm
		
		svar rowDescrWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rowDescrWvNm
		wave RowDescrWv = $pmfDFnm + rowDescrWvNm
		svar FactorDFnm = $pmfDFnm + "ExtData_TseriesDFnm"
		wave ThisExtWv = $FactorDFNm + "NoNaNs:" + ThisExtWvNm
	
		appendtograph/W=$FullGraphNm CurrentFactorWv vs ThisExtWv
		ModifyGraph/W=$FullGraphNm mode=3,msize=1, zColor($CurrentFactorNm)={rowDescrWv,*,*,Rainbow}

	else // ms
		CurrentFactorNm = "ProfileFactor" + num2istr(FactorDex + 1)
		wave/z CurrentFactorWv = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:" + CurrentFactorNm
		
		wave colDescrTxtWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:colDescrTxtWv 
		svar FactorDFnm = $pmfDFnm + "ExtData_MassSpecDFnm"
		wave ThisExtWv = $ FactorDFNm + "NoNaNs:" + ThisExtWvNm
	
		appendtograph/W=$FullGraphNm CurrentFactorWv vs ThisExtWv
		ModifyGraph/W=$FullGraphNm mode=3, msize=3, textMarker($CurrentFactorNm)={colDescrTxtWv,"default",0,0,5,0.00,0.00}

	endif
			
	ModifyGraph/W=$FullGraphNm grid=2,gridRGB=(34816,34816,34816)
	Label/W=$FullGraphNm bottom ThisExtWvNm
	Label/W=$FullGraphNm left CurrentFactorNm

End



///////////////////////////////////////////////////////////////////////////////////////
// create a categroy plot of R for ThisFactor vs synFactors
// (not currently written for R for known factors)
// previously named pmf_plot_R_category
Function scat_plot_R_category(graphDest,FactorDex, TsOrMs)	
	string graphDest, TsOrMs
	variable FactorDex 
	
	// get waves and info for plot
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	nvar pdex_scat = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex_scat
	variable idex, ThisFactorTop, ThisFactorLeft
	string FullGraphNm, graphNm, winTitleStr, GrpWaveStr, leftAxisName, bottomAxisName
	
	setDataFolder root:ACSM:PMF_Exported_Waves:pmf_plot_globals:
	
	// set up display
	if(stringmatch(graphDest, "scatterPanel"))
		
		GraphNm = "Rcat_Factor"+num2istr(FactorDex+1)
		//imu  added line so that graph modifications will work
		FullGraphNm = "scat_pmf_scatterPanel#"+GraphNm
		 	
		// clear the old graph, if it exists
		gen_kill_subwindow("scat_pmf_ScatterPanel", graphNm)

		// Get reference points for graph
		ThisFactorTop = scat_ScatterPanel_TopAnchor(FactorDex+1)
		ThisFactorLeft = scat_ScatterPanel_LeftAnchor(FactorDex+1)

		// and make the new one
		display/HOST=scat_pmf_scatterPanel/N=$graphNm/W=(ThisFactorLeft+8,ThisFactorTop+45,ThisFactorLeft+250,ThisFactorTop+150)/K=1
		ModifyGraph margin(bottom)=14,margin(top)=1
		
	elseif(stringmatch(graphDest, "window"))
		graphNm="Rcat" + num2istr(FactorDex+1)
		FullGraphNm = "pop_"+graphNm
		winTitleStr = "R for Factor " + num2istr(FactorDex+1) 
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm/K=1 as  winTitleStr  // make the new one

		ThisFactorTop = 0		// not used but done to tidy things
		ThisFactorLeft = 0		// not used but done to tidy things
	elseif(stringmatch(graphDest[0,12], "SolutionSpace"))		// the monster, comprehensive plot
		graphNm=graphDest
		winTitleStr =graphDest
		FullGraphNm = graphDest
//		DoWindow/K $FullGraphNm  // kill graph if it already exists
//		display/N=$FullGraphNm/K=1 as  winTitleStr  // make the new one

		ThisFactorTop = 0	// not used but done to tidy things
		ThisFactorLeft = 0	// not used but done to tidy things
	else
		abort "pmf_ScatterPanel_RcatPlot must be called with 'scatterPanel' or 'window'"
	endif

	if(stringmatch(TsOrMs, "ts"))
		wave RcurrentFactor = $pmfDFNm + "RforCurrentFactorTseries" + num2istr(FactorDex+1)	
		svar FactorDFnm = $pmfDFnm + "ExtData_TseriesDFnm"
		wave/T xNmsWv = $FactorDFnm + "noNaNs:TseriesWvsNms"
		GrpWaveStr = FactorDFnm + "noNaNs:TseriesGroupWave"
	else // ms
		wave RcurrentFactor = $pmfDFNm + "RforCurrentFactorProfiles" + num2istr(FactorDex+1)
		svar FactorDFnm = $pmfDFnm + "ExtData_MassSpecDFnm"
		wave/T xNmsWv = $FactorDFnm + "noNaNs:FactorWvsNms"
		GrpWaveStr = FactorDFnm + "noNaNs:MassSpecGroupWave"
	endif
	
	wave/z GroupWave = $GrpWaveStr
	if (!waveExists(GroupWave) )
		make/o/n=(numpnts(xNmsWv)) $GrpWaveStr=0
		wave GroupWave = $GrpWaveStr
	endif

	leftAxisName = "left"+num2istr(FactorDex)
	bottomAxisName = "bottom"+num2istr(FactorDex)
	// append to graph
	appendToGraph/W=$FullGraphNm/L=$leftAxisName/B=$bottomAxisName RCurrentFactor vs xNmsWv
	ModifyGraph/W=$FullGraphNm  axOffset($bottomAxisName)=-1.9, grid($leftAxisName)=1
	SetAxis/W=$FullGraphNm $leftAxisName -0.5,1 
	SetAxis/W=$FullGraphNm/A $bottomAxisName
	ModifyGraph/W=$FullGraphNm tkLblRot($bottomAxisName)=90
	ModifyGraph/W=$FullGraphNm grid($leftAxisName)=2,gridRGB($leftAxisName)=(34816,34816,34816)
	ModifyGraph axisEnab($bottomAxisName)={0.1,1},freePos($bottomAxisName)={0,$leftAxisName},  freePos($leftAxisName)={0.1,kwFraction}

	Label $leftAxisName "Pearson R"
	ModifyGraph lblPos($leftAxisName)=50,lblLatPos=0

	// color bars like traces		// changed in 1.3K
	wavestats/q GroupWave
	if (V_min==0 && V_max ==0 && V_numNans==0)
		pmf_colorize_1trace(FullGraphNm, FactorDex, nameOfWave(RcurrentFactor))
	else
		ModifyGraph/W=$FullGraphNm zColor($nameOfWave(RcurrentFactor))={$GrpWaveStr,*,*,cindexRGB,0,root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ExtData_OAColorTable}
	endif
	
	//imu get waves for making bar color
//	ModifyGraph/W=$FullGraphNm rgb=(rgbRow[0],rgbRow[1],rgbRow[2])
	ModifyGraph /W=$FullGraphNm useNegPat=1,hBarNegFill=4		// 1.3J change
	ModifyGraph/W=$FullGraphNm zero=1

	// trying to fix an issue with drawing layers on the panel
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif

End




///////////////////////////////////////////////////////////////////////////////////////
// make RforCurentFactorN waves, dependent on current p and fpeak choices
// only needs to be called once when RcorrMxs are calculated
Function scat_make_RForCurrFactorWvs(ProfileOrTseries)
	string ProfileOrTseries

	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar MassSpecDFnm = $(pmfDFNm + "ExtData_MassSpecDFnm")
	svar TseriesDFnm = $(pmfDFNm + "ExtData_TseriesDFnm")
	wave p_map = $pmfDFNm + "p_map"
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	
	string ThisRFullPath, ThisRbase, SetFormulaStr
	variable idex, nump, maxp, numExternal

	nump = numpnts(p_map)
	maxp = p_map[nump-1]

	//imu changed "Factors" to "Profiles
	if(stringmatch(lowerStr(ProfileOrTseries), "profiles"))
		//imu changed "Factors" to "Profiles
		wave/z Rmx4d = $pmfDFNm + "RcorrMx4d_Profiles"
		ThisRbase = "RforCurrentFactorProfiles"
	else // tseries
		wave/z Rmx4d = $pmfDFNm + "RcorrMx4d_Tseries"
		ThisRbase = "RforCurrentFactorTseries"
	endif	
		
	if (!WaveExists(Rmx4d))
		return 0			 // assume that earlier print statement will alert user that no data exists.
	endif
		
	setDataFolder $pmfDFNm
	numExternal = dimsize(Rmx4d, 0)
	
	for (idex = 0; idex < maxp; idex += 1)
		ThisRFullPath = pmfDFNm + ThisRbase +num2istr(idex+1)
		make/o/N=(numExternal) $ThisRFullPath		// we want to make anew in case more external data were added
		wave CurrentRWv = $ThisRFullPath
		CurrentRWv= Rmx4d[p][idex][fpeakdex][pdex]
	endfor
	
End



///////////////////////////////////////////////////////////////////////////////////////
Function scat_plot_Tseries(graphDest, passedFactNum)
	string graphDest
	variable passedFactNum
	
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar RowDescrWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rowDescrWvNm
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex       = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar GlobalFactnum  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:factnum
	nvar FullHeight = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FullHeight

	wave Gmx4d = $pmfDFNm+"Gmx4d"	
	wave RowDescrWv = $pmfDFNm+rowDescrWvNm
	wave p_map = $pmfDFNm+"p_map"
	wave fpeak_map = $pmfDFNm+"fpeak_map"

	variable idex,jdex, fpeakCounter, factNum, LeftAnchor, TopAnchor
	string FullGraphNm, LegendStr, AxList, thisAxisNm
	string SubWindowNm, ChildList, thisChild, winNmStr, winTitleStr

	// setup window
	if(stringmatch(graphDest, "ScatterPanel"))

		factnum = passedFactNum
		
		// kill old window
		SubwindowNm = "FactorTseries" + num2istr(factnum)
		FullGraphNm = "scat_pmf_scatterPanel#"+SubWindowNm
		ChildList = ChildWindowList("scat_pmf_scatterPanel")
	
		// clear the old graph, if it exists
		for(idex = 0;idex < itemsinlist(childList); idex += 1)
			thisChild = stringfromlist(idex, childList)
			if(stringmatch(thisChild, SubwindowNm))
				killwindow $fullGraphNm
				break // don't need to look at the rest
			endif
		endfor
		
		LeftAnchor = scat_ScatterPanel_LeftAnchor(FactNum)
		TopAnchor = scat_ScatterPanel_TopAnchor(FactNum)
		
		// and make the new one
		display/HOST=scat_pmf_scatterPanel/N=$SubwindowNm/W=(LeftAnchor+9,TopAnchor+178,LeftAnchor+415,TopAnchor+294)/K=1
	else // pop from scatter panel
		factnum = passedFactNum
		winNmStr = "pop_Tseries" +num2istr(passedFactNum)
		winTitleStr = "Current Factor Tseries: factor" +num2istr(passedFactNum)  //3.07
		DoWindow/K $winNmStr  // kill graph if it already exists
		display/N=$winNmStr/K=1 as  winTitleStr  // make the new one
		SubwindowNm = winNmStr // for colorize_traces functions to find correct window
		FullGraphNm = SubwindowNm  // for log axes
	endif
	
	if (factnum <= p_map[pdex])						//  -1 correct for index starting at 0
		AppendToGraph/W=$FullGraphNm Gmx4d[][factnum-1][fpeakdex][pdex] vs rowDescrWv					
	//	if(factnum-2<0)
	//		pmf_colorize_1trace(FullGraphNm, 0, "Gmx4d")
	//	else
			pmf_colorize_1trace(FullGraphNm, factnum-1, "Gmx4d")
	//	endif
	endif
	
	// autoscale vertical axes from 0
	AxList = AxisList(FullGraphNm)
	for(idex = 0; idex < ItemsInList(AxList); idex += 1)
		thisAxisNm = StringFromList(idex, AxList)
		if ( !stringmatch(thisAxisNm, "bottom") )
			SetAxis/W=$FullGraphNm/A/E=1 $ThisAxisNm
		endif
		Label $thisAxisNm "AMS mass"
	endfor
	ModifyGraph/W=$FullGraphNm grid=2,gridRGB=(34816,34816,34816)
	

End



///////////////////////////////////////////
// appends External Data traces to Factor or Tseries plots on ScatterPanel and/or popped graphs
//	not currently available for main panel graphs
// passedFactNum is intended for use with the scatter panel.  If the code is later updated for
// use with the main panel, can send -99 as a dummy value
Function scat_plot_ExtDataFactors(graphdest, passedFactNum)
	string graphdest
	variable passedFactNum

	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm	
	svar FactorOrTseries = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ExtData_ScatterPanelType

	string thisSvarNm, thisSvarFullPath, thisWvFullPath, axisName
	string ThisWindowNm,WindowList, PanelWinNm, PopWinNm, ThisTraceNm, TraceList
	variable idex, jdex, factnum 
	
 	factnum = passedFactNum
 
	// get RcorrMx and xWv for factor or tseries
	if (stringmatch(FactorOrTseries, "ms"))
		svar XwvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColDescrWvNm
		wave Xwv = $(pmfDFnm+XwvNm)

		PanelWinNm = "scat_pmf_scatterPanel#FactorTseries" + num2istr(factnum)
		PopWinNm = "pop_factor" +  num2istr(factnum)
		
		// the ExternalFactor name   Factor1vsExtFactorNm
		svar ThisExtWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:$"ExtData_Factor" + num2istr(factnum) + "vsExtFactorNm"

		// If SynFactor is null, hasn't been selected before; don't plot
		if(stringmatch(ThisExtWvNm, ""))
			return(0)
		endif
			
		svar FactorDFnm = $pmfDFnm + "ExtData_MassSpecDFnm"
		wave/z ThisExtWv = $FactorDFNm + "NoNaNs:" + ThisExtWvNm

	elseif (stringmatch(FactorOrTseries, "ts"))
		svar XwvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RowDescrWvNm
		wave Xwv = $ pmfDFnm + XwvNm

		PanelWinNm = "scat_pmf_scatterPanel#factorTseries" + num2istr(factnum)
		PopWinNm = "pop_Tseries" + num2istr(factnum)

		// the ExternalFactor name   Factor1vsExtFactorNm
		svar ThisExtWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:$ "ExtData_Factor" + num2istr(factnum) + "vsExtFactorNm"

		// If SynFactor is null, hasn't been selected before; don't plot
		if(stringmatch(ThisExtWvNm, ""))
			return(0)
		endif
			
		svar FactorDFnm = $ pmfDFnm + "ExtData_TseriesDFnm"
		wave/z ThisExtWv = $ FactorDFNm + "NoNaNs:" + ThisExtWvNm

	else	
		abort "scat_plot_ExtDataFactorsTseries must be called with 'Factors' or 'Tseries'"
	endif

	// Make the window list
	if(stringmatch(graphDest, "ScatterPanel"))
		WindowList = PanelWinNm + ";"
	elseif(stringmatch(graphDest, "window"))
		WindowList= PopWinNm + ";"
	elseif(stringmatch(graphDest, "both"))
		WindowList = PanelWinNm + ";"
		// add popped window, if it exists
		if (! stringmatch(WinList(PopWinNm, ";", "WIN:1"), ""))
			WindowList += WinList(PopWinNm, ";", "WIN:1")
		endif
	else
		abort "scat_plot_ExtDataFactorsTseries must be called with 'ScatterPanel', 'window', or 'both''"
	endif	
		
	if (factnum > 0)  
		for(jdex = 0; jdex < itemsInList(WindowList); jdex += 1)
			ThisWindowNm = stringFromList(jdex, WindowList)			

			// remove old traces
			TraceList = tracenamelist(ThisWindowNm,";",1)
			for(idex = 0; idex < ItemsInList(TraceList); idex += 1)
				ThisTraceNm = stringFromList(idex,TraceList)
				if( ! stringmatch(ThisTraceNm, "*mx4d*"))
					RemoveFromGraph/W=$ThisWindowNm $ThisTraceNm
				endif
			endfor

			// append to graph on right axis
			axisname = "right_new_" + num2istr(idex) 

			AppendToGraph/W=$ThisWindowNm/R=$axisname ThisExtWv  vs Xwv
			ModifyGraph/W=$ThisWindowNm freePos($axisname)=0   //Place axes in correct location
			if (stringmatch(FactorOrTseries, "ts"))
				ModifyGraph/W=$ThisWindowNm zColor($ThisExtWvNm)={Xwv,*,*,Rainbow} // color by tseries
			else // ms -- orange sticks, 0.25 offset
				ModifyGraph/W=$ThisWindowNm mode=1,rgb($ThisExtWvNm)=(65280,43520,0)//,offset($ThisExtWvNm)={0.25,0}
			endif		
			SetAxis/W=$ThisWindowNm/A/E=1 $axisName  // autoscale fom 0
		endfor
	endif
	
	// trying to fix an issue with drawing layers on the panel
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif
		
End


/////////////////////////////////////////////////////////////////////////////////////
Function scat_plot_profiles(graphDest, passedFactNum)
	string graphDest
	variable passedFactNum

	// get global strings for data location, waves
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar ColDescrWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColDescrWvNm
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar GlobalFactnum = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:factnum
		
	// access waves
	wave Fmx4d = $pmfDFNm+"Fmx4d"
	wave ColDescrWv = $pmfDFNm+ColDescrWvNm
	wave p_map = $pmfDFNm+"p_map"

	// local variables
	variable factnum, BestFactor, LeftAnchor,TopAnchor
	variable idex,jdex
	string SubWindowNm, FullGraphNm, ChildList, ThisChild, winNmStr, winTitleStr
	
	// setup window
	if(stringmatch(graphDest, "ScatterPanel"))

		factnum = passedFactNum
		
		// kill old window
		SubwindowNm = "FactorTseries" + num2istr(factnum)
		FullGraphNm = "scat_pmf_Scatterpanel#"+SubWindowNm
		ChildList = ChildWindowList("scat_pmf_Scatterpanel")
	
		// clear the old graph, if it exists
		for(idex = 0;idex < itemsinlist(childList); idex += 1)
			thisChild = stringfromlist(idex, childList)
			if(stringmatch(thisChild, SubwindowNm))
				killwindow $fullGraphNm
				break // don't need to look at the rest
			endif
		endfor
		
		LeftAnchor = scat_ScatterPanel_LeftAnchor(FactNum)
		TopAnchor = scat_ScatterPanel_TopAnchor(FactNum)
		
		// and make the new one
		display/HOST=scat_pmf_ScatterPanel/N=$SubwindowNm/W=(LeftAnchor+9,TopAnchor+178,LeftAnchor+415,TopAnchor+294)/K=1

	else	// popped window

		factnum = passedFactNum
		winNmStr = "pop_Factor" +num2istr(passedFactNum)
		winTitleStr = "Current Factor Profile" 
		DoWindow/K $winNmStr  // kill graph if it already exists
		display/N=$winNmStr/K=1 as  winTitleStr  // make the new one
		SubwindowNm = winNmStr // for colorize_traces functions to find correct window
		FullGraphNm = SubwindowNm  // for log axes
	endif

	// particular factor
	if (factnum <= p_map[pdex])  // check that this factor exists for the current solution
		AppendtoGraph/W=$FullGraphNm Fmx4d[factnum-1][][fpeakdex][pdex] vs colDescrWv
							    // -1 correct for index starting at 0
		ModifyGraph/W=$FullGraphNm mode=1	// sticks
		if(stringmatch(graphDest, "ScatterPanel"))
			ModifyGraph/W=$FullGraphNm lsize(Fmx4d)=2
		endif
		pmf_colorize_1trace(FullGraphNm, factnum-1, "Fmx4d")
	endif

	ModifyGraph/W=$FullGraphNm grid=2,gridRGB=(34816,34816,34816)
End


// calculate 3d mx of the Reconst and Resid for the fpeaks of FactorSpace currently being plotted.
// this needs to be recalced if the selected fpeaks or pdex changed
Function pmf_calc_ReconstResidMSTSMxs()
	
	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	svar DataMxNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:DataMxNm
//	wave DataMx = $pmfDFnm + DataMxNm
	wave DataMx = root:ACSM:PMF_Exported_Waves:noNaNs_Org_data_2D_RemSpk
	svar StdDevMxNm =root:ACSM:PMF_Exported_Waves:StdDevMxNm
//	wave StdDevMx = $pmfDFnm + StdDevMxNm
	wave StdDevMx = root:ACSM:PMF_Exported_Waves:NoNaNs_Org_Err_2D_minpropWk44
	

	// access waves
//	wave Fmx4d = $pmfDFnm + "Fmx4d"
	wave Fmx4d = root:ACSM:PMF_Exported_Waves:Fmx4d
//	wave Gmx4d = $pmfDFnm + "Gmx4d"
	wave Gmx4d = root:ACSM:PMF_Exported_Waves:Gmx4d
//	wave Gmx4d_fractTotal = $pmfDFnm + "Gmx4d_fractTotal"
	wave Gmx4d_fractTotal = root:ACSM:PMF_Exported_Waves:Gmx4d_fractTotal
//	wave Resid_as_tseries_mx4d = $pmfDFnm + "Resid_as_tseries_mx4d"
	wave Resid_as_tseries_mx4d = root:ACSM:PMF_Exported_Waves:Resid_as_tseries_mx4d
	
	// 2.08
	wave/z ElemRatios_HC_3d = $pmfDFnm+"ElemRatios_HC_3d" // n=(NumFactors,NumFPeak, NumHRFactorSets)
	wave/z ElemRatios_OC_3d =  $pmfDFnm+"ElemRatios_OC_3d"
	wave/z ElemRatios_NC_3d =  $pmfDFnm+"ElemRatios_NC_3d"
	wave/z ElemRatios_SC_3d = $pmfDFnm+"ElemRatios_SC_3d"
	wave/z ElemRatios_OMOC_3d = $pmfDFnm+"ElemRatios_OMOC_3d"

	wave p_map = $pmfDFnm+"p_map"

	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex

	wave fpeakplot_map = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakplot_map		// contains 1s and zeros indicating the selection			
 	nvar plotFpeakCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotFpeakCheck	// radio button indicating current=1, all=2, selected=3

	wave pplot_map = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pplot_map			// contains 1s and zeros indicating the selection
 	nvar plotPCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotPCheck			// radio button indicating current=1, all=2, selected=3
 	
	nvar displayFactorSpaceOrFPeak = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:displayFactorSpaceOrFPeak

	wave ReconstMx3d =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ReconstMx3d
	wave ResidMx3d =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidMx3d
	wave TseriesMx3d =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesMx3d
	wave TseriesFractMx3d =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesFractMx3d //imu2.04
	wave ReconstTotalFpeaks =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ReconstTotalFpeaks //imu2.04
	wave ProfilesMx3d =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfilesMx3d
	wave ErrorMx3d =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ErrorMx3d
 	wave Error_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Error_2d	

//2.0.8
 	wave/z ElemRatios_HC_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemRatios_HC_2d				// dts2.08
 	wave/z ElemRatios_OC_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemRatios_OC_2d				// dts2.08
 	wave/z ElemRatios_NC_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemRatios_NC_2d				// dts2.08
 	wave/z ElemRatios_SC_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemRatios_SC_2d				// dts2.08
 	wave/z ElemRatios_OMOC_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemRatios_OMOC_2d				// dts2.08

	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pval
 	nvar factNum= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:factNum
 	
	string DoAlertStr
	variable idex, layerCount, numRows, numCols, numFpeaks, numps, maxp, numSelect, C1, currentFactorSpace

// 2.08
	nvar/z ElemCalsDone = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemCalsDone
	if (!NVar_exists(ElemCalsDone))
		variable/g  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemCalsDone=0
		nvar ElemCalsDone = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemCalsDone
	endif
	ElemCalsDone = WaveExists(ElemRatios_HC_3d) && WaveExists(ElemRatios_HC_2d) 
//	ElemCalsDone = (WaveExists(ElemRatios_HC_3d) && dimsize(ElemRatios_HC_3d,0)==Wavemax(p_map) && dimsize(ElemRatios_HC_3d,1)==numpnts(fpeakplot_map) && dimsize(ElemRatios_HC_3d,2)==numpnts(p_map) ) 
//	ElemCalsDone = ElemCalsDone && WaveExists(ElemRatios_HC_2d) && dimsize(ElemRatios_HC_2d,0)==Wavemax(p_map) && dimsize(ElemRatios_HC_2d,1)==numpnts(fpeakplot_map)

	// assume if true for H/C true for all elemental ratios
// end 2.08

	//1.04F this section rewritten for backwards compatibility
	nvar/z ModelError =  $pmfDFnm+"ModelError"			//1.04F
	if (!NVar_Exists(ModelError) )
		variable/g  $pmfDFnm+"ModelError"				
		nvar ModelError =  $pmfDFnm+"ModelError"			
		nvar/z pmf_ini_info_C1 = $pmfDFnm + "pmf_ini_info_C1"		// obsolete in 1.04F... backwards compatibility issue
		if (!NVar_Exists(pmf_ini_info_C1))
			print "// !!!!!!!!!!!!!"
			print "// The Model Error parameter used as input for the PMF calculations was not saved.  Using a default value of 0.01 for Model Error"
			ModelError = 0.01
		else
			print "// !!!!!!!!!!!!!"
			print "// The Model Error used C1as a parameter for the PMF calculations. The ModelError value was given this C1 value of "+num2str( pmf_ini_info_C1)
			ModelError = pmf_ini_info_C1
		endif
	endif
	
	numRows = dimsize(Gmx4d,0)		//m
	numCols = dimsize(Fmx4d,1)		//n
	numFpeaks = numpnts(fpeakPlot_map)	//#fpeaks
	numps =numpnts(p_map)			// max p
	maxp = p_map[numps-1]
	numSelect = displayFactorSpaceOrFPeak ? sum(pplot_map)	: sum(fpeakplot_map) 

	redimension/N=(numRows, numCols, numSelect) ReconstMx3d
	redimension/N=(numRows, numCols, numSelect) ResidMx3d
	redimension/N=(numRows, maxp, numSelect) TseriesMx3d
	redimension/N=(numRows, maxp, numSelect) TseriesFractMx3d //imu2.04
	redimension/N=(numRows,numSelect) ReconstTotalFpeaks //imu2.04
	redimension/N=(maxp, numCols, numSelect) ProfilesMx3d
	redimension/N=(numRows, numCols, numSelect) ErrorMx3d
		
	ReconstMx3d=nan
	ResidMx3d=nan
	TseriesMx3d=nan
	TseriesFractMx3d=nan //imu2.04
	ReconstTotalFpeaks = nan //imu2.04
	ProfilesMx3d=nan
	ErrorMx3d=nan
	
// 2.08
	if (ElemCalsDone)  // I don't think we need to redimension.  Do we?
		redimension/N=(maxp, numSelect) ElemRatios_HC_2d, ElemRatios_OC_2d, ElemRatios_NC_2d, ElemRatios_SC_2d, ElemRatios_OMOC_2d  //3.05B
		ElemRatios_HC_2d =nan
		ElemRatios_OC_2d =nan
		ElemRatios_NC_2d =nan
		ElemRatios_SC_2d =nan
		ElemRatios_OMOC_2d =nan
	endif
	
	// don't like this but will leave it here for now
	if(! waveexists(ReconstMx3d) || ! waveexists(ResidMx3d))  // didn't have enough memory to allocate either mx
		doAlertStr = "Function pmf_calc_resid_fpeakPlot could not allocate enough memory for ReconstMx3d and/or ResidMx3d.\r"
		doAlertStr += "Some data for the Residuals Species plot will not be available.  Try selecting fewer fpeaks to plot."
		doAlert 0, doAlertStr
		return(0)
	endif
	
//	MatrixOP/O ActualUnc_temp = (StdDevMx) + (abs(DataMx)*pmf_ini_info_C1)  // temporary wave		//1.04F
	MatrixOP/O ActualUnc_temp = (StdDevMx) + (abs(DataMx)*ModelError)  // temporary wave			//1.04F

	layerCount=0
	if (displayFactorSpaceOrFPeak ==0 )			// deal with fpeaks/seed
		for (idex=0;idex<numfpeaks;idex+=1)		// a selected fpeak
			if (fpeakplot_map[idex]==1)		
//imu2.04 just calc for column needed
//imu2.05 removed /D from this block
//				make/O/N=(numRows,Current_pval) G_temp=Gmx4d[p][q][idex][pdex] // this G 2dMx
//				make/O/N=(Current_pval,numCols) F_temp=Fmx4d[p][q][idex][pdex]	// this F 2d Mx
//				MatrixOP/O ReconstMx = G_temp x F_temp	// reconstruction of this solution		
//				MatrixOP/O ResidMx = (DataMx - ReconstMx) 	// residuals for this solution
//				MatrixOP/O ErrorMx = ResidMx /ActualUnc_temp
	
				TseriesMx3d[][][layercount] = Gmx4d[p][q][idex][pdex]  //imu2.04 G_temp[p][q] 
				TseriesFractMx3d[][][layercount] = Gmx4d_fractTotal[p][q][idex][pdex] //imu2.04 
				ProfilesMx3d[][][layercount] = Fmx4d[p][q][idex][pdex] //imu2,.04 F_temp[p][q]
				ReconstTotalFpeaks[][layercount] = Resid_as_tseries_mx4d[p][0][idex][pdex]  //imu2.04
				
				// 2.08
				if (ElemCalsDone)
					ElemRatios_HC_2d[][layercount] = ElemRatios_HC_3d[p][idex][pdex]
					ElemRatios_OC_2d[][layercount] = ElemRatios_OC_3d[p][idex][pdex]
					ElemRatios_NC_2d[][layercount] = ElemRatios_NC_3d[p][idex][pdex]
					ElemRatios_SC_2d[][layercount] = ElemRatios_SC_3d[p][idex][pdex]
					ElemRatios_OMOC_2d[][layercount] = ElemRatios_OMOC_3d[p][idex][pdex]
				endif

//imu2.04
//				ReconstMx3d[][][layercount] = ReconstMx[p][q] 
//				ResidMx3d[][][layercount] = ResidMx[p][q]
//				ErrorMx3d[][][layercount] =ErrorMx[p][q]
		
				layercount+=1
			endif
		endfor
	else					// deal with factor spaces
		for (idex=0;idex<numps;idex+=1)
			if (pplot_map[idex]==1)		
				currentFactorSpace = p_map[idex]
				make/O/N=(numRows, currentFactorSpace) G_temp=Gmx4d[p][q][fpeakdex][idex] // this G 2dMx  	//imu2.05 removed /D from this block
				make/O/N=(currentFactorSpace,numCols) F_temp=Fmx4d[p][q][fpeakdex][idex]	// this F 2d Mx	  //imu2.05 removed /D from this block
				MatrixOP/O ReconstMx = G_temp x F_temp	// reconstruction of this solution		
				MatrixOP/O ResidMx = (DataMx - ReconstMx) 	// residuals for this solution
				MatrixOP/O ErrorMx = ResidMx /ActualUnc_temp
//imu2.04 just calc for column needed 
				TseriesMx3d[][0,currentFactorSpace-1][layercount] = Gmx4d[p][q][fpeakdex][idex]  //imu2.04 G_temp[p][q] 
				TseriesFractMx3d[][0,currentFactorSpace-1][layercount] = Gmx4d_fractTotal[p][q][fpeakdex][idex] //imu2.04 
				ProfilesMx3d[0,currentFactorSpace-1][][layercount] = Fmx4d[p][q][fpeakdex][idex]  //imu2.04 F_temp[p][q]
				ReconstTotalFpeaks[][layercount] = Resid_as_tseries_mx4d[p][0][fpeakdex][idex]  //imu2.04
//imu2.04 
//				ReconstMx3d[][][layercount] = ReconstMx[p][q] 
//				ResidMx3d[][][layercount] = ResidMx[p][q]
//				ErrorMx3d[][][layercount] =ErrorMx[p][q]
		
				// 2.08
				if (ElemCalsDone)
					ElemRatios_HC_2d = ElemRatios_HC_3d[p][fpeakdex][idex]
					ElemRatios_OC_2d = ElemRatios_OC_3d[p][fpeakdex][idex]
					ElemRatios_NC_2d = ElemRatios_NC_3d[p][fpeakdex][idex]
					ElemRatios_SC_2d = ElemRatios_SC_3d[p][fpeakdex][idex]
					ElemRatios_OMOC_2d= ElemRatios_OMOC_3d[p][fpeakdex][idex]
				endif

				layercount+=1
			endif
		endfor
	endif

	// make the total of all m/z, all factors for this p factor solution (and varying fpeak values)
	// 1.2A fix
//imu2.04 Reconstructions are already calculated in Resid_as_massSpec_mx4d and Resid_as_tseries_mx4d, so don't need to calc again
//	imagetransform/g=5 transposevol ReconstMx3d		// swap rows and cols	
//	wave M_VolumeTranspose
//	MatrixOp/o temp1 = sumCols(M_VolumeTranspose) //sum cols
//	if (dimsize(temp1,2)==0)		// our original matrix had only one fpeak
//		redimension/n=(dimsize(temp1,0), dimsize(temp1,1),1) temp1
//	endif
//	imagetransform/g=5 transposevol temp1
//	wave M_VolumeTranspose
//	duplicate/o M_VolumeTranspose ReconstTotalFpeaks
//	killwaves/z temp1, m_volumeTranspose

	//  the 2d error matrix is used for ScaResidAllspecies and ScaResidOneSpecies graph.  We don't fuss with all the fpeak choices
//imu2.04 will just calculate for species being displayed
//	Error_2d =  ErrorMx3d[p][q][0]

	killwaves ActualUnc_temp//imu2.04 , G_temp, F_temp, ReconstMx, ResidMx, ErrorMx

End


// updates the 3d diurnal matrices 
Function pmf_calc_diurnMx3d()  

	variable idex, numfpeak, nump, layercount, numSelect

	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	nvar displayFactorSpaceOrFPeak = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:displayFactorSpaceOrFPeak
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	
	wave fpeakplot_map = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakplot_map
	wave pplot_map = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pplot_map
	numSelect = displayFactorSpaceOrFPeak ? sum(pplot_map): sum(fpeakplot_map)
	
	svar TimeAvgType = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:diurnalTypeList
	string thisTimeType
	variable TimeTypedex

	string DataType = "ts;resid;"
	string ThisDataType
	variable dataTypeDex
	
	string statType = "whiskBott;boxBott;median;boxTop;whiskTop;avg;"
	string ThisStatType
	variable statTypeDex
	
	string dataMxBase
	numfpeak = numpnts(fpeakplot_map)
	nump = numpnts(pplot_map)
	
	for(TimeTypedex = 0; timeTypeDex < itemsInList(TimeAvgType); timeTypedex += 1)
		ThisTimeType = stringFromList(timeTypeDex, TimeAvgType)

		for(dataTypeDex = 0; dataTypeDex < itemsInList(DataType);dataTypeDex += 1)
			ThisDataType = stringFromList(dataTypeDex, dataType)
			
			strswitch(ThisDataType)
				case "ts":
					DataMxBase = "Gmx4d"
					break
				case "Resid":
					DataMxBase = "Resid"
					break
			endswitch

			for(statTypeDex = 0; statTypeDex < itemsInList(statType); statTypeDex += 1)
				ThisStatType = stringFromList(statTypeDex,statType)
				
				// get the 4d data wave
//				wave ThisStatWv4d = $pmfDFnm+"diurnals:"+DataMxBase+"_"+thisTimeType+"_"+ThisStatType
				wave ThisStatWv4d = root:ACSM:PMF_Exported_Waves:Gmx4d
				// get the 3D data wave
				wave ThisStatWv3d = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:"+ThisDataType+"mx3d_"+ThisTimeType+"_"+ThisStatType
				
				// redimension for selected fpeaks/p's and fill with those layers
				redimension/N=(-1,-1,numselect) ThisStatWv3d

				if (displayFactorSpaceOrFPeak==0)// display fpeaks
					for(idex=0;idex<numfpeak;idex+=1)
						if (fpeakplot_map[idex]>0)
							ThisStatWv3d[][][layercount] = ThisStatWv4d[p][q][idex][pdex]			//2.09A  ThisStatWv4d has dims of 		
							layercount+=1
						endif
					endfor
				else		
					for(idex=0;idex<nump;idex+=1)
						if (pplot_map[idex]>0)
							ThisStatWv3d[][][layercount] = ThisStatWv4d[p][q][fpeakdex][idex]
							layercount+=1
						endif
					endfor
				endif
				if (statTypeDex ==2)
					// print "4D", NameofWave(ThisStatWv4d), NameofWave(ThisStatWv3d)				
				endif
				layercount = 0
			endfor //statTypeDex
		endfor //dataTypeDex
	endfor //timeTypeDex

end



// make TSeriesFactorX" waves, dependent on current p and fpeak choices
Function pmf_calc_TSeriesFactorX()

	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm	
	nvar fpeakdex =  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar Current_pVal  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
	nvar plotPCheck  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotPCheck
	
	wave p_map = $pmfDFNm + "p_map"
	wave TseriesMx3d =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesMx3d
	
	variable idex, nump, maxp, numtseries, numselect, selectdex
	
	// make the waves in pmfDF, if they don't already exist
	nump =numpnts(p_map)
	maxp =p_map[nump-1]
	numtseries = dimsize(TseriesMx3d,0)
	numselect = dimsize(TseriesMx3d,2)
	
	if (plotPCheck==1)
		for (idex = 0; idex < Current_pVal; idex += 1)	
			wave TSeriesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesFactor"+num2istr(idex+1)
			redimension/n=(numtseries, numselect) TSeriesFactorX 
			for (selectdex = 0; selectdex < numselect; selectdex += 1)	
				TSeriesFactorX[][selectdex] = TseriesMx3d[p][idex][selectdex]
			endfor
			wave TSeriesFactorPerentReconX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesFactorPercentRecon"+num2istr(idex+1)		//1.04A
			wave ReconstTotalFPeaks = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ReconstTotalFpeaks"		// We should only use this when current is selected for factor and fpeak space
			TSeriesFactorPerentReconX = TSeriesFactorX[p][0]/ReconstTotalFPeaks[p][0]		
		endfor		
		for (idex = Current_pVal; idex < maxp; idex += 1)
			wave TSeriesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesFactor"+num2istr(idex+1)
			wave TSeriesFactorPerentReconX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesFactorPercentRecon"+num2istr(idex+1)		//1.04A
			TSeriesFactorX =nan
			TSeriesFactorPerentReconX=nan
		endfor
	else			// may have many factor space solutions
		for (idex = 0; idex < maxp; idex += 1)
			wave TSeriesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesFactor"+num2istr(idex+1)
			redimension/n=(numtseries, numselect) TSeriesFactorX 
			for (selectdex = 0; selectdex < numselect; selectdex += 1)	
				TSeriesFactorX[][selectdex] = TseriesMx3d[p][idex][selectdex]
			endfor
		endfor
	endif

End




//imu2.04
// make TSeriesFractFactorX" waves, dependent on current p and fpeak choices  
Function pmf_calc_TSeriesFractFactorX()

	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm	
	nvar fpeakdex =  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar Current_pVal  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
	nvar plotPCheck  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotPCheck
	
	wave p_map = $pmfDFNm + "p_map"
	wave TseriesFractMx3d =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesFractMx3d
	
	variable idex, nump, maxp, numtseries, numselect, selectdex
	
	// make the waves in pmfDF, if they don't already exist
	nump =numpnts(p_map)
	maxp =p_map[nump-1]
	numtseries = dimsize(TseriesFractMx3d,0)
	numselect = dimsize(TseriesFractMx3d,2)
	
	if (plotPCheck==1)
		for (idex = 0; idex < Current_pVal; idex += 1)	
			wave TSeriesFractFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesFractFactor"+num2istr(idex+1)
			redimension/n=(numtseries, numselect) TSeriesFractFactorX 
			for (selectdex = 0; selectdex < numselect; selectdex += 1)	
				TSeriesFractFactorX[][selectdex] = TseriesFractMx3d[p][idex][selectdex]
			endfor
		endfor		
		for (idex = Current_pVal; idex < maxp; idex += 1)
			wave TSeriesFractFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesFractFactor"+num2istr(idex+1)
			TSeriesFractFactorX =nan
		endfor
	else			// may have many factor space solutions
		for (idex = 0; idex < maxp; idex += 1)
			wave TSeriesFractFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesFractFactor"+num2istr(idex+1)
			redimension/n=(numtseries, numselect) TSeriesFractFactorX 
			for (selectdex = 0; selectdex < numselect; selectdex += 1)	
				TSeriesFractFactorX[][selectdex] = TseriesFractMx3d[p][idex][selectdex]
			endfor
		endfor
	endif

End


// calculates everything for scaled residuals plots -- histogram and BoxPlot
Function pmf_calc_ScaResidAllSpecies()
				
	// get global variables
	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar BoxNumBins = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:BoxNumBins
	nvar boxWidth = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:boxwidth
	nvar whiskerWidth = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:whiskerwidth
	
	nvar plotFpeakCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotFpeakCheck
	nvar plotpCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotpCheck

	// get waves
//imu2.05 already calculated box/whisker after execution, so don't need these anymore
//	wave TseriesMx3d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesMx3d
//	wave ProfilesMx3d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfilesMx3d
//	wave ErrorMx3d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ErrorMx3d
//	wave Error_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Error_2d
//	wave ScaResidMx4d = $pmfDFnm+"ScaledResid_boxWhisk_mx4d"
	wave ScaResidMx4d = root:ACSM:PMF_Exported_Waves:ScaledResid_boxWhisk_mx4d
	
	//  waves for storing histogram data
	wave ScaResid_HistImageDisplay = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResid_HistImageDisplay
	wave ScaResid_median  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResid_median
	wave ScaResid_boxtop  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResid_boxtop
	wave ScaResid_boxbottom = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResid_boxbottom
	wave ScaResid_whiskertop = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResid_whiskertop
	wave ScaResid_whiskerbottom = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResid_whiskerbottom

	variable numRows, numCols,  idex, C1
	
	numCols = dimSize (ScaResidMx4d,1)		// n
	
	if (plotFpeakCheck!=1 || plotpCheck!=1)		// do only if there is no multiple factor space displays 
		ScaResid_HistImageDisplay=nan
		ScaResid_median=nan
		ScaResid_boxtop  = nan
		ScaResid_boxbottom = nan
		ScaResid_whiskertop = nan
		ScaResid_whiskerbottom = nan
		return 0
	endif

//imu2.05 Already calculated box/whisker, no longer calculating this histogram	
//	// make temp wvs for updating calculations
//	make/O/N=(numCols,BoxNumBins) ScaResid_HistImageTemp	// temporary wave
//	make/O/N=(numRows) ScaResid_tempRow  // size of 1 row of E, temporary wave
//	make/O/N=(BoxNumBins) histResultTemp			// temporary wave	
//
//	// find max, min scaled residuals for scaling histResultTemp 
//	// do only for the first layer, the first fpeak value selected
//	wavestats/Q/M=1 Error_2d
//	setscale/I x, V_min, V_max, histResultTemp
//	SetScale/I y, V_min, V_max, ScaResid_HistImageDisplay
	
	// Calc histogram and stats for each column of E
//imu2.05 already calculated box/whisker, not doing histogram,
//	for(idex=0;idex<numCols;idex+=1)	
//		ScaResid_tempRow = Error_2d[p][idex] //Grab one "species" worth of residuals, it is numRows many points big
//		
//		Histogram/B=2 ScaResid_tempRow, histResultTemp
//		ScaResid_HistImageTemp[idex][]=histResultTemp[q]  // put histogram for one species in corresponding Image Mx
//		
//		// put stats in corresponding wvs for BoxPlot
//		wavestats/q/W ScaResid_tempRow 		//1.04A
//		wave M_WaveStats
//		sort ScaResid_tempRow, ScaResid_tempRow
		ScaResid_median[] = ScaResidMx4d[2][p][fpeakdex][pdex]//imu2.05 ScaResid_tempRow[(round(numRows/2)-1)]  //median  - found by midpoint
		ScaResid_boxtop[] = ScaResidMx4d[3][p][fpeakdex][pdex]//imu2.05 ScaResid_tempRow[(round(numRows*(0.5+boxwidth/2))-1)]  //boxtop  ~75% of pnts
		ScaResid_boxbottom[] = ScaResidMx4d[1][p][fpeakdex][pdex]//imu2.05 ScaResid_tempRow[(round(numRows*(0.5-boxwidth/2))-1)]//boxbottom  ~25% of pnts
		ScaResid_whiskertop[] = ScaResidMx4d[4][p][fpeakdex][pdex]//imu2.05 ScaResid_tempRow[(round(numRows*(0.5+whiskerwidth/2))-1)]//whiskertop	top of range  95%
		ScaResid_whiskerbottom[] = ScaResidMx4d[0][p][fpeakdex][pdex]//imu2.05 ScaResid_tempRow[(round(numRows*(0.5-whiskerwidth/2))-1)]//whiskerbottom bottom of range 5%
//	endfor		

	// Pretty up histogram display wave
//	ScaResid_HistImageDisplay =  ScaResid_HistImageTemp //log(ScaResid_HistImage + 1)

	KillWaves/Z ScaResid_HistImageTemp, ScaResid_tempRow,  histResultTemp

End


// updates CurrSpeciesHistogram, depends on Error_2d being current
//imu2.05 updated so that doesn't use Error_2d; instead, reconstructs just the selected m/z
Function pmf_calc_ScaResidOneSpecies()

	// get global strings for data location, waves
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar DataMxNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:DataMxNm
	svar StdDevMxNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:StdDevMxNm
	nvar SpeciesNumIndex	= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:SpeciesNumIndex
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar modelError = $pmfDFnm+"modelError"

	nvar plotFpeakCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotFpeakCheck
	nvar plotpCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotpCheck

//imu2.05	wave Error_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Error_2d		// for current pdex and fpeakdex
	wave CurrSpeciesHistogram = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrSpeciesHistogram
	//imu2.05 added these waves
//	wave Gmx4d = $pmfDFnm+"Gmx4d"
	wave Gmx4d = root:ACSM:PMF_Exported_Waves:Gmx4d
//	wave Fmx4d = $pmfDFnm+"Fmx4d"
	wave Fmx4d = root:ACSM:PMF_Exported_Waves:Fmx4d
//	wave DataMx = $pmfDFnm+DataMxNm
	wave DataMx = root:ACSM:PMF_Exported_Waves:noNaNs_Org_err_2D_minPropWk44
//	wave StdDevMx = $pmfDFnm + stdDevMxNm
	wave StdDevMx = root:ACSM:PMF_Exported_Waves:noNaNs_Org_data_2D_RemSpk
	wave p_map = $pmfDFnm + "p_map"
	
	variable numFactors = p_map[pdex]
	variable numRows = dimsize(Gmx4d,0)
	// Calc histogram for current column of E based on extreme values in that column; this means the histogram won't match the image plot
	if (plotFpeakCheck==1 && plotpCheck==1)		// do only if there is no multiple factor space displays 

		//imu2.05 updated to FREE, added ThisMzReconst,ThisMzResid
		make/FREE/N=(numRows) ScaResid_temp,ThisMzResid // size of 1 row of E, temporary wave
		make/FREE/N=(numFactors) Fmx_thisMz = Fmx4d[p][SpeciesNumIndex][fpeakdex][pdex]
		make/FREE/N=(numRows, numFactors) Gmx_thisSoln = Gmx4d[p][q][fpeakDex][pdex]
		
		// reconst this m/z, calc resid, scaled resid
		matrixOp/FREE ThisMzReconst =  Gmx_thisSoln x Fmx_ThisMz
		ThisMzResid = DataMx[p][speciesNumIndex] - ThisMzReconst
		ScaResid_temp = ThisMzResid/(StdDevMx[p][speciesNumIndex]+ ModelError*DataMx[p][speciesNumIndex])

//imu2.05	ScaResid_temp = Error_2d[p][SpeciesNumIndex] //Grab one "species" worth of residuals		
		Histogram/B=1 ScaResid_temp, CurrSpeciesHistogram		
		killWaves ScaResid_temp
	else
		CurrSpeciesHistogram=nan
	endif
	
End


// makes the plot for ratio residual time series 
Function pmf_calc_residualRatios()  

	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	
//	wave Resid_as_tseries_mx4d = $pmfDFNm+ "Resid_as_tseries_mx4d" 
	wave Resid_as_tseries_mx4d = root:ACSM:PMF_Exported_Waves:Resid_as_tseries_mx4d			
//	wave Resid_as_massspec_mx4d = $pmfDFNm+ "Resid_as_massspec_mx4d" 
	wave Resid_as_massspec_mx4d = root:ACSM:PMF_Exported_Waves:Resid_as_massSpec_mx4d			
	wave fpeakplot_map = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakplot_map
	wave pplot_map = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pplot_map
	
	wave ResidualTseriesMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualTseriesMx			
	wave ResidualTseriesAbsMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualTseriesAbsMx			
	wave ResidualTseriesRatioMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualTseriesRatioMx			
	wave ResidualTseriesAbsRatioMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualTseriesAbsRatioMx			
	wave ResidualTseriesRatioVarianceMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualTseriesRatioVarianceMx			

	wave ResidualProfilesMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualProfilesMx			
	wave ResidualProfilesAbsMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualProfilesAbsMx			
	wave ResidualProfilesRatioMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualProfilesRatioMx			
	wave ResidualProfilesAbsRatioMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualProfilesAbsRatioMx			
	wave ResidualProfilesRatioVarianceMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualProfilesRatioVarianceMx			

	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex

	nvar displayFactorSpaceOrFPeak = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:displayFactorSpaceOrFPeak

	variable idex, numfpeak, nump, layercount, numSelect, numtseries, numamu
	
	numTseries = dimsize(Resid_as_tseries_mx4d,0)
	numamu = dimsize(Resid_as_massspec_mx4d,0)
	numfpeak = numpnts(fpeakplot_map)
	nump = numpnts(pplot_map)

	layercount = 0
	numSelect = displayFactorSpaceOrFPeak ? sum(pplot_map): sum(fpeakplot_map)
	
	redimension/n=(numTseries, numSelect) ResidualTseriesMx, ResidualTseriesAbsMx, ResidualTseriesRatioMx, ResidualTseriesAbsRatioMx, ResidualTseriesRatioVarianceMx
	redimension/n=(numamu, numSelect) ResidualProfilesMx, ResidualProfilesAbsMx, ResidualProfilesRatioMx, ResidualProfilesAbsRatioMx, ResidualProfilesRatioVarianceMx	
	
	if (displayFactorSpaceOrFPeak==0)// display fpeaks
		for(idex=0;idex<numfpeak;idex+=1)
			if (fpeakplot_map[idex]>0)
				ResidualTseriesMx[][layercount] = Resid_as_tseries_mx4d[p][1][idex][pdex]			
				ResidualTseriesAbsMx[][layercount] = Resid_as_tseries_mx4d[p][2][idex][pdex]
				ResidualTseriesRatioMx[][layercount] = Resid_as_tseries_mx4d[p][3][idex][pdex]
				ResidualTseriesAbsRatioMx[][layercount] = Resid_as_tseries_mx4d[p][4][idex][pdex]
				ResidualTseriesRatioVarianceMx[][layercount] = Resid_as_tseries_mx4d[p][5][idex][pdex]
			
				ResidualProfilesMx[][layercount] = Resid_as_massspec_mx4d[p][1][idex][pdex]			
				ResidualProfilesAbsMx[][layercount] = Resid_as_massspec_mx4d[p][2][idex][pdex]
				ResidualProfilesRatioMx[][layercount] = Resid_as_massspec_mx4d[p][3][idex][pdex]
				ResidualProfilesAbsRatioMx[][layercount] = Resid_as_massspec_mx4d[p][4][idex][pdex]
				ResidualProfilesRatioVarianceMx[][layercount] = Resid_as_massspec_mx4d[p][5][idex][pdex]
				
				layercount+=1
			endif
		endfor
	else		
		for(idex=0;idex<nump;idex+=1)
			if (pplot_map[idex]>0)
				ResidualTseriesMx[][layercount] = Resid_as_tseries_mx4d[p][1][fpeakdex][idex]			
				ResidualTseriesAbsMx[][layercount] = Resid_as_tseries_mx4d[p][2][fpeakdex][idex]
				ResidualTseriesRatioMx[][layercount] = Resid_as_tseries_mx4d[p][3][fpeakdex][idex]
				ResidualTseriesAbsRatioMx[][layercount] = Resid_as_tseries_mx4d[p][4][fpeakdex][idex]
				ResidualTseriesRatioVarianceMx[][layercount] = Resid_as_tseries_mx4d[p][5][fpeakdex][idex]
			
				ResidualProfilesMx[][layercount] = Resid_as_massspec_mx4d[p][1][fpeakdex][idex]			
				ResidualProfilesAbsMx[][layercount] = Resid_as_massspec_mx4d[p][2][fpeakdex][idex]
				ResidualProfilesRatioMx[][layercount] = Resid_as_massspec_mx4d[p][3][fpeakdex][idex]
				ResidualProfilesAbsRatioMx[][layercount] = Resid_as_massspec_mx4d[p][4][fpeakdex][idex]
				ResidualProfilesRatioVarianceMx[][layercount] = Resid_as_massspec_mx4d[p][5][fpeakdex][idex]
				
				layercount+=1
			endif
		endfor
	endif
	
End



// updates RR_tseries, RR_profiles, RR_IDtag
Function pmf_calc_RvsR()
	
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	wave fpeak_map =$pmfDFNm+"fpeak_map"
	wave p_map = $pmfDFNm+"p_map"
	wave fpeakPlot_map = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakPlot_map	
	wave RR_tseries = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_tseries
	wave RR_profiles = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_profiles
	wave RR_tseries_UC = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_tseries_UC
	wave RR_profiles_UC = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_profiles_UC
	wave RR_profiles_sprmn = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_profiles_sprmn
	wave/t RR_IDtag = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_IDtag	
//	wave R_PMFvsPMFmx3d_TSeries = $pmfDFNm+"R_PMFvsPMFmx3d_TSeries"
	wave R_PMFvsPMFmx3d_TSeries = root:ACSM:PMF_Exported_Waves:R_PMFvsPMFmx3d_Profiles
//	wave R_PMFvsPMFmx3d_Factors_sprmn = $pmfDFNm+"R_PMFvsPMFmx3d_Factors_sprmn"

//	wave/z R_PMFvsPMFmx3d_Profiles = $pmfDFNm+"R_PMFvsPMFmx3d_Profiles"
	wave/z R_PMFvsPMFmx3d_Profiles = root:ACSM:PMF_Exported_Waves:R_PMFvsPMFmx3d_Profiles
	if (!WaveExists(R_PMFvsPMFmx3d_Profiles))		// pre-ver1.2 name
		wave R_PMFvsPMFmx3d_Profiles = $pmfDFNm+"R_PMFvsPMFmx3d_Factors"
	endif

//	wave/z R_PMFvsPMFmx3d_TSeries_UC = $pmfDFNm+"R_PMFvsPMFmx3d_TSeries_UC"
	wave/z R_PMFvsPMFmx3d_TSeries_UC = root:ACSM:PMF_Exported_Waves:R_PMFvsPMFmx3d_Tseries_UC
//	wave/z R_PMFvsPMFmx3d_Profiles_UC = $pmfDFNm+"R_PMFvsPMFmx3d_Profiles_UC"
	wave/z R_PMFvsPMFmx3d_Profiles_UC = root:ACSM:PMF_Exported_Waves:R_PMFvsPMFmx3d_Profiles_UC
	 	
	if (!waveexists(R_PMFvsPMFmx3d_TSeries_UC) || !waveexists(R_PMFvsPMFmx3d_Profiles_UC))
		pmfCalcs_R_PMFvsPMFmx3d_fpeaks()  	
	endif
	
	 //1/04A  	
//	nvar R_PearsonOrUncentered= root:pmf_plot_globals:R_PearsonOrUncentered
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	svar RvsR_str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RvsR_str
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal

	nvar plotFpeakCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotFpeakCheck
	nvar plotpCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotpCheck
	
	variable numVals, idex, jdex, rowstart, colstart, minp, counter, numfpeak, fdex, nump, maxp
	
	numfpeak = numpnts(fpeak_map)
	minp = p_map[0]
	nump = numpnts(p_map)
	maxp = p_map[nump-1]
	 	
	if (plotpCheck!=1 )		// we can do this for multiple fpeaks but not factor space
		RR_tseries=nan
		for (idex = 0;idex<maxp;idex+=1)
			for (jdex = 0;jdex<(maxp-1);jdex+=1)
				RR_IDtag[counter] = num2istr(idex+1) + "_"+num2istr(jdex+1) 
				wave/z RR_tseriesAllFpeak = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_tseries"+RR_IDtag[counter]+"AllFpeak"
				wave/z RR_tseriesAllFpeakUC = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_tseriesUC"+RR_IDtag[counter]+"AllFpeak"
				RR_tseriesAllFpeak=nan
			endfor
		endfor
		return 0
	endif
	
	if (stringmatch(RvsR_str, "pless1"))	//p, p-1
		if (Current_pVal!= 1 && pdex>0)
			numVals =Current_pVal*(Current_pVal-1) 		//Current_pVal*(Current_pVal-1)/2 - 1
			redimension/n=(numVals) RR_tseries, RR_profiles, RR_tseries_UC, RR_profiles_UC, RR_profiles_sprmn, RR_IDtag	
			rowstart = (Current_pVal)*(Current_pVal-1)/2 - (minp-1) * (minp-2)/2
			colstart = rowstart - (Current_pVal-1)
			make/o/n=(Current_pVal, Current_pVal-1, numfpeak) temp_2d_tseries,temp_2d_tseries_UC
			make/o/n=(Current_pVal, Current_pVal-1, numfpeak) temp_2d_profiles, temp_2d_profiles_UC, temp_2d_profiles_sprmn		
			temp_2d_tseries = R_PMFvsPMFmx3d_TSeries[p+rowstart][q+colstart][fpeakdex]
			temp_2d_profiles = R_PMFvsPMFmx3d_Profiles[p+rowstart][q+colstart][fpeakdex]
			temp_2d_tseries_UC = R_PMFvsPMFmx3d_TSeries_UC[p+rowstart][q+colstart][fpeakdex]
			temp_2d_profiles_UC = R_PMFvsPMFmx3d_Profiles_UC[p+rowstart][q+colstart][fpeakdex]
//			temp_2d_profiles_sprmn = R_PMFvsPMFmx3d_Factors_sprmn[p+rowstart][q+colstart][fpeakdex]
	
			counter = 0
			for (idex = 0;idex<Current_pVal;idex+=1)
				for (jdex = 0;jdex<(Current_pVal-1);jdex+=1)
					RR_tseries[counter]= temp_2d_tseries[idex][jdex][fpeakdex]
					RR_profiles[counter]= temp_2d_profiles[idex][jdex][fpeakdex]		
					RR_tseries_UC[counter]= temp_2d_tseries_UC[idex][jdex][fpeakdex]
					RR_profiles_UC[counter]= temp_2d_profiles_UC[idex][jdex][fpeakdex]		
					RR_profiles_sprmn[counter]= temp_2d_profiles_sprmn[idex][jdex][fpeakdex]
							
					RR_IDtag[counter] = num2istr(idex+1) + "_"+num2istr(jdex+1) 
					
					wave RR_tseriesAllFpeak = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_tseries"+RR_IDtag[counter]+"AllFpeak"
					wave RR_profilesAllFpeak = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_profiles"+RR_IDtag[counter]+"AllFpeak"
					wave RR_tseriesAllFpeak_UC = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_tseries"+RR_IDtag[counter]+"AllFpeak_UC"
					wave RR_profilesAllFpeak_UC = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_profiles"+RR_IDtag[counter]+"AllFpeak_UC"
					wave RR_profilesAllFpeak_sprmn = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_profiles_sprmn"+RR_IDtag[counter]+"AllFpeak"
					RR_tseriesAllFpeak=nan
					RR_profilesAllFpeak=nan
					RR_tseriesAllFpeak_UC=nan
					RR_profilesAllFpeak_UC=nan
					RR_profilesAllFpeak_sprmn=nan
					
					counter+=1  // at the end, counter should = numVals
				endfor
			endfor
		endif		
	
	else		// we plot for current p and fpeaks that  were chosen 
	
		numVals = Current_pVal*(Current_pVal-1)/2
		redimension/n=(numVals) RR_tseries, RR_profiles, RR_tseries_UC, RR_profiles_UC, RR_profiles_sprmn,RR_IDtag	
		rowstart = (Current_pVal)*(Current_pVal-1)/2 - (minp) * (minp-1)/2
		make/o/n=(Current_pVal, Current_pVal, numfpeak) temp_3d_tseries, temp_3d_tseries_UC		
		make/o/n=(Current_pVal, Current_pVal, numfpeak) temp_3d_profiles, temp_3d_profiles_UC, temp_3d_profiles_sprmn		
		temp_3d_tseries = R_PMFvsPMFmx3d_TSeries[p+rowstart][q+rowstart][r]
		temp_3d_profiles = R_PMFvsPMFmx3d_Profiles[p+rowstart][q+rowstart][r]
		temp_3d_tseries_UC = R_PMFvsPMFmx3d_TSeries_UC[p+rowstart][q+rowstart][r]
		temp_3d_profiles_UC = R_PMFvsPMFmx3d_Profiles_UC[p+rowstart][q+rowstart][r]
//		temp_3d_profiles_sprmn = R_PMFvsPMFmx3d_Factors_sprmn[p+rowstart][q+rowstart][r]

		counter = 0
		for (idex = 0;idex<Current_pVal;idex+=1)
			for (jdex = 0;jdex<idex;jdex+=1)
				RR_tseries[counter]= temp_3d_tseries[idex][jdex][fpeakdex]
				RR_profiles[counter]= temp_3d_profiles[idex][jdex][fpeakdex]		
				RR_tseries_UC[counter]= temp_3d_tseries_UC[idex][jdex][fpeakdex]
				RR_profiles_UC[counter]= temp_3d_profiles_UC[idex][jdex][fpeakdex]		
				RR_profiles_sprmn[counter]= temp_3d_profiles_sprmn[idex][jdex][fpeakdex]	
					
				RR_IDtag[counter] = num2istr(jdex+1) + "_"+num2istr(idex+1) 		// jdex is always <= idex
				
				wave RR_tseriesAllFpeak = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_tseries"+RR_IDtag[counter]+"AllFpeak"
				wave RR_profilesAllFpeak = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_profiles"+RR_IDtag[counter]+"AllFpeak"
				wave RR_tseriesAllFpeak_UC = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_tseries"+RR_IDtag[counter]+"AllFpeak_UC"
				wave RR_profilesAllFpeak_UC = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_profiles"+RR_IDtag[counter]+"AllFpeak_UC"
				wave RR_profilesAllFpeak_sprmn = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_profiles_sprmn"+RR_IDtag[counter]+"AllFpeak"
				RR_tseriesAllFpeak = temp_3d_tseries[idex][jdex][p]
				RR_profilesAllFpeak = temp_3d_profiles[idex][jdex][p]
				RR_tseriesAllFpeak_UC = temp_3d_tseries_UC[idex][jdex][p]
				RR_profilesAllFpeak_UC = temp_3d_profiles_UC[idex][jdex][p]
				RR_profilesAllFpeak_sprmn = temp_3d_profiles_sprmn[idex][jdex][p]		//1.04A
				
				for (fdex=0;fdex<numfpeak;fdex+=1)		// nan out places where fpeaks not selected	
					if (fpeakPlot_map[fdex] != 1)
						RR_tseriesAllFpeak[fdex]=nan
						RR_profilesAllFpeak[fdex]=nan
						RR_tseriesAllFpeak_UC[fdex]=nan
						RR_profilesAllFpeak_UC[fdex]=nan
						RR_profilesAllFpeak_sprmn[fdex]=nan
					endif
				endfor
				
				counter +=1
			endfor
		endfor
	endif	// p-1 or current p with chosen fpeaks
		
	killwaves/z temp_3d_tseries, temp_3d_profiles, temp_3d_tseries_UC, temp_3d_profiles_UC,   temp_3d_profiles_sprmn 
	killwaves/z temp_2d_tseries, temp_2d_profiles, temp_2d_profiles_sprmn

End



// function for extracting the reconstructed species time series for the ReconstVsMeasSpec plot
Function pmf_calc_ReconSpeciesFpeaks()
	
	nvar SpeciesNumIndex  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:SpeciesNumIndex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex			//imu2.04

	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm 	//imu2.04
	svar dataMxNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:dataMxNm	//imu2.04
	svar StdDevMxNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:StdDevMxNm //imu2.04
	
//	wave TseriesMx3d =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TseriesMx3d
	wave TseriesMx3d = root:ACSM:PMF_Exported_Waves:noNaNs_Org_data_2D_RemSpk
//	wave ProfilesMx3d =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfilesMx3d	//imu2.04
	wave ProfilesMx3d = root:ACSM:PMF_Exported_Waves:noNaNs_Org_err_2D_minPropWk44
	wave dataMx = $pmfDFnm + dataMxNm				//imu2.04
	wave StdDevMx = $pmfDFnm + StdDevMxNm			//imu2.04
	wave p_map = $pmfDFnm + "p_map"					//imu2.04
	 
//imu2.04 now calc only mz selected for faster updating
//	wave ReconstMx3d =  root:pmf_plot_globals:ReconstMx3d		// already fpeak-dimensional
//	wave ResidMx3d =  root:pmf_plot_globals:ResidMx3d				// already fpeak-dimensional
	
	wave ReconSpeciesFpeaks = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ReconSpeciesFpeaks
	wave ResidSpeciesFpeaks = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidSpeciesFpeaks
	wave QcontrSpeciesFpeaks = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:QcontrSpeciesFpeaks  //imu2.04
	
	variable numtseries, numselect
	variable currentp, fpeakselectdex	//imu2.04
	
	// make the waves in pmfDF, if they don't already exist
	numtseries = dimsize(TseriesMx3d,0)
	numselect =  dimsize(TseriesMx3d,2)
	currentp = p_map[pdex]		//imu2.04
	
	redimension/n=(numtseries, numselect) ReconSpeciesFpeaks 
	redimension/n=(numtseries, numselect) ResidSpeciesFpeaks 	
	redimension/N=(numtseries,numselect) QcontrSpeciesFpeaks //imu2.04
	
//imu2.04 
//	ReconSpeciesFpeaks= ReconstMx3d[p][SpeciesNumIndex][q]
//	ResidSpeciesFpeaks = ResidMx3d[p][SpeciesNumIndex][q]
	
	//imu2.04  make waves for this Gmx2d, Fvtr1d
	make/FREE/N=(numTseries, currentp) ThisGmx2d
	make/FREE/N=(currentp) ThisFvtr1d
	
	//imu2.04 calculate reconst, resid of selected species
	for(fpeakselectDex = 0; fpeakSelectDex < numselect; fpeakSelectDex += 1)
		ThisGmx2d = TseriesMx3d[p][q][fpeakselectDex]
		ThisFvtr1d = ProfilesMx3d[p][SpeciesNumIndex][fpeakselectDex]
		
		matrixOp/FREE ThisSpeciesReconst = ThisGmx2d x ThisFvtr1d
		ReconSpeciesFpeaks[][fpeakSelectDex] = ThisSpeciesReconst[p]
		
		ResidSpeciesFpeaks[][fpeakSelectDex] = dataMx[p][SpeciesNumIndex] - ThisSpeciesReconst[p]//  [fpeakSelectDex]2.09A  DTS
	
		QcontrSpeciesFpeaks[][fpeakSelectDex] = ResidSpeciesFpeaks[p][fpeakSelectDex]/StdDevMx[p][speciesNumIndex]
	endfor
	
End

//imu2.05  Updates TseriesDiurnalFactorX waves from diurnalMx4d calculated at end of execution
function	pmf_calc_TseriesDiurnalFactorX()

	variable nump, maxp, numRows, numselect, numfactors, max_p_fpeak
	variable factordex, jdex, selectdex
	string factordexStr, MxBase
	
	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	svar rowDescrWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rowDescrWvNm
	wave timesWv = $pmfDFnm + rowDescrWvNm

	wave p_map = $pmfDFnm+"p_map"		// needed only to get number of p values
	wave fpeak_map = $pmfDFnm+"fpeak_map"

	wave fpeakplot_map = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakplot_map	// this one should always exist
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
	nvar plotpcheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotpcheck

	string residList = ";Abs;Ratio;AbsRat;RatVar;" 		//2.00A
	string residStr

	nump = numpnts(p_map)
	maxp = p_map[nump-1]
	numRows = numpnts(timesWv)
	max_p_fpeak = max(nump, numpnts(fpeak_map))

	wave TSeriesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TSeriesFactor1"
	numselect = dimsize(TSeriesFactorX,1)		// sum(fpeakplot_map)

	svar timeAvgType = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:diurnalTypeList
	string thisTimeType
	variable TimeTypedex

	string DataType = "ts;resid;"
	string ThisDataType, dataTypeShort
	variable dataTypeDex

	if (plotpcheck==1)
		maxp = Current_pVal
	endif

	for(TimeTypedex = 0; timeTypeDex < itemsInList(TimeAvgType); timeTypedex += 1)
		ThisTimeType = stringFromList(timeTypeDex, TimeAvgType)

		for(dataTypeDex = 0; dataTypeDex < itemsInList(DataType);dataTypeDex += 1)
			ThisDataType = stringFromList(dataTypeDex, dataType)
			
			strswitch(ThisDataType)
				case "ts":
					numFactors = maxp
					break
				case "Resid":
					numFactors = itemsInList(residList)  
					break
			endswitch

			// get DataWvs
			wave DataWv_whiskBott = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:"+ThisDataType+"mx3d_"+ThisTimeType+"_whiskBott"
			wave DataWv_boxBott = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:"+ThisDataType+"mx3d_"+ThisTimeType+"_boxBott"
			wave DataWv_median = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:"+ThisDataType+"mx3d_"+ThisTimeType+"_median"
			wave DataWv_boxTop = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:"+ThisDataType+"mx3d_"+ThisTimeType+"_boxTop"
			wave DataWv_whiskTop = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:"+ThisDataType+"mx3d_"+ThisTimeType+"_whiskTop"
			wave DataWv_avg = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:"+ThisDataType+"mx3d_"+ThisTimeType+"_avg"
		
			for (selectdex=0; selectdex<numselect;selectdex+=1)  // fill all selected fpeaks/p's with values
				for (factordex = 0; factordex < numFactors; factordex += 1)
					strswitch(ThisDataType)
						case "ts":
							factorDexStr = num2istr(factordex+1)
							DataTypeShort = "ts"
							break
						case "Resid":
							factorDexStr = stringFromList(factordex,residList)
							dataTypeShort = "Res"
							break
					endswitch					

					// separate wave for each factor-fpeak combo needed for box-whisker graph					
					wave diurnalMedian_X = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:Median_"+DataTypeShort+factordexStr+"_"+ThisTimeType+"_f"+num2istr(selectdex)
					wave diurnalMean_X = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:Mean_"+DataTypeShort+factordexStr+"_"+ThisTimeType+"_f"+num2istr(selectdex)
					wave diurnalP0_X = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P0_"+DataTypeShort+factordexStr+"_"+ThisTimeType+"_f"+num2istr(selectdex)
					wave diurnalP25_X = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P25_"+DataTypeShort+factordexStr+"_"+ThisTimeType+"_f"+num2istr(selectdex)
					wave diurnalP75_X = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P75_"+DataTypeShort+factordexStr+"_"+ThisTimeType+"_f"+num2istr(selectdex)
					wave diurnalP100_X = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P100_"+DataTypeShort+factordexStr+"_"+ThisTimeType+"_f"+num2istr(selectdex)

					diurnalMedian_X = DataWv_median[p][factordex][selectdex]
					diurnalMean_X = DataWv_avg[p][factordex][selectdex]
					diurnalP0_X = DataWv_whiskBott[p][factordex][selectdex]
					diurnalP25_X = DataWv_boxBott[p][factordex][selectdex]
					diurnalP75_X = DataWv_boxTop[p][factordex][selectdex]
					diurnalP100_X = DataWv_whiskTop[p][factordex][selectdex]

				endfor  //factordex
			endfor // selectDex, selected fpeaks/p's
			
			for (selectdex=numSelect; selectdex<max_p_fpeak;selectdex+=1)  // fill all not-selected fpeaks/p's with NaN
				for (factordex = 0; factordex < numFactors; factordex += 1)
					strswitch(ThisDataType)
						case "ts":
							factorDexStr = num2istr(factordex+1)
							break
						case "Resid":
							factorDexStr = stringFromList(factordex,residList)
							break
					endswitch					

					// separate wave for each factor-fpeak combo needed for box-whisker graph					
					wave diurnalMedian_X = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:Median_"+DataTypeShort+factordexStr+"_"+ThisTimeType+"_f"+num2istr(selectdex)
					wave diurnalMean_X = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:Mean_"+DataTypeShort+factordexStr+"_"+ThisTimeType+"_f"+num2istr(selectdex)
					wave diurnalP0_X = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P0_"+DataTypeShort+factordexStr+"_"+ThisTimeType+"_f"+num2istr(selectdex)
					wave diurnalP25_X = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P25_"+DataTypeShort+factordexStr+"_"+ThisTimeType+"_f"+num2istr(selectdex)
					wave diurnalP75_X = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P75_"+DataTypeShort+factordexStr+"_"+ThisTimeType+"_f"+num2istr(selectdex)
					wave diurnalP100_X = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P100_"+DataTypeShort+factordexStr+"_"+ThisTimeType+"_f"+num2istr(selectdex)

					diurnalMedian_X = NaN
					diurnalMean_X = NaN
					diurnalP0_X = NaN
					diurnalP25_X = NaN
					diurnalP75_X = NaN
					diurnalP100_X = NaN

			
				endfor	// factordex
			endfor	// select (fpeaks) layer, unselected fpeaks/p's
		endfor	// dataType (tseries, resid)
	endfor	// timeType
end
// make ProfilesFactorX waves, dependent on current p and fpeak choices
Function pmf_calc_ProfilesFactorX()

	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm	
	nvar fpeakdex =  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
	nvar plotPCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotPCheck
//	wave var_PMFresultsMx4d = $pmfDFNm+"var_PMFresultsMx4d"	
	wave var_PMFresultsMx4d = root:ACSM:PMF_Exported_Waves:var_PMFresultsMx4d
	wave p_map = $pmfDFNm + "p_map"
	wave ProfilesMx3d =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfilesMx3d

	variable idex, nump, maxp, numAmu, numSelect, selectDex
	
	nump =numpnts(p_map)
	maxp =p_map[nump-1]
	numAmu =dimsize(ProfilesMx3d,1)
	numSelect = dimsize(ProfilesMx3d,2)
	
	if (plotPCheck==1)
		for (idex = 0; idex < Current_pVal; idex += 1)
			wave ProfilesFactorX =  $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactor"+num2istr(idex+1)
			wave ProfilesFactorScaledX =  $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactorScaled"+num2istr(idex+1)
			redimension/n=(numAmu, numSelect) ProfilesFactorX, ProfilesFactorScaledX
			for (selectDex = 0; selectDex < numSelect; selectDex += 1)
				ProfilesFactorX[][selectDex] = ProfilesMx3d[idex][p][selectDex]
				ProfilesFactorScaledX[][selectDex] = ProfilesFactorX[p][selectDex] * var_PMFresultsMx4d[3][idex][selectDex][pdex]		//1.3J  // 1.04A
			endfor
		endfor	
		for (idex = Current_pVal; idex < maxp; idex += 1)
			wave ProfilesFactorX =  $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactor"+num2istr(idex+1)
			wave ProfilesFactorScaledX =  $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactorScaled"+num2istr(idex+1)
			ProfilesFactorX = nan
			ProfilesFactorScaledX=nan
		endfor
	else
		for (idex = 0; idex < maxp; idex += 1)
			wave ProfilesFactorX =  $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactor"+num2istr(idex+1)
			wave ProfilesFactorScaledX =  $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactorScaled"+num2istr(idex+1)
			redimension/n=(numAmu, numSelect) ProfilesFactorX, ProfilesFactorScaledX
			for (selectDex = 0; selectDex < numSelect; selectDex += 1)
				ProfilesFactorX[][selectDex] = ProfilesMx3d[idex][p][selectDex]
//				ProfilesFactorScaledX[][selectDex] = ProfilesFactorX[p][selectDex] * var_PMFresultsMx4d[3][selectdex][p][idex]		//1.3J  // 1.04A
				ProfilesFactorScaledX[][selectDex] = ProfilesFactorX[p][selectDex] * var_PMFresultsMx4d[3][idex][fpeakDex][selectdex]		//2.09A  DTS
			endfor
		endfor	
	endif
End


// makes the time series waves of the loadings from different factors for one species
Function pmf_calc_SpeciesFactorX()

	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	wave p_map = $pmfDFNm + "p_map"
	
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar speciesNumIndex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:speciesNumIndex
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal

	variable idex, nump, maxp, numtseries, numselect, selectDex, ProfileVal
	
	nump = numpnts(p_map)
	maxp = p_map[nump-1]
	
	for (idex = 0; idex < Current_pVal; idex += 1)
		wave ProfileFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactor"+num2istr(idex+1)
		wave TSeriesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:TSeriesFactor"+num2istr(idex+1)
		wave SpeciesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:SpeciesFactor"+num2istr(idex+1)
		numtseries = dimsize(TseriesFactorX,0)
		numselect = dimsize(TseriesFactorX,1)		
		redimension/n=(numtseries, numselect) SpeciesFactorX
		// could also do this using matricies, but this feels cleaner
		for(selectdex=0;selectdex<numselect;selectdex+=1)
			ProfileVal = ProfileFactorX[speciesNumIndex][selectdex]
//			SpeciesFactorX[][numselect] = TSeriesFactorX[p][numselect]*ProfileVal			//DTS 2.0.9A  
			SpeciesFactorX[][selectdex] = TSeriesFactorX[p][selectdex]*ProfileVal
		endfor
	endfor
	
	for (idex = Current_pVal; idex < maxp; idex += 1)
		wave SpeciesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:SpeciesFactor"+num2istr(idex+1)
		SpeciesFactorX =nan
	endfor

End



// updates CurrentQ_pPlot, CurrentQ_fpeakPlot
Function pmf_calc_Qvs()

	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	wave p_map = $pmfDFNm + "p_map"	
	wave fpeak_map = $ pmfDFNm + "fpeak_map"
//	wave Qmx2d = $pmfDFNm + "Qmx2d"	
	wave Qmx2d = root:ACSM:PMF_Exported_Waves:Qmx2d

	wave CurrentQ_pPlot = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentQ_pPlot			// one point wave
	wave CurrentQ_fpeakPlot = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentQ_fpeakPlot 	// one point wave

	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex

	nvar plotFpeakCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotFpeakCheck
	nvar plotpCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotpCheck

	if (plotFpeakCheck!=1 || plotpCheck!=1)		// do only if there is no multiple factor space displays 
		CurrentQ_fpeakPlot=nan
		CurrentQ_pPlot=nan
	else
		setscale/P x, p_map[pdex],1, CurrentQ_pPlot
		CurrentQ_pPlot =  Qmx2d[fpeakdex][pdex]			// value is duplicated, x scaling is not
		setscale/P x, fpeak_map[fpeakdex], 1, CurrentQ_fpeakPlot
		CurrentQ_fpeakPlot = Qmx2d[fpeakdex][pdex]		// value is duplicated, x scaling is not
	endif
	
End



// updates rotMx2d_current, rotMx2d_current_T
Function pmf_calc_RotMx2d()

	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex

	nvar plotpcheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotpcheck
	nvar plotfpeakcheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotfpeakcheck

//	wave rotMx4d = $pmfDFnm+"rotMx4d"
	wave rotMx4d = root:ACSM:PMF_Exported_Waves:rotMx4d
	wave rotMx2d_current = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rotMx2d_current
	wave rotMx2d_current_T = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rotMx2d_current_T

	if (plotpcheck ==1 && plotfpeakcheck==1)
		rotMx2d_current = rotMx4d[p][q][fpeakDex][pDex]	
		MatrixOp/O rotMx2d_current_T = rotMx2d_current^t
	else
		rotMx2d_current_T=nan
	endif
End




// updates variance_Fract_FactorX, variance_Fpeak_FactorX
Function pmf_calc_Variance()	

	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	wave p_map = $pmfDFnm+"p_map"

//	wave var_PMFresultsMx4d = $pmfDFnm+"var_PMFresultsMx4d"
	wave var_PMFresultsMx4d = root:ACSM:PMF_Exported_Waves:var_PMFresultsMx4d

	wave variance_Fract_Residual = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Fract_Residual"
	wave  variance_Fpeak_Residual = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Fpeak_Residual"

	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
	nvar plotpCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotpCheck
	nvar plotfpeakCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotfpeakCheck

	variable idex, maxp, nump
	 
	nump = numpnts(p_map)
 	maxp = p_map[nump-1]

	if (plotpCheck!=1 || plotfpeakCheck!=1)
		for (idex = 0; idex < maxp; idex += 1)	// get mass fraction for all fpeaks
			wave variance_Fract_FactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Fract_Factor"+ num2istr(idex + 1)		// there are 4 types of fractional variance
			wave variance_Fpeak_FactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Fpeak_Factor" + num2istr(idex + 1)	
			variance_Fpeak_FactorX = nan
			variance_Fract_FactorX =nan
		endfor
		wave variance_Fract_Residual = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Fract_Residual"
		wave  variance_Fpeak_Residual = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Fpeak_Residual"
		variance_Fract_Residual = nan
		variance_Fpeak_Residual = nan
		return 0 
	endif	
	
	variance_Fract_Residual =1
	variance_Fpeak_Residual =1
	for (idex = 0; idex < Current_pVal; idex += 1)	// get mass fraction for all fpeaks
		wave variance_Fract_FactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Fract_Factor"+ num2istr(idex + 1)		// there are 4 types of fractional variance
		wave variance_Fpeak_FactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Fpeak_Factor" + num2istr(idex + 1)	
		variance_Fpeak_FactorX = var_PMFresultsMx4d[3][idex][p][pdex]		// always 3rd row, mass fraction
		variance_Fract_FactorX =var_PMFresultsMx4d[p][idex][fpeakdex][pdex]
		variance_Fract_Residual-=variance_Fract_FactorX
		variance_Fpeak_Residual-=variance_Fpeak_FactorX
	endfor

	for (idex = Current_pVal; idex < maxp; idex += 1)	// get mass fraction for all fpeaks
		wave variance_Fract_FactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Fract_Factor"+ num2istr(idex + 1)		// there are 4 types of fractional variance
		wave variance_Fpeak_FactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:variance_Fpeak_Factor" + num2istr(idex + 1)	
		variance_Fpeak_FactorX = nan
		variance_Fract_FactorX =nan
	endfor

	variance_Fract_Residual = selectnumber(abs(variance_Fract_Residual)< 1e-7, variance_Fract_Residual[p], 0)		// round off valuesn //1.04A
	variance_Fpeak_Residual = selectnumber(abs(variance_Fpeak_Residual)< 1e-7, variance_Fpeak_Residual[p], 0)		//1.04A

End





Function pmf_calcFamilyColoredProfiles() // similar to pmf_calc_ProfilesFactorX()

	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm	
	nvar fpeakdex =  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
	nvar plotPCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotPCheck
	wave var_PMFresultsMx4d = $pmfDFNm+"var_PMFresultsMx4d"	
	wave p_map = $pmfDFNm + "p_map"
	wave ProfilesMx3d =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfilesMx3d

	pmf_CopyStringsFromEA2PMF("root:ElementalAnalysisLight:HRspec")
	svar ColDesTxtWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColDesTxtWvNm
 	svar ColDescrWvNm =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColDescrWvNm

	svar WaveToAnalyze_Str = root:ElementalAnalysisLight:WaveToAnalyze_Str	// EA stuff	// HR stick wave tp analyze
//	svar ExactMassText_Str = root:ElementalAnalysisLight:ExactMassText_Str		// EA stuff // chemical formula
//	svar ExactMassWave_Str = root:ElementalAnalysisLight:ExactMassWave_Str	// EA stuff // chemical mass value
//	// we set these constants in  the Elemental List code to match the last set of data analyzed.
	wave/t ExactMassText = $pmfDFnm+ColDesTxtWvNm
	wave ExactMassWave = $pmfDFnm+ColDescrWvNm

//	nvar ColorFamilyUMR= root:pmf_plot_globals:ColorFamilyUMR	    we will always calculate the UMR, the radio button will control whether we plot UMR	

	FUNCREF proto_1Wave1Str EALight_GenerateFamilyMaskWaREF = $"EALight_GenerateFamilyMaskWaves"
	FUNCREF proto_SpecFamilies EALight_calcHRSpectraToFamilREF= $"EALight_calcHRSpectraToFamilies"

	variable idex, nump, maxp, numAmu, numSelect, selectDex, numUMR
	
	nvar/z HROrgExtensionPt = $pmfDFNm+"HROrgExtensionPt"

	if (NVar_exists(HROrgExtensionPt) && HROrgExtensionPt>0)
		numUMR = round(ExactMassWave[HROrgExtensionPt])
	else
		numUMR = round(ExactMassWave[numpnts(ExactMassWave)-1])
	endif
	make/o/n=(numUMR) root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FamilyResults:UnitMass = p+1

	nump =numpnts(p_map)
	maxp =p_map[nump-1]
	numAmu =dimsize(ProfilesMx3d,1)  // could be HR
	numSelect = dimsize(ProfilesMx3d,2)

	NewDataFolder/o root:elementalAnalysisLight:FamilyResults
	make/o/n=(numAmu) root:elementalAnalysisLight:FamilyResults:HRspectra/wave=HRspectra  // not summing to UMR

	EALight_GenerateFamilyMaskWaREF(ExactMassText, DFstr="root:HR:FamilyResults:")

	if (plotPCheck==1)
		for (idex = 0; idex < Current_pVal; idex += 1)
			wave ProfilesFactorX =  $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactor"+num2istr(idex+1)
			pmf_CopyNanRedimFamilySpectra(1, idex+1, rows=numAmu, UMRrows=numUMR, cols=numSelect) // redimension
			for (selectDex = 0; selectDex < numSelect; selectDex += 1)
				ProfilesFactorX[][selectDex] = ProfilesMx3d[idex][p][selectDex]
				HRspectra = ProfilesMx3d[idex][p][selectDex]
				EALight_calcHRSpectraToFamilREF(HRspectra, ExactMassWave, ExactMassText, dfStr_result= "root:elementalAnalysisLight:FamilyResults:", dfStr_mask= "root:HR:FamilyResults:", SumToUMR=1)
				pmf_CopyNanRedimFamilySpectra(-1, idex+1, selectDex=selectDex)  // copy
			endfor
		endfor	
		for (idex = Current_pVal; idex < maxp; idex += 1)
			pmf_CopyNanRedimFamilySpectra(1, idex+1, rows=numAmu, UMRrows=numUMR, cols=numSelect) // redimension
 			pmf_CopyNanRedimFamilySpectra(0, idex+1)  // nan
		endfor
	else
		for (idex = 0; idex < maxp; idex += 1)
			wave ProfilesFactorX =  $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactor"+num2istr(idex+1)
			pmf_CopyNanRedimFamilySpectra(1, idex+1, rows=numAmu, UMRrows=numUMR, cols=numSelect) // redimension
			for (selectDex = 0; selectDex < numSelect; selectDex += 1)
				ProfilesFactorX[][selectDex] = ProfilesMx3d[idex][p][selectDex]
				HRspectra = ProfilesMx3d[idex][p][selectDex]
				EALight_calcHRSpectraToFamilREF(HRspectra, ExactMassWave, ExactMassText, dfStr_result= "root:elementalAnalysisLight:FamilyResults:", dfStr_mask="root:HR:FamilyResults:", SumToUMR=1)
				pmf_CopyNanRedimFamilySpectra(-1, idex+1, selectDex=selectDex)  // copy
			endfor
		endfor	
	endif

	killwaves/z HRspectra
End	





// makes plot of Q vs p_or_FPEAK in the graphDest (panel or window)
// Beginning in 1.3J the fPeak dimension can really be the seed dimension
Function pmf_plot_QvsfpeakOrSeed(graphDest)
	string graphDest
	
	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar Qvs_LogCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Qvs_LogCheck
	nvar CurrentMaxQ_p = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentMaxQ_p
	nvar CurrentDeltaQ_p = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentDeltaQ_p
	nvar CurrentMaxQ_fpeak = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentMaxQ_fpeak
	nvar CurrentDeltaQ_fpeak= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentDeltaQ_fpeak
	
	// get waves
	wave Qmx2d = $pmfDFNm + "Qmx2d"	
	wave p_map = $pmfDFNm + "p_map"	
	wave fpeak_map = $pmfDFNm + "fpeak_map"		// seed values can be in this placeholder
			
	wave Q_min_byP = $pmfDFNm + "Q_min_byP"
	wave Q_min_byFPEAK = $pmfDFNm + "Q_min_byFPEAK"
	
	wave CurrentQ_pPlot = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentQ_pPlot			// one point wave
	wave CurrentQ_fpeakPlot = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentQ_fpeakPlot 	// one point wave
	
	string LegendStr, winTitleStr, winNmStr, graphNm, FullGraphNm
	variable idex

	make/o/n=(DimSize(Qmx2d,0)) tempWave
	tempWave = Qmx2d[p][pdex]
	wavestats/q/m=1 tempWave
	CurrentMaxQ_fpeak = V_max
	CurrentDeltaQ_fpeak = 100*(CurrentMaxQ_fpeak -CurrentQ_fpeakPlot[0])/CurrentMaxQ_fpeak
	killwaves tempWave

	// setup window
	graphNm = "QvsfpeakOrSeed"
	if(stringmatch(graphDest, "panel"))
		FullGraphNm= "pmf_plot_panel#" + graphNm		
		// kill old window
 		gen_kill_subwindow("pmf_plot_panel", graphNm)
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(1090,50,1315,200)/K=1		
	else	// window
		FullGraphNm = "pop_"+ graphNm
		winTitleStr = "Q vs fPeakOrSeed for constant P" 
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm/K=1 as  winTitleStr  // make the new one
	endif
	
	AppendToGraph/W=$FullGraphNm Qmx2d[][pdex] vs fpeak_map
	ModifyGraph/W=$FullGraphNm mode(Qmx2d)=4,marker(Qmx2d)=19
	AppendToGraph/W=$FullGraphNm Q_min_byFPEAK vs fpeak_map
	ModifyGraph/W=$FullGraphNm rgb(Q_min_byFPEAK)=(0,0,0)
	AppendToGraph/W=$FullGraphNm CurrentQ_fpeakPlot
	ModifyGraph/W=$FullGraphNm mode(CurrentQ_fpeakPlot)=3,marker(CurrentQ_fpeakPlot)=8,mrkThick(CurrentQ_fpeakPlot)=3
	ModifyGraph/W=$FullGraphNm msize(CurrentQ_fpeakPlot)=7,rgb(CurrentQ_fpeakPlot)=(65280,43520,0)
	ModifyGraph/W=$FullGraphNm log(left)=Qvs_LogCheck
	Label/W=$FullGraphNm left "Q/Qexpected"
	Label/W=$FullGraphNm bottom  "fPeak or seed"
	LegendStr = "\\s(Qmx2d) Q for p "+num2istr(p_map[pdex])+"\r"
	LegendStr += "\\s(CurrentQ_fpeakPlot) Current Solution\r"	
	LegendStr += "\\s(Q_min_byFPEAK) min Q for fpeakOrSeed"
	Legend/C/N=text0/J/X=-70.00/W=$FullGraphNm LegendStr		

	ModifyGraph grid=2,gridRGB=(34816,34816,34816)		// 1.3J

	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif

End



// makes plot of Qvsp in the graphDest (panel or window)
Function pmf_plot_Qvsp(graphDest)
	string graphDest
	
	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar Qvs_Logcheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Qvs_Logcheck
	nvar Qvs_maxRotMxCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Qvs_maxRotMxCheck
	nvar CurrentMaxQ_p = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentMaxQ_p
	nvar CurrentDeltaQ_p = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentDeltaQ_p
	nvar CurrentMaxQ_fpeak = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentMaxQ_fpeak
	nvar CurrentDeltaQ_fpeak= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentDeltaQ_fpeak
	
	// get waves
	wave Qmx2d = $pmfDFNm + "Qmx2d"	
	wave p_map = $pmfDFNm + "p_map"	
	wave fpeak_map = $pmfDFNm + "fpeak_map"
			
	wave Q_min_byP = $pmfDFNm + "Q_min_byP"
	wave Q_min_byFPEAK = $pmfDFNm + "Q_min_byFPEAK"
	
	wave CurrentQ_pPlot = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentQ_pPlot			// one point wave
	wave CurrentQ_fpeakPlot = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:CurrentQ_fpeakPlot 	// one point wave
	
	nvar/z CalcedSeedOrFpeak = $pmfDFnm+"CalcedSeedOrFpeak"
	if (!NVar_exists(CalcedSeedOrFpeak))
		variable/g $pmfDFnm+"CalcedSeedOrFpeak" = 0
		nvar CalcedSeedOrFpeak = $pmfDFnm+"CalcedSeedOrFpeak"
	endif
		
	string LegendStr, winTitleStr, winNmStr, graphNm, FullGraphNm, seedOrFpeakStr
	variable idex
	
	seedOrFpeakStr = selectString(CalcedSeedOrFpeak, "fPeak", "seed")
	
	// set global variables
	make/o/n=(DimSize(Qmx2d,1)) tempWave
	tempWave = Qmx2d[fpeakdex][p]
	wavestats/q/m=1 tempWave
	CurrentMaxQ_p = V_max
	CurrentDeltaQ_p = 100*(CurrentMaxQ_p -CurrentQ_pPlot[0])/CurrentMaxQ_p
	killwaves tempWave

	// setup window
	graphNm = "Qvsp"
	if(stringmatch(graphDest, "panel"))
		FullGraphNm= "pmf_plot_panel#" + graphNm		
		// kill old window
 		gen_kill_subwindow("pmf_plot_panel", graphNm)
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(846,50,1071,200)/K=1
	else	// window
		FullGraphNm = "pop_"+ graphNm	
		winTitleStr = "Q vs P for constant "+seedOrFpeakStr 
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm/K=1 as  winTitleStr  // make the new one
	endif
	
	// append traces
	AppendToGraph/W=$FullGraphNm Qmx2d[fpeakdex][] vs p_map
	ModifyGraph/W=$FullGraphNm mode(Qmx2d)=4,marker(Qmx2d)=19
	ModifyGraph/W=$FullGraphNm manTick(bottom)={0,1,0,0},manMinor(bottom)={0,50}
	AppendToGraph/W=$FullGraphNm Q_min_byP vs p_map
	ModifyGraph/W=$FullGraphNm rgb(Q_min_byP)=(0,0,0)
	AppendToGraph/W=$FullGraphNm CurrentQ_pPlot		// the x scaling takes care of the x axis setting
	ModifyGraph/W=$FullGraphNm mode(CurrentQ_pPlot)=3,marker(CurrentQ_pPlot)=8,msize(CurrentQ_pPlot)=7;
	ModifyGraph/W=$FullGraphNm mrkThick(CurrentQ_pPlot)=3,rgb(CurrentQ_pPlot)=(65280,43520,0)
	ModifyGraph/W=$FullGraphNm log(left)=Qvs_LogCheck
	Label/W=$FullGraphNm left "Q/Qexpected"
	LegendStr = "\\s(Qmx2d) Q for "+seedOrFpeakStr+" "+num2istr(fpeak_map[fpeakdex])+"\r"
	LegendStr += "\\s(CurrentQ_pPlot) Current Solution\r"
	LegendStr += "\\s(Q_min_byP) min Q for p"
	Legend/C/N=text0/J/X=-70.00/W=$FullGraphNm LegendStr		

	ModifyGraph grid=2,gridRGB=(34816,34816,34816)		// 1.3J
	
	// trying to fix an issue with drawing layers on the panel
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif

End




// makes plots for residuals for selected species at graphDest
Function pmf_plot_reconstOneSpecies(graphDest)  
	string graphDest	
	
	// get global strings for data location, waves
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar DataMxNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:dataMxNm
	svar RowDescrWvNm  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RowDescrWvNm
		
	// get global variables
	nvar plotFpeakCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:PlotFpeakCheck
	nvar fpeakdex  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar SpeciesNumIndex  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:SpeciesNumIndex

	nvar Reconst_showStackedCheck  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Reconst_showStackedCheck

	// access waves	
	wave DataMx = $pmfDFNm+DataMxNm
	wave datetimeWv = $pmfDFNm+RowDescrWvNm
	
	wave fpeakPlot_map =root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakPlot_map
	wave ReconSpeciesFpeaks = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ReconSpeciesFpeaks
	wave ResidSpeciesFpeaks = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidSpeciesFpeaks
	wave QcontrSpeciesFpeaks = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:QcontrSpeciesFpeaks  //imu2.04
	
	// local variables and strings
	variable jdex, layercount, selectdex, numselect
	string graphNm,FullGraphNm, winTitleStr, LegendStr

	setDataFolder root:pmf_plot_globals
	
	// setup window
	graphNm ="reconstOneSpecies"   // depends on species Num
	if(stringmatch(graphDest, "panel"))
		FullGraphNm = "pmf_plot_panel#"+graphNm	
		// clear the old graph, if it exists
 		gen_kill_subwindow("pmf_plot_panel", graphNm)		
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(670,239,985,407)/K=1
	else	// window
		FullGraphNm = "pop_"+graphNm
		winTitleStr = "Reconst, Measured for Current Species" 

		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FulLGraphNm/K=1 as  winTitleStr  // make the new one		
	endif	
	
	LegendStr   = "\\s("+ DataMxNm +") Measured Spec tseries\r"

	// put measured trace on plot -- only goes on once, no dependence on PlotFpeakCheck
	AppendToGraph/W=$FullGraphNm/L=left DataMx[][SpeciesNumIndex] vs datetimeWv
	ModifyGraph/W=$FullGraphNm rgb($DataMxNm)=(51456,44032,58880), mode($DataMxNm)=3
	ModifyGraph/W=$FullGraphNm marker($DataMxNm)=19,msize($DataMxNm)=2

	// put reconstructed and residuals on plot
 	numselect = dimsize(ReconSpeciesFpeaks,1)
 	for(selectdex = 0; selectdex < numselect; selectdex += 1)
		AppendToGraph/W=$FullGraphNm/R=right QcontrSpeciesFpeaks[][selectdex] vs datetimeWv   //imu2.04
		AppendToGraph/W=$FullGraphNm/L=left2 ResidSpeciesFpeaks[][selectdex]  vs datetimeWv
		AppendToGraph/W=$FullGraphNm/L=left ReconSpeciesFpeaks[][selectdex]  vs datetimeWv
	endfor	
	
	pmf_colorize_tracesSameName(FullGraphNm, "ReconSpeciesFpeaks")
	pmf_colorize_tracesSameName(FullGraphNm, "ResidSpeciesFpeaks")
//	pmf_colorize_tracesSameName(FullGraphNm, "QcontrSpeciesFpeaks") //imu2.04
	LegendStr  += "\\s(ReconSpeciesFpeaks) Reconst\r"
	LegendStr  += "\\s(ResidSpeciesFpeaks) Residual\r"	
	LegendStr += "\\s(QcontrSpeciesFpeaks) Scaled Residual" //imu2.04
	Legend/W=$FullGraphNm/C/N=text0/J/X=-40.00 LegendStr

	// axis sizes and labels
	ModifyGraph/W=$FullGraphNm axisEnab(left2)={0,0.45}, axisEnab(left)={0.5,0.98}, axisEnab(right)={0,0.45}
	ModifyGraph/W=$FullGraphNm freePos(left2)=0, zero(left2)=1,zero(left2)=1
	ModifyGraph/W=$FullGraphNm lblPos(left2)=70
	SetAxis/W=$FullGraphNm/A/E=2 left2	
	SetAxis/W=$FullGraphNm/A/E=2 right
	Label/W=$FullGraphNm left2 "Residuals"
	Label/W=$FullGraphNm left "Mass"
	Label/W=$FullGraphNm right "Scaled Resid."  //imu2.04
	ModifyGraph/W=$FullGraphNm zero(left)=1
	ModifyGraph/W=$FullGraphNm msize(QcontrSpeciesFpeaks)=1, mode(QcontrSpeciesFpeaks)=3    //imu2.04
	ModifyGraph/W=$FullGraphNm marker(QcontrSpeciesFpeaks) = 5
	//imu2.03 SetAxis left 0,*		
	//imu2.03 set left axis min to 0 or the lowest value, whichever is lower
	WaveStats/q/m=1/R=[SpeciesNumIndex*dimsize(DataMx,0), SpeciesNumIndex*dimsize(DataMx,0)+dimsize(DataMx,0)-1] DataMx
	if(V_min > 0)
		SetAxis/W=$FullGraphNm left 0, *
	else
		SetAxis/W=$FullGraphNm left v_min, *
	endif
		
	ModifyGraph grid(left)=2, grid(left2)=2 ,gridRGB=(34816,34816,34816)		// 1.3J

	// trying to fix an issue with drawing layers on the panel
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif

End


// makes the plot for the 4 stacked plots of residual time series 
Function pmf_plot_residualRatios(graphdest)  
	string graphdest
	
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar RowDescrWvNm  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RowDescrWvNm
	svar ColDesTxtWvNm  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColDesTxtWvNm
	svar ColDescrWvNm  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColDescrWvNm
	
	svar ResidualRatios_Str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualRatios_Str
	svar diurnalType = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnalType
		
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal

	gen_initializeGlobalNVar("root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rotateTextLabels", 0)		// 2.02
	nvar rotateTextLabels = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:rotateTextLabels

	string ThisResidSumMxNm, ThisTraceNm, FullGraphNm, LegendStr, graphNm, residList, residStr, axisName, idexStr
	variable idex, jdex, selectdex, numselect
	
	graphNm ="ResidualRatios"
	if(stringmatch(graphDest, "panel"))	
		FullGraphNm =  "pmf_plot_panel#"+graphNm
		// clear the old graph, if it exists
		gen_kill_subwindow("pmf_plot_panel",graphNm)		
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(999,444,1314,817)/K=1
	else	// window
		FullGraphNm =  "pop_"+graphNm
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/W=(60,60,400,450)/N=$FullGraphNm /K=1 as "Total residuals (=meas -reconst), ratios for all Species"   // make the new one		
	endif

	residList = ";Abs;Ratio;AbsRat;RatVar;" 		//2.00A  order is important!!

	if (stringMatch(ResidualRatios_Str, "diurnal"))		// 2.00A
	
		// get x wave for this diurnalType
		strswitch(diurnalType)
		//2.09A  DTS added a /z to the TimeXWv designation
			case "diurnal":
				wave/z TimeXWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnalHours
				wave/T/z TimeXtxtWv = $""
				break
			case "month":
				wave/z TimeXWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:monthVals
				wave/T/z TimeXtxtWv = $""
				break
			case "dayOfWeek":
				wave/z TimeXWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:dayOfWeekVals
				wave/T/z TimeXtxtWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:dayOfWeekNms
				break
			case "WeekDayEnd":
				wave/z TimeXWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:WeekDayEndVals
				wave/T/z TimeXtxtWv = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:WeekDayEndNms
				break
		endswitch

		idexStr = num2istr(Current_pVal)
		wave ResidualMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualTseriesMx			// we need this only to get size of select dimension		
		numselect = dimsize(ResidualMx,1)
		for(selectdex=0;selectdex<numselect;selectdex+=1)
		
			for(idex=0;idex<5;idex+=1)
				residStr = stringfromlist(idex, residlist)
				wave diurnalMedian_ResX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:Median_Res" +residStr+ "_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalP0_ResX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P0_Res" + residStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalP25_ResX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P25_Res" +residStr+ "_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalP75_ResX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P75_Res" + residStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
				wave diurnalP100_ResX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:diurnals:P100_Res" + residStr+"_"+diurnalType+"_f"+num2istr(selectdex)			
			
				axisname = "left"+num2istr(idex)
				gen_fBoxPlot_graphAxNm(diurnalMedian_ResX, diurnalP75_ResX, diurnalP25_ResX, diurnalP100_ResX, diurnalP0_ResX, TimeXWv, 0.3, 0, $"", $"", 0, 0, 0,FullGraphNm, axisname)
				
				pmf_colorize_1trace(FullGraphNm, selectdex,"Median_Res"+residStr+ idexStr+"_f"+num2istr(selectdex))
				pmf_colorize_1trace(FullGraphNm, selectdex,"P0_Res"+ residStr+ idexStr+"_f"+num2istr(selectdex))
				pmf_colorize_1trace(FullGraphNm, selectdex,"P25_Res"+ residStr+ idexStr+"_f"+num2istr(selectdex))
				pmf_colorize_1trace(FullGraphNm, selectdex,"P75_Res"+ residStr+ idexStr+"_f"+num2istr(selectdex))
				pmf_colorize_1trace(FullGraphNm, selectdex,"P100_Res"+ residStr+ idexStr+"_f"+num2istr(selectdex))
				ModifyGraph freePos($axisname)={0,bottom}
			endfor
			
			//imu2.05
			//if dayOfWeek or WeekDayEnd, do userTicks with text wave
			if(waveExists(TimeXtxtWv))
				ModifyGraph/W=$FullGraphNm userticks(bottom)={TimeXWv,TimeXtxtWv}
			endif

			
		endfor
		LegendStr = ""

	else
		if (stringMatch(ResidualRatios_Str, "tseries"))
			wave xWv = $pmfDFNm+RowDescrWvNm
			wave ResidualMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualTseriesMx			
			wave ResidualAbsMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualTseriesAbsMx			
			wave ResidualRatioMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualTseriesRatioMx			
			wave ResidualAbsRatioMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualTseriesAbsRatioMx			
			wave ResidualRatioVarianceMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualTseriesRatioVarianceMx			
		else		// profiles
			wave xWv = $pmfDFNm+ColDescrWvNm
			wave ResidualMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualProfilesMx			
			wave ResidualAbsMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualProfilesAbsMx			
			wave ResidualRatioMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualProfilesRatioMx			
			wave ResidualAbsRatioMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualProfilesAbsRatioMx			
			wave ResidualRatioVarianceMx = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ResidualProfilesRatioVarianceMx			
		endif
		
		numselect = dimsize(ResidualMx,1)
		
		for(selectdex= 0; selectdex < numselect; selectdex += 1)
	
			// Total Residuals, TotalResid/TotalSignal, and TotalResid/TotalVariance
			AppendToGraph/W=$FullGraphNm/L=left0 ResidualMx[][selectdex] vs xWv
			LegendStr = "\\s(" + NameofWave(ResidualMx) +") Total Residual\r"
	
			// Total(Abs Resid)
			AppendToGraph/W=$FullGraphNm/L=left1 ResidualAbsMx[][selectdex]  vs xWv
			LegendStr += "\\s(" + NameofWave(ResidualAbsMx) +") Total abs(Residual)\r"
		
			// Total Resid/TotalSignal
			AppendToGraph/W=$FullGraphNm/L=left2 ResidualRatioMx[][selectdex] vs xWv
			LegendStr += "\\s(" + NameofWave(ResidualRatioMx) +") Total Residual/Total \r"
	
			// Total(Abs Resid)/TotalSignal
			AppendToGraph/W=$FullGraphNm/L=left3 ResidualAbsRatioMx[][selectdex] vs xWv
			LegendStr += "\\s(" + NameofWave(ResidualAbsRatioMx) +") Total abs(Residual)/Total \r"
	
			// TotalResid/TotalVariance
			AppendToGraph/W=$FullGraphNm/L=left4 ResidualRatioVarianceMx[][selectdex] vs xWv
			LegendStr += "\\s(" + NameofWave(ResidualRatioVarianceMx) +") Total Residual/Total Variance/Q\Bexp\M"  //imu2.03 added /Qexp 
	
		endfor
		
		pmf_colorize_tracesSameName(FullGraphNm, NameofWave(ResidualMx))
		pmf_colorize_tracesSameName(FullGraphNm, NameofWave(ResidualAbsMx))
		pmf_colorize_tracesSameName(FullGraphNm, NameofWave(ResidualRatioMx))
		pmf_colorize_tracesSameName(FullGraphNm, NameofWave(ResidualAbsRatioMx))
		pmf_colorize_tracesSameName(FullGraphNm, NameofWave(ResidualRatioVarianceMx))

	endif
	
	// axis sizes and labels
	ModifyGraph/W=$FullGraphNm axisEnab(left0)={0.81,0.99},freePos(left0)=0
	Label/W=$FullGraphNm left0 "\F'Symbol'S\F'Arial' Resid"

	ModifyGraph/W=$FullGraphNm axisEnab(left1)={0.61,0.79},freePos(left1)=0
	Label/W=$FullGraphNm left1 "\F'Symbol'S\F'Arial' Abs(Resid)"
	
	ModifyGraph/W=$FullGraphNm axisEnab(left2)={0.41,0.59}, freePos(left2)=0
	Label/W=$FullGraphNm left2 "\F'Symbol'S\F'Arial' Resid/\F'Symbol'S\F'Arial'Total "

	ModifyGraph/W=$FullGraphNm axisEnab(left3)={0.21,0.39}, freePos(left3)=0
	Label/W=$FullGraphNm left3 "\F'Symbol'S\F'Arial' abs(Resid)/\F'Symbol'S\F'Arial'Total "
	
	ModifyGraph/W=$FullGraphNm axisEnab(left4)={0,0.19}, freePos(left4)=0
	Label/W=$FullGraphNm left4 "\\F'Symbol'S\\F'Arial' (Resid\\S2\\M/\\F'Symbol's\\F'Arial'\\S2\\M)/Q\Bexp\M" //imu2.03 added /Qexp

	// zero lines, label positions, autoscale from zero
	ModifyGraph/W=$FullGraphNm zero(left0)=1,zero(left1)=1,zero(left2)=1,zero(left3)=1,zero(left4)=1
	ModifyGraph/W=$FullGraphNm lblPos(left0)=50,lblPos(left1)=72,lblPos(left2)=50,lblPos(left3)=72,lblPos(left4)=50
	ModifyGraph/W=$FullGraphNm lblLatPos(left2)=-15, lblLatPos(left4)=20
	//imu2.05  updated axis scaling for resid
	SetAxis/W=$FullGraphNm/A/E=3 left0
	SetAxis/W=$FullGraphNm/A/E=3 left2
	SetAxis/W=$FullGraphNm/A/E=3 left3
	SetAxis/W=$FullGraphNm/A/E=1 left1
	SetAxis/W=$FullGraphNm/A/E=1 left4
	
	//imu2.03 bottom axis range and left axis crossing
	ModifyGraph/W=$FullGraphNm freePos(left0)={0,bottom},freePos(left1)={0,bottom},freePos(left2)={0,bottom}	
	ModifyGraph/W=$FullGraphNm freePos(left3)={0,bottom},freePos(left4)={0,bottom}
	ModifyGraph/W=$FullGraphNm axisEnab(bottom)={0.1,1}

//imu2.05  moved ModifyGraph line to "profile" case
//	if(!StringMatch(ResidualRatios_Str, "tseries"))	// t series
//		ModifyGraph/W=$FullGraphNm mode=1
//	endif
	if (stringmatch(ResidualRatios_Str, "profiles") )
		ModifyGraph/W=$FullGraphNm mode=1
		if (rotateTextLabels)
			wave ColDescrWv = $(pmfDFNm+ColDescrWvNm)
			wave/t ColDescrTxtWv = $(pmfDFNm+ColDesTxtWvNm)
			ModifyGraph/W=$FullGraphNm tkLblRot(bottom)=90,userticks(bottom)={ColDescrWv,ColDescrTxtWv}, fSize(bottom)=8
		else
			ModifyGraph/W=$FullGraphNm tkLblRot=0,userticks(bottom)=0, fSize(bottom)=12
		endif
	endif
		
	Legend/W=$FullGraphNm/C/N=text0/J/X=-85.00 LegendStr

	ModifyGraph grid=2,gridRGB=(34816,34816,34816)		// 1.3J
	// trying to fix an issue with drawing layers on the panel
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif

End




// make the plots of scaled residuals for histogram or box plot
Function pmf_plot_ScaResidAllSpeciesHist(graphDest)
	string graphDest

	wave ScaResid_HistImageDisplay = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResid_HistImageDisplay
	wave SpeciesDescrWv1 = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:SpeciesDescrWv1

	svar ScaResidAllSpecies_Str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResidAllSpecies_Str
	nvar ScaResidAllSpecies_MinMaxCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResidAllSpecies_MinMaxCheck
	
	variable idex, tempMin, tempMax
	string graphNm, FullGraphNm
	
	// setup window
	 graphNm = "ScaResidAllSpecies"
	if(stringmatch(graphDest, "panel"))
		FullGraphNm = "pmf_plot_panel#"+graphNm
		// clear the old graph, if it exists
		gen_kill_subwindow("pmf_plot_panel", graphNm)
		
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(12,444,656,612)/K=1
	else	// window
		FullGraphNm = "pop_"+graphNm
		string winTitleStr = "Scaled Residual All Species"

		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm/K=1 as  winTitleStr  // make the new one
	endif
	
	AppendImage/W=$FullGraphNm ScaResid_HistImageDisplay vs {SpeciesDescrWv1,*}
	ModifyImage/W=$FullGraphNm ScaResid_HistImageDisplay ctab= {1e-06,*,Rainbow,1}
	ModifyImage/W=$FullGraphNm ScaResid_HistImageDisplay minRGB=(65535,65535,65535),maxRGB=0
	ModifyGraph/W=$FullGraphNm zero(left)=1
	ModifyGraph/W=$FullGraphNm minor(bottom)=1
	Label/W=$FullGraphNm left "Mass"

	if (ScaResidAllSpecies_MinMaxCheck>0)
		tempMin = DimOffset(ScaResid_HistImageDisplay,1)
		tempMax = tempMin + DimSize(ScaResid_HistImageDisplay,1) * DimDelta(ScaResid_HistImageDisplay,1)
		SetAxis/W=$FullGraphNm left .01*ScaResidAllSpecies_MinMaxCheck*tempmin, .01*ScaResidAllSpecies_MinMaxCheck*tempmax 
	endif

	ModifyGraph grid=2,gridRGB=(34816,34816,34816)		// 1.3J
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif
	
	pmf_check_rotateTextLabels(FullGraphNm,nan) 		//2.02

End



// make the plots of scaled residuals - use ScaResidAllSpecies_Str to determine what is plotted
Function pmf_plot_ScaResidAllSpecies(graphDest)
string graphDest
	
	svar ScaResidAllSpecies_Str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResidAllSpecies_Str

	if (stringmatch(ScaResidAllSpecies_Str, "boxplot"))
		pmf_plot_ScaResidAllSpeciesBox(graphDest)
	else
		pmf_plot_ScaResidAllSpeciesHist(graphDest)
	endif
	
End



// makes the RR plot
Function pmf_plot_RvsR(graphdest)  	
	string graphdest

	// access waves	
	wave/t RR_IDtag = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_IDtag
	nvar current_Pval = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:current_Pval
	svar RvsR_Str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RvsR_Str		//1.04A 
		
	// local variables
	string graphNm, FullGraphNm, RR_profiles_Nm, RR_tseries_Nm
	variable counter, numRR
	
	if (stringmatch(RvsR_Str, "uncentered") )
		wave RR_profiles = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_profiles_UC
		wave RR_tseries = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_tseries_UC
	else
		wave RR_profiles = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_profiles
		wave RR_tseries = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_tseries
	endif
	
	numRR = numpnts(RR_IDtag)
	graphNm= "RVSR"  
	if(stringmatch(graphDest, "panel"))
		FullGraphNm = "pmf_plot_panel#" + graphNm
		// clear the old graph, if it exists
		gen_kill_subwindow("pmf_plot_panel", graphNm)		
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(16,670,318,816)/K=1
	else	// window
		FullGraphNm = "pop_"+graphNm
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm/K=1 as graphNm  // make the new one		
	endif

	if (current_Pval==1)
		return 0
	endif
	
	SetDataFolder root:ACSM:PMF_Exported_Waves:pmf_plot_globals:
	for (counter = 0; counter < numRR; counter +=1)
		if (stringmatch(RvsR_Str, "uncentered") )
			RR_profiles_Nm = "RR_profiles"+RR_IDtag[counter]+"AllFpeak_UC"
			RR_tseries_Nm  = "RR_tseries"+RR_IDtag[counter]+"AllFpeak_UC"
		else
			RR_profiles_Nm = "RR_profiles"+RR_IDtag[counter]+"AllFpeak"
			RR_tseries_Nm  = "RR_tseries"+RR_IDtag[counter]+"AllFpeak"
		//imu switched plotting order -- I started doing it ts vs ms for the paper and want it to be consistent
		endif
		AppendToGraph/W=$FullGraphNm $RR_tseries_Nm vs $RR_profiles_Nm
		//imu and hand to change profiles to tseries in trace names for 
		ModifyGraph mode($RR_tseries_Nm)=4
		ModifyGraph marker($RR_tseries_Nm)=19
		ModifyGraph msize($RR_tseries_Nm)=2
	endfor
	//imu and this tracename
	pmf_colorize_tracesSameName(FullGraphNm ,NameofWave($RR_tseries_Nm))

	//imu and switched order here	
	AppendToGraph/W=$FullGraphNm RR_tseries vs RR_profiles	// one for points, one for labels
	AppendToGraph/W=$FullGraphNm RR_tseries vs RR_profiles

	ModifyGraph/W=$FullGraphNm msize($NameofWave(RR_tseries)#1)=3	
	ModifyGraph/W=$FullGraphNm rgb($NameofWave(RR_tseries)#1)=(0,0,0)
	ModifyGraph/W=$FullGraphNm mode($NameofWave(RR_tseries)#1)=3,marker($NameofWave(RR_tseries)#1)=19
	ModifyGraph/W=$FullGraphNm mode($NameofWave(RR_tseries))=3,msize($NameofWave(RR_tseries))=3
	ModifyGraph/W=$FullGraphNm textMarker($NameofWave(RR_tseries))={root:ACSM:PMF_Exported_Waves:pmf_plot_globals:RR_IDtag,"default",1,0,9,0.00,0.00}
		
	ModifyGraph/W=$FullGraphNm grid=2, gridRGB=(34816,34816,34816)

	//imu and switched order here
	Label/W=$FullGraphNm bottom "R, profiles"
	Label/W=$FullGraphNm left "R, tseries"
	
	//imu add zero lines to both axes
	ModifyGraph/W=$FullGraphNm zero=1


	//imu2.05 fixing axes
	//imu2.03 fixing axes
	doUpdate
	getAxis/W=$FullGraphNm/Q left
	
	if(V_min >= 0)
		SetAxis/W=$FullGraphNm left 0, 1
	else
		SetAxis/W=$FullGraphNm left v_min, 1
	endif
	
	getAxis/W=$FullGraphNm/Q bottom
	if(V_min >= 0)
		SetAxis/W=$FullGraphNm bottom 0, 1
	else
		SetAxis/W=$FullGraphNm bottom v_min, 1
	endif

	// trying to fix an issue with drawing layers on the panel
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif

End


Function pmf_button_pop_ColorFamilyPlot(ctrlName) : ButtonControl
	string ctrlName

	pmf_plot_ColorFamily("window")	

	ShowInfo

End



// creates/updates the FactorProfile plot
Function pmf_plot_ColorFamily(graphDest)
	string graphDest
	
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar ColDescrWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColDescrWvNm
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar FactNum= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:factNum
	nvar FullHeight = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FullHeight
	nvar FactorProfile_LogCheck= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorProfile_LogCheck
	nvar plotpcheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotpcheck	
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
	wave ColDescrWv = $pmfDFNm+ColDescrWvNm	
	wave p_map = $pmfDFNm+"p_map"
		
	nvar/z dataTypeHR = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:dataTypeHR  //3.08C

	wave/z ElemRatios_HC_3d = $pmfDFnm+"ElemRatios_HC_3d"
	if ( !Nvar_exists(dataTypeHR) && !WaveExists(ElemRatios_HC_3d))	 //3.08C	// 2.08   Presume if one exists they all do.
		return 0
	endif

	FUNCREF proto_EALight_plot_FamilySpec EALight_plot_FamilySpecREF=$"EALight_plot_FamilySpec"  //3.08C

	nvar ColorFamilyUMR = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColorFamilyUMR

	// local variables
	string graphNm, FullGraphNm, winTitleStr, AxList, axisName
	variable idex,jdex, LeftAnchor, TopAnchor, SelectDex, numSelect, ScalarVar, solutionSpaceVar, maxp

	if (FactNum>Current_pVal)
		print "// The currently selected factor doesn't exist because the currently selected number of factors is less than the factor."
	endif

	maxp = p_map[numpnts(p_map)-1]
	
	wave ProfileFactorMx = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactor1"
	numSelect = dimsize(ProfileFactorMx,1) //sum(fpeakplot_map)
	
	// setup window
	graphNm = "FamilyColored"
	if(stringmatch(graphDest, "panel"))
		graphNm = "FamilyColored"
		FullGraphNm = "pmf_plot_panel#"+graphNm
		// kill old window
		gen_kill_subwindow("pmf_plot_panel", graphNm)	
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(580,640,980,815)/K=1
	else	// (stringmatch(graphDest, "Window"))
		FullGraphNm = "pop_"+graphNm
		winTitleStr = "FamilyColored Factor Profile" 
		
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm as  winTitleStr  // make the new one
//		controlbar/t 25
	endif

	string pmfdfStr = "root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FamilyResults:"

    ///// PLOTTING
	// 3 cases for profiles: plot one factor, or all on separate axes, or all on same
// particular factor
	if (factnum>0)	// selected a particular factor
		// multiple fpeaks?
//		wave ProfileFactorMx = $pmfdfStr+NameRoot+num2istr(factnum)
		if(numSelect == 1) // current fpeak only
 			EALight_plot_FamilySpecREF("ProfileFactor"+num2istr(factnum),  dfStr_result=pmfdfStr, dfStr_mask="root:HR:FamilyResults:", stackedFlag=1, HRflag=!ColorFamilyUMR, plotName=FullGraphNm, colVal=0)
 		else // color axes by fpeak
			for(selectDex=0;selectDex<numselect;selectDex+=1)	
				axisName = "left_" + num2istr(selectDex) 
				EALight_plot_FamilySpecREF("ProfileFactor"+num2istr(factnum),  dfStr_result=pmfdfStr, dfStr_mask="root:HR:FamilyResults:", stackedFlag=1, HRflag=!ColorFamilyUMR, plotName=FullGraphNm, colVal=selectDex, idexAxis=selectDex, NumAxes =numselect)
			endfor
		endif

// factors on own axes	
	else	// all factors
	// make factors on own plots (never all on one plot, as in tseries plots)		
		if (plotpcheck==1)
			maxp = Current_pVal
		endif
		if(numSelect != 1) // current fpeak only, show ordered color
			print "// Cannot display family colored spectra plots with multiple factors and multiple fpeaks at this time."
		else
			for(idex=0;idex<maxp;idex+=1)
				EALight_plot_FamilySpecREF("ProfileFactor"+num2istr(idex+1), dfStr_result=pmfdfStr, dfStr_mask="root:HR:FamilyResults:", stackedFlag=1, HRflag=!ColorFamilyUMR, plotName=FullGraphNm, colVal=0, idexAxis = idex, NumAxes=maxp)
			endfor
		endif
	endif

	// trying to fix an issue with drawing layers on the panel
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif	

End



// creates/updates the FactorProfile plot
Function pmf_plot_ElemRatio(graphDest)
	string graphDest
	
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar ColDescrWvNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColDescrWvNm
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex
	nvar FactNum= root:ACSM:PMF_Exported_Waves:pmf_plot_globals:factNum
	nvar FullHeight = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FullHeight
	nvar plotpcheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:plotpcheck	
//	nvar FactorProfile_LogCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FactorProfile_LogCheck	
	nvar Current_pVal = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:Current_pVal
	wave ColDescrWv = $pmfDFNm+ColDescrWvNm	
	wave p_map = $pmfDFNm+"p_map"
		
	wave/z ElemRatios_HC_3d = $pmfDFnm+"ElemRatios_HC_3d"
	if (!WaveExists(ElemRatios_HC_3d))		// 2.08   Presume if one exists they all do.
		return 0
	endif

	// local variables
	string graphNm, FullGraphNm, winTitleStr, AxList, axisName
	variable idex,jdex, LeftAnchor, TopAnchor, SelectDex, numSelect, ScalarVar, solutionSpaceVar, maxp

	if (FactNum>Current_pVal)
		print "// The currently selected factor doesn't exist because the currently selected number of factors is less than the factor."
	endif

	maxp = p_map[numpnts(p_map)-1]
	
 	wave/z ElemRatios_HC_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemRatios_HC_2d				// dts2.08
 	wave/z ElemRatios_OC_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemRatios_OC_2d				// dts2.08
 	wave/z ElemRatios_NC_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemRatios_NC_2d				// dts2.08
 	wave/z ElemRatios_SC_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemRatios_SC_2d				// dts2.08
 	wave/z ElemRatios_OMOC_2d = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemRatios_OMOC_2d				// dts2.08
 	wave/z ElemRatio_FactorX = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ElemRatio_FactorX				// dts2.08

	numSelect = dimsize(ElemRatios_HC_2d,1)// could use any
	
	// setup window
	graphNm = "EARatio"
	if(stringmatch(graphDest, "panel"))
		graphNm = "EARatio"
		FullGraphNm = "pmf_plot_panel#"+graphNm
		// kill old window
		gen_kill_subwindow("pmf_plot_panel", graphNm)	
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(344,655,561,813)/K=1

	else	// (stringmatch(graphDest, "Window"))
		FullGraphNm = "pop_"+graphNm
		winTitleStr = "Estimated Elemental Ratios" 		
		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm as  winTitleStr  // make the new one
		ControlBar 22
		CheckBox check_OC,pos={135,5},size={38,14},proc=pmf_ElemRatiosShowCheckProc,title="O/C"
		CheckBox check_OC,value= 1
		CheckBox check_HC,pos={85,5},size={38,14},proc=pmf_ElemRatiosShowCheckProc,title="H/C"
		CheckBox check_HC,value= 1
		CheckBox check_NC,pos={185,5},size={38,14},proc=pmf_ElemRatiosShowCheckProc,title="N/C"
		CheckBox check_NC,value= 1
		CheckBox check_SC,pos={235,5},size={37,14},proc=pmf_ElemRatiosShowCheckProc,title="S/C"
		CheckBox check_SC,value= 1
		CheckBox check_OMOC,pos={286,5},size={55,14},proc=pmf_ElemRatiosShowCheckProc,title="OM/OC"
		CheckBox check_OMOC,value= 1
		TitleBox title0,pos={5,5},size={75,13},title="Show estimated",frame=0
	endif

    ///// PLOTTING
	// 3 cases for profiles: plot one factor, or all on separate axes, or all on same
// particular factor
	for(SelectDex = 0; SelectDex < numSelect; SelectDex += 1)
		AppendtoGraph/W=$FullGraphNm ElemRatios_HC_2d[][SelectDex] vs ElemRatio_FactorX
		AppendtoGraph/W=$FullGraphNm ElemRatios_OC_2d[][SelectDex] vs ElemRatio_FactorX
		AppendtoGraph/W=$FullGraphNm ElemRatios_NC_2d[][SelectDex] vs ElemRatio_FactorX
		AppendtoGraph/W=$FullGraphNm ElemRatios_SC_2d[][SelectDex] vs ElemRatio_FactorX
		AppendtoGraph/W=$FullGraphNm ElemRatios_OMOC_2d[][SelectDex] vs ElemRatio_FactorX
		ModifyGraph mode=4
		if (SelectDex==0)
			ModifyGraph/W=$FullGraphNm marker(ElemRatios_HC_2d)=7
			ModifyGraph/W=$FullGraphNm marker(ElemRatios_OC_2d)=5
			ModifyGraph/W=$FullGraphNm marker(ElemRatios_NC_2d)=28
			ModifyGraph/W=$FullGraphNm marker(ElemRatios_SC_2d)=25
			ModifyGraph/W=$FullGraphNm marker(ElemRatios_OMOC_2d)=8
		else
			ModifyGraph/W=$FullGraphNm marker($"ElemRatios_HC_2d#"+num2istr(SelectDex))=7
			ModifyGraph/W=$FullGraphNm marker($"ElemRatios_OC_2d#"+num2istr(SelectDex))=5
			ModifyGraph/W=$FullGraphNm marker($"ElemRatios_NC_2d#"+num2istr(SelectDex))=28
			ModifyGraph/W=$FullGraphNm marker($"ElemRatios_SC_2d#"+num2istr(SelectDex))=25
			ModifyGraph/W=$FullGraphNm marker($"ElemRatios_OMOC_2d#"+num2istr(SelectDex))=8
		endif
		
		if(numSelect == 1)   // Use elemental colors
			ModifyGraph/W=$FullGraphNm rgb(ElemRatios_HC_2d)=(39168,26112,0),rgb(ElemRatios_NC_2d)=(0,0,65280), rgb(ElemRatios_OMOC_2d)=(0,0,0),rgb(ElemRatios_SC_2d)=(36864,14592,58880)
 		else // color by fpeak
			pmf_colorize_tracesSameName(FullGraphNm, "ElemRatios_HC_2d")
			pmf_colorize_tracesSameName(FullGraphNm, "ElemRatios_OC_2d")
			pmf_colorize_tracesSameName(FullGraphNm, "ElemRatios_NC_2d")
			pmf_colorize_tracesSameName(FullGraphNm, "ElemRatios_SC_2d")
			pmf_colorize_tracesSameName(FullGraphNm, "ElemRatios_OMOC_2d")
		endif
	endfor
//	SetAxis left 0,2.5
	pmf_updateElemRatiosShowCheck()
	
	ModifyGraph/W=$FullGraphNm mrkThick=1.5
	ModifyGraph/W=$FullGraphNm msize=3
	ModifyGraph/W=$FullGraphNm grid=2
	ModifyGraph/W=$FullGraphNm zero(left)=1
	ModifyGraph/W=$FullGraphNm gridRGB=(34816,34816,34816)
	Label/W=$FullGraphNm left "Est. Elemental Ratios"	// estimated because we don't know if they used isotopes, or added other ions like NO, etc.
	Label/W=$FullGraphNm bottom "Factor #"
	SetAxis/W=$FullGraphNm/A/E=3 left
	Textbox/W=$FullGraphNm/Ct/N=Leg/X=-5/Y=10 "Estimated\r\\s(ElemRatios_HC_2d) H/C\r\\s(ElemRatios_OC_2d) O/C\r\\s(ElemRatios_NC_2d) N/C\r\\s(ElemRatios_SC_2d) S/C\r\\s(ElemRatios_OMOC_2d) OM/OC"

End



// make graph backgrounds grey for no convergence or error
Function pmf_plot_convergence()

	// get globals
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	nvar fpeakdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:fpeakdex
	nvar pdex = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pdex

	// access waves
	wave ConvergenceMx2d = $pmfDFNm+"ConvergenceMx2d"

	string ChildList, thisChild
	variable idex, ndex, RGBnum

	if(ConvergenceMx2d[fpeakdex][pdex] == 1) // converged, make white backgrounds
		RGBnum = 65535
	else  //(ConvergenceMx2d[fpeakdex][pdex] != 1) // didn't converge or error
		RGBnum = 56576
	endif
	
	ChildList = ChildWindowList("pmf_plot_panel")	
	ndex= itemsinlist(childList)
	for(idex = 0;idex < ndex; idex += 1)
		thisChild = stringfromlist(idex, childList)
		ModifyGraph/W=pmf_plot_panel#$thisChild gbRGB=(RGBnum,RGBnum,RGBnum),wbRGB=(RGBnum,RGBnum,RGBnum)
	endfor
	
End


///////////////////////////////////////////////////////////////////////////////////////
// ScatterPanel gridding basis
Function scat_ScatterPanel_TopAnchor(FactorNum)
	variable FactorNum
	
	return(300*mod(FactorNum,3))

End



///////////////////////////////////////////////////////////////////////////////////////
// ScatterPanel gridding basis and make panel wide enough
Function scat_ScatterPanel_LeftAnchor(FactorNum)
	variable FactorNum

	return(floor(FactorNum/3) * 424)

End



Function pmfCalcs_R_PMFvsPMFmx3d_fpeaks()
	
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_calc_globals:pmfDFNm

	wave p_map = $pmfDFNm + "p_map"
	wave fpeak_map = $pmfDFNm + "fpeak_map"

	variable R_RmxSize, idex, nump, maxp, minp, numfpeak
		
	numfpeak = numpnts(fpeak_map)
	nump = numpnts(p_map)
	maxp = p_map[nump-1]
	minp = p_map[0]
	R_RmxSize = (maxp + minp) * (maxp - minp + 1) / 2		// kinda tricky - draw a picture
	
	// make 3d mxs
	setDataFolder $pmfDFNm
	make/O/N=(R_RmxSize,R_RmxSize, numfpeak) R_PMFvsPMFmx3d_Profiles,  R_PMFvsPMFmx3d_Profiles_UC, R_PMFvsPMFmx3d_Profiles_sprmn		
	make/O/N=(R_RmxSize,R_RmxSize, numfpeak) R_PMFvsPMFmx3d_Tseries, R_PMFvsPMFmx3d_Tseries_UC
	// temp waves
	make/O/N=(R_RmxSize,R_RmxSize) R_temp_mx2d_Factors, R_temp_mx2d_factors_UC, R_temp_mx2d_factors_sprmn
	make/O/N=(R_RmxSize,R_RmxSize) R_temp_mx2d_Tseries, R_temp_mx2d_Tseries_UC 

	for(idex = 0; idex < numfpeak; idex += 1)
		
			// fill in the temp R matricies
			pmfCalcs_R_PMFvsPMFmx2d(idex,R_temp_mx2d_Factors, R_temp_mx2d_Factors_UC,R_temp_mx2d_Factors_sprmn, R_temp_mx2d_Tseries, R_temp_mx2d_Tseries_UC)
	
			// load 2dmxs to 3dmxs
			R_PMFvsPMFmx3d_Profiles[][][idex]=R_temp_mx2d_Factors[p][q]
			R_PMFvsPMFmx3d_Profiles_UC[][][idex]=R_temp_mx2d_Factors_UC[p][q]
			R_PMFvsPMFmx3d_Profiles_sprmn[][][idex]=R_temp_mx2d_Factors_sprmn[p][q]
			R_PMFvsPMFmx3d_Tseries[][][idex]=R_temp_mx2d_Tseries[p][q]
			R_PMFvsPMFmx3d_Tseries_UC[][][idex]=R_temp_mx2d_Tseries_UC[p][q]
	endfor

	killwaves/z  R_temp_mx2d_Factors, R_temp_mx2d_Factors_UC, R_temp_mx2d_Factors_sprmn, R_temp_mx2d_Tseries, R_temp_mx2d_Tseries_UC 
	
End



Function pmf_CopyStringsFromEA2PMF(wavStr)
string wavStr

	svar WaveToAnalyze_Str = root:ElementalAnalysisLight:WaveToAnalyze_Str		// HR stick wave tp analyze
	svar ExactMassText_Str = root:ElementalAnalysisLight:ExactMassText_Str		// chemical formula
	svar ExactMassWave_Str = root:ElementalAnalysisLight:ExactMassWave_Str	// chemical mass value
	
	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm
	//svar pmfDFnm = root:pmf_prep_globals:pmfDFnm
	svar ColDesTxtWvNm = root:pmf_calc_globals:ColDesTxtWvNm
	svar ColDescrWvNm = root:pmf_calc_globals:ColDescrWvNm
	
	// we set these constants in  the Elemental List code to match the last set of data analyzed.
	ExactMassText_Str = pmfDFnm+ColDesTxtWvNm
	ExactMassWave_Str = pmfDFnm+ColDescrWvNm
	WaveToAnalyze_Str = wavStr
End


/ for EALight_GenerateFamilyMaskWaves
Function proto_1Wave1Str(ExactMassText, [DFstr])
	wave/t ExactMassText
	string DFstr
 	Abort "You must load in the EA Code ipf to proceed.  Aborting from proto_1Wave1Str"
End


// for EALight_calcHRSpectraToFamilies
Function proto_SpecFamilies(HRspec, HRmass, HRtext, [dfStr_result,dfStr_mask, SumToUMR ]) // , plotFlag)
wave HRspec, HRmass
wave HRtext
string dfStr_result, dfStr_mask
variable SumToUMR
 	Abort "You must load in the EA Code ipf to proceed.  Aborting from proto_SpecFamilies"
End


// Added in 3.05E 
// for EALight_plot_FamilySpec
Function proto_EALight_plot_FamilySpec(FamWavePrefix,  [dfStr_result, dfStr_mask, stackedFlag, HRflag, plotName, colVal, idexAxis, NumAxes])
string FamWavePrefix
variable stackedFlag, HRflag, colVal, NumAxes, idexAxis
string plotName, dfStr_mask, dfStr_result
 	Abort "You must load in the EA Code ipf to proceed.  Aborting from proto_EALight_plot_FamilySpec"
End


Function pmf_bt_help(ba) : ButtonControl
	STRUCT WMButtonAction &ba

	switch( ba.eventCode )
		case 2: // mouse up
			// click code here
			string str=""
			str+="The selection of UMR data and HR data (non-AMS) results in no additional calculations.;"
			str+="The selection of AMS HR will generate UMR family summed MS.;"
			str+="The selection of AMS HR ambient Org will additionally generate elemental ratios using Canagaratna et al formula. CHO and CO2 must be present.;"
			str+="The selection of AMS HR ambient Org will additionally generate elemental ratios using Hu et al A-A coeficients."  //3.07D
#if(IgorVersion()>=7)
				PopupContextualMenu str
#else
				doAlert 1, str
#endif
			break
		case -1: // control being killed
			break
	endswitch

	return 0
End


Function pmf_copyNanRedimFamilySpectra(CopyNanRedimFlag, factorNum, [selectDex, rows, UMRrows, cols])		// copy = 1, nan = 0, 2 = redimension
variable CopyNanRedimFlag, factorNum, selectDex, rows, UMRrows, cols

	string pmfdfStr = "root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FamilyResults:"
	string dfStr = "root:elementalAnalysisLight:FamilyResults:"
	svar pmfDFnm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFnm

	nvar/z HROrgExtensionPt = $pmfDFNm+"HROrgExtensionPt"

	wave/t HR_familyName = root:HR:HR_familyName
	string fam
	variable idex, pmax, kdex, numFam, nHRions
	numFam =numpnts(HR_familyName)
	
	for (kdex=0;kdex<numFam;kdex+=1)  // for each family
		fam = HR_familyName[kdex]
		wave ProfilesFactorXfam =  $pmfdfStr+"ProfileFactor"+num2istr(factorNum)+"_"+fam		// result used for plotting  root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactor1
		wave UMRProfilesFactorXfam =  $pmfdfStr+"UMR_ProfileFactor"+num2istr(factorNum)+"_"+fam		// result used for plotting
		wave/z HRSpectraXfam =  $dfStr+"HRSpectra_"+fam	// spaceholder
		wave/z UMRSpectraXfam =  $dfStr+"UMR_HRSpectra_"+fam	// spaceholder
		switch (CopyNanRedimFlag)
		case -1:
			ProfilesFactorXfam[][selectDex] = HRSpectraXfam[p]
			UMRProfilesFactorXfam[][selectDex] = UMRSpectraXfam[p]
			break
		case 0:
			ProfilesFactorXfam[][selectDex] = nan
			UMRProfilesFactorXfam[][selectDex] = nan
			break
		case 1:
			redimension/n=(rows, cols) ProfilesFactorXfam
			redimension/n=(UMRrows, cols) UMRProfilesFactorXfam
			break
		endswitch
	endfor

	if (NVar_exists(HROrgExtensionPt) && HROrgExtensionPt>0)
		switch (CopyNanRedimFlag)
		case -1:
			wave ProfilesFactorX = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ProfileFactor"+num2istr(factorNum)
			wave ExtProf = $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FamilyResults:Ext_ProfileFactor"+num2istr(factorNum)
			ExtProf[][selectDex] =	ProfilesFactorX[p+HROrgExtensionPt+1][selectDex]	
			break
		case 0:
			ProfilesFactorXfam[][selectDex] = nan
			UMRProfilesFactorXfam[][selectDex] = nan
			break
		case 1:
			make/o/n=(rows-(HROrgExtensionPt+1), cols) $"root:ACSM:PMF_Exported_Waves:pmf_plot_globals:FamilyResults:Ext_ProfileFactor"+num2istr(factorNum)
		break
		endswitch
	endif

End

// make the plots of scaled residuals for histogram or box plot
Function pmf_plot_ScaResidAllSpeciesBox(graphDest)
	string graphDest

	wave ScaResid_median = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResid_median
	wave ScaResid_boxtop = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResid_boxtop
	wave ScaResid_boxbottom = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResid_boxbottom			//2.09A DTS added
	wave ScaResid_whiskertop = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResid_whiskertop
	wave ScaResid_whiskerbottom = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResid_whiskerbottom

	svar ScaResidAllSpecies_Str = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResidAllSpecies_Str
	nvar ScaResidAllSpecies_MinMaxCheck = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ScaResidAllSpecies_MinMaxCheck
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:pmfDFNm
	svar ColDescrWvNm  = root:ACSM:PMF_Exported_Waves:pmf_plot_globals:ColDescrWvNm
	
	variable idex, tempVar
	string graphNm, FullGraphNm
	string ColDescrWvFullPath
	
	ColDescrWvFullPath = pmfDFNm+ColDescrWvNm

	// setup window
	 graphNm = "ScaResidAllSpecies"
	if(stringmatch(graphDest, "panel"))
		FullGraphNm = "pmf_plot_panel#"+graphNm
		// clear the old graph, if it exists
		gen_kill_subwindow("pmf_plot_panel", graphNm)
		
		// and make the new one
		display/HOST=PMF_Plot_Panel/N=$graphNm/W=(12,444,656,612)/K=1
	else	// window
		FullGraphNm = "pop_"+graphNm
		string winTitleStr = "Scaled Residual All Species"

		DoWindow/K $FullGraphNm  // kill graph if it already exists
		display/N=$FullGraphNm/K=1 as  winTitleStr  // make the new one
	endif

	gen_fBoxPlot_graphAxNm(ScaResid_median, ScaResid_boxtop, ScaResid_boxbottom, ScaResid_whiskertop, ScaResid_whiskerbottom, $colDescrWvFullPath, 0.3, 0, $"", $"", 0, 0, 0,FullGraphNm, "left")

	ModifyGraph/W=$FullGraphNm zero(left)=1
	TextBox/W=$FullGraphNm/C/N=text0/X=-55.00 "Boxes are +/- 25% of points\rWhiskers are +/- 5% of points"		//1.04A
	ModifyGraph/W=$FullGraphNm minor(bottom)=1
	ModifyGraph/W=$FullGraphNm nticks(bottom)=9
	Label/W=$FullGraphNm left "Scaled Residual"		//2.0 RC2

	if (ScaResidAllSpecies_MinMaxCheck>0)
		wavestats/q/m=1 ScaResid_whiskertop
		tempVar = .01*ScaResidAllSpecies_MinMaxCheck*V_max
		wavestats/q/m=1 ScaResid_whiskerbottom
		SetAxis/W=$FullGraphNm left .01*ScaResidAllSpecies_MinMaxCheck*V_min, tempVar 
	endif

	ModifyGraph grid=2,gridRGB=(34816,34816,34816)		// 1.3J
	if(stringmatch(graphDest, "panel"))
		SetActiveSubwindow ##
	endif
	
	pmf_check_rotateTextLabels(FullGraphNm,nan) 		//2.02

End




static Strconstant EALIST = "OMOC;HC;OC;NC;SC"
Function pmf_updateElemRatiosShowCheck()

	STRUCT WMCheckboxAction cba
 	string ElemStr
 	variable idex, val
 	
 	for(idex=0; idex<ItemsInLIst(EALIST); idex+=1)	
		ElemStr = StringFromList(idex, EALIST)
		cba.ctrlName = "check_"+ElemStr
 		ControlInfo $"check_"+ElemStr
		cba.checked= V_Value
 		pmf_ElemRatiosShowCheckProc(cba) 
	endfor

End




// calculates R for every PMF factor vs every PMF factor for the solutions at selected fpeaks
// creates R_PMFvsPMFmx2d_Factor (and _sprmn) or R_PMFvsPMFmx2d_Tseries
// fpeakDexWv must have the same dimensions as p_map, and each value in fpeakDexWv
// calculates R for every PMF factor vs every PMF factor for the solutions at given fpeaks
Function pmfCalcs_R_PMFvsPMFmx2d(fpeakdex, R_temp_mx2d_Factors,  R_temp_mx2d_Factors_UC, R_temp_mx2d_Factors_sprmn, R_temp_mx2d_Tseries, R_temp_mx2d_Tseries_UC)	
	variable fpeakdex
	wave  R_temp_mx2d_Factors, R_temp_mx2d_Factors_UC, R_temp_mx2d_Factors_sprmn, R_temp_mx2d_Tseries, R_temp_mx2d_Tseries_UC
	
	svar pmfDFNm = root:ACSM:PMF_Exported_Waves:pmf_calc_globals:pmfDFNm
	wave p_map = $pmfDFNm + "p_map"
	wave Gx4d = $pmfDFNm + "Gmx4d"
	wave Fx4d = $pmfDFNm + "Fmx4d"
	
	variable pDexA, ADex, pdexB, BDex, ThisRval, maxp, nump, numtseries, numamu, rowCounter, colCounter
		
	nump = numpnts(p_map)
	maxp = p_map[nump - 1]		
	numtseries = dimsize(Gx4d,0)		// "m" in the readMe file
	numamu = dimsize(Fx4d,1)		// "n" in the readMe file
			
 	R_temp_mx2d_Factors=nan
 	R_temp_mx2d_Factors_sprmn=nan
 	R_temp_mx2d_Tseries=nan
	R_temp_mx2d_Tseries_UC=nan
	
	// temp waves
	make/O/N=(numtseries) AofpairAB_tseries, BofpairAB_tseries
	make/O/N=(numamu) AofpairAB_amu, BofpairAB_amu
	
	rowCounter=0		// we could calculate the row values by summing our previous p values and a counter in between but this is too intense
	
	// for all possible values of p
	for(pDexA = 0; pDexA < nump; pDexA += 1)
	
		// for all values of p <= current value of p
		for(ADex = 0; ADex < p_map[pDexA]; ADex += 1)
			
			// need to start column count over, but move 1 to the right with each loop
			colCounter = 0

			// calc Rs for Tseries
			AofpairAB_tseries = Gx4d[p][ADex][fpeakdex][pDexA]						
			for(pDexB = 0; pDexB < nump; pDexB += 1)		// pDexB goes through all values of p

				for(BDex = 0; BDex < p_map[pdexB]; BDex += 1)	// BDex goes through all pairs within this value of pDexB
					BofpairAB_tseries = Gx4d[p][BDex][fpeakdex][pDexB]
					// get R
					ThisRval = StatsCorrelation(AofpairAB_tseries,BofpairAB_tseries)	// Igor 6
					R_temp_mx2d_Tseries[rowCounter][colCounter] = ThisRval
					ThisRval = gen_calc_UncentCorr(AofpairAB_tseries,BofpairAB_tseries)	// Paatero recommended method
					R_temp_mx2d_Tseries_UC[rowCounter][colCounter] = ThisRval
					// completed comparison for pairAB_tseries
					ColCounter += 1
				endfor

			endfor
			
			// need to start column count over, but move 1 to the right with each loop
			colCounter = 0

			// calc Rs for Factors
			AofpairAB_amu = Fx4d[ADex][p][fpeakdex][pDexA]						
			for(pDexB = 0; pDexB < nump; pDexB += 1)

				for(BDex = 0; BDex < p_map[pDexB]; BDex += 1)
					BofpairAB_amu = Fx4d[BDex][p][fpeakdex][pdexB]
					// get R
					ThisRval = StatsCorrelation(AofpairAB_amu,BofpairAB_amu)	// Igor 6
					R_temp_mx2d_Factors[rowCounter][colCounter] = ThisRval
					// get uncentered R
					ThisRval = gen_calc_UncentCorr(AofpairAB_amu,BofpairAB_amu)
					R_temp_mx2d_Factors_UC[rowCounter][colCounter] = ThisRval
					// get spearman R
					ThisRval = pmfCalcs_threshTruncWvs_for_R(AofpairAB_amu,BofpairAB_amu,"spearman")
					R_temp_mx2d_Factors_sprmn[rowCounter][colCounter] = ThisRval
					// completed comparison for pairAB_tseries
					ColCounter += 1
				endfor

			endfor

			rowCounter += 1
		endfor		// for all values of p <= current value of p

	endfor

	Killwaves/z  AofpairAB_tseries, BofpairAB_tseries, AofpairAB_amu, BofpairAB_amu//imu2.03A needed for Igor6.11, R_temp_mx2d_Factors, R_temp_mx2d_Tseries

End




Function pmf_ElemRatiosShowCheckProc(cba) : CheckBoxControl
	STRUCT WMCheckboxAction &cba

	string ratio, traceList, mytraceNameList, traceStr, winStr
	variable numTraces, i
	
	ratio = lowerstr(stringFromList(1, cba.ctrlName, "_"))

	winStr = cba.win
	if (stringmatch (cba.win, "pop_EARatio") )
		traceList = TraceNameList(cba.win, ";", 1 )
	else
		winStr="pmf_plot_panel#EARatio"
		traceList = TraceNameList("pmf_plot_panel#EARatio", ";", 1 )	
	endif
	numTraces = ItemsInList(traceList)

	mytraceNameList=""
	for(i=0; i<numTraces; i+=1)	
		traceStr = lowerstr(stringfromList(i,traceList))
		if (strsearch(traceStr, "_"+ratio,0)>0)
			mytraceNameList+= traceStr+";"
		endif
	endfor
	
	numTraces = ItemsInList(mytraceNameList)

	for(i=0; i<numTraces; i+=1)
		ModifyGraph/W=$winStr hideTrace($stringFromList(i,mytraceNameList))=!cba.checked
	endfor

End



// suggested by Paatero for correlation instead of Pearson R	
Function gen_calc_UncentCorr(waveA, waveB)		// added in 1.04A
	wave waveA, waveB

	variable numerator, denominator
	
	// check that waves are 1d, have same number of points	
	if (numpnts(waveA) != numpnts(waveB))
		Abort "Cannot perform uncentered correlation for waves "+nameofwave(waveA) + " ,"+nameofWave(waveB) + ". Aborting from calc_UncentCorr"
	endif
	
	// numerator = a.b
	numerator = MatrixDot(waveA, waveB)
	denominator = sqrt(MatrixDot(waveA,waveA) * MatrixDot(waveB,waveB))
	return (numerator/denominator)

End


// returns correlation between two waves where EITHER value is greater than 10e-3 * max_thatWv.
//  R_type can be "pearson" or "spearman" (not ranked, ranked)
// make mask waves for each inputWv where > thresh -> 1,   < thresh = NaN
// make joint mask wave, so jointmask = wv1thresh || wv2thresh (else NaN)
// mult wv1, wv2 by joint mask
// deleteNaNs or use calcR_mayhaveNaNs
Function pmfCalcs_threshTruncWvs_for_R(wv1, wv2, R_type)	
	wave wv1, wv2
	string R_type
	
	variable threshFactor = 2e-2, R_val

	// check if R_type is correct
	if( !stringmatch(R_type, "pearson") && !stringmatch(R_type, "spearman"))
		abort "Function calc_threshTruncWvs_for_R must be called with R_type 'pearson' or 'spearman'."
	endif

	// check that wv1 and wv2 have same number of points
	if (numpnts(wv1) != numpnts(wv2))
		abort "In function calc_threshTruncWvs_for_R, wv1 and wv2 must have same number of points."
	endif

	// make mask waves
	make/O/N=(numpnts(wv1)) wv1mask, wv2mask, jointMask

	// set mask for wv1
	wavestats/Q/M=1 wv1
	wv1mask = wv1[p] >= v_max * threshFactor ? 1 : NaN

	// set mask for wv2
	wavestats/Q/M=1 wv2
	wv2mask = wv2[p] >= v_max * threshFactor ? 1 : NaN

	// make joint mask -- 1 if wv2mask || wv2mask is 1
	jointMask = wv1mask[p] || wv2mask[p]

	// apply joint mask to duplicates of wv1 and wv2
	duplicate/O wv1, wv1dup
	duplicate/O wv2, wv2dup
	
	wv1dup *= jointMask
	wv2dup *= jointMask
	
	R_val = pmfCalcs_R_WvsMayHaveNaNs(wv1dup, wv2dup, R_type)

	// clean up
	killwaves/z pearsonOut, spearmanOut,  tmpWv1, tmpWv2		// if returned from pmfCalcs_R_WvsMayHaveNaNs early
	killwaves/z wv1mask, wv2mask, jointMask, wv1dup, wv2dup

	return R_val

End



// calculates an R value between two waves which may have NaNs, ignoring these points
// returns R value
Function pmfCalcs_R_WvsMayHaveNaNs(wv1, wv2, R_type)	
	wave wv1, wv2
	string R_type
	
	variable idex, numGoodPnts1, numGoodPnts2, numNaNs1, numNaNs2, counter
	string abortStr
	
	if (numpnts(wv1) != numpnts(wv2))
		abortStr = "function pmf_calc_R_WvsMayHaveNaNs(" + nameOfWave(wv1) + ", " + nameofWave(wv2) + ") "
		abortStr += "called with waves of different lengths."
		abort abortStr
	endif	

	// make PearsonOut		// changed in 1.3C
//	make/O/N=3 pearsonOut
//	make/O/N=6 spearmanOut
	
	// find shorter wave
	wavestats/Q/m=1 wv1
	numGoodPnts1 = v_npnts
	numNaNs1 = v_numNaNs
	
	wavestats/Q/m=1 wv2
	numGoodPnts2 = v_npnts
	numNaNs2 = v_numNaNs
	
	if(numNaNs1 == 0 && numNaNs2 == 0) 
		// no NaNs in either wave, just calc R
		if(stringmatch(R_type, "pearson"))
			return StatsCorrelation(wv1, wv2)   //  statPearsonTest(wv1, wv2, pearsonOut)
			//return(pearsonOut[0])
		elseif(stringmatch(R_type, "spearman"))
			StatsRankCorrelationTest/Q wv1, wv2
			wave W_StatsRankCorrelationTest
			return W_StatsRankCorrelationTest[4]
			// 1.3C fix
			// gen_SpearmanR(wv1, wv2, spearmanOut)
			//return(spearmanOut[3])
		elseif(stringmatch(R_type, "UC"))		//1.04A
			return gen_calc_UncentCorr(wv1, wv2)				//2.00A fix, thanks Ingrid
		else
			abortstr = "function pmf_calc_R_WvsMayHaveNaNs must be called with R_type 'pearson'"
			abortstr += " or 'Uncentered'."
			abort abortStr
		endif 
	else // need to deal with NaNs
		// make temp wvs for data to save
		make/O/N=(min(numGoodPnts1, NumGoodPnts2)) tmpWv1, tmpWv2
		
		// look through waves, only save data where neither value is NaN
		counter = 0
		for(idex = 0; idex < numpnts(wv1); idex += 1)
			if( numType(wv1[idex]) == 0 && numType(wv2[idex]) == 0)
				tmpWv1[counter] = wv1[idex]
				tmpWv2[counter] = wv2[idex]
				counter += 1
			endif
		endfor

		if(stringmatch(R_type, "pearson"))
			return StatsCorrelation(tmpwv1, tmpwv2)		/// statPearsonTest(tmpwv1, tmpwv2, pearsonOut)
			// return(pearsonOut[0])
		elseif(stringmatch(R_type, "spearman"))
			if(numpnts(tmpwv1) == 0)  	//imu2.04
				return NaN		//imu2.04
			elseif(numpnts(tmpwv1) == 1)	//imu2.04
				return 1				//imu2.04
			else						//imu2.04
				StatsRankCorrelationTest/Q tmpwv1, tmpwv2  //imu2.03B was wv1, wv2
				wave W_StatsRankCorrelationTest
				return W_StatsRankCorrelationTest[4]
				// 1.3C fix
				//gen_SpearmanR(tmpwv1, tmpwv2, spearmanOut)
				//return(spearmanOut[3])
			endif
		elseif(stringmatch(R_type, "UC"))		//1.04A
			return gen_calc_UncentCorr(tmpwv1, tmpwv2)		
		else
			abortstr = "function pmf_calc_R_WvsMayHaveNaNs must be called with R_type 'pearson'"
			abortstr += " or 'spearman''."
			abort abortStr
		endif 
	endif
		
	killwaves/z pearsonOut, spearmanOut,  tmpWv1, tmpWv2
	
End

///////////////////////////////////////////////////////////////////
/////////ACSM PMF Small things to make life a little easier.////// 
//////////////////////////////////////////////////////////////////

//AJD 2024/21/24
//Take the imported PMF Factor Tseries waves and graph em good. 
//Function Graph2D_Waves()
//
//
//End














//Error Propogation

Function ErrorPropWaves_Butt(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			string SigWave1_Str,Sigwave2_Str,ErrWave1_Str,ErrWave2_Str
			string Operation_Type
			prompt SigWave1_Str, "What is the first signal wave name?"
			prompt SigWave2_Str, "What is the second signal wave name?"
			prompt ErrWave1_Str, "What is the first error wave name (error associated with the first wave)?"
			prompt ErrWave2_Str, "What is the second error wave name (error associated with the second wave)?"
			prompt Operation_Type, "What is the type of operation you want to perform betweent the two waves?\rEnter 'Add', 'Subtract', 'Multiply', or 'Divide'."
			doprompt "Please enter the following:", Operation_Type,SigWave1_Str,SigWave2_Str,ErrWave1_Str,ErrWave2_Str
			if(V_Flag==1)
				abort "User Abort"
			endif
			wave SigWave1 = $SigWave1_Str
			wave SigWave2 = $SigWave2_Str
			Wave ErrWave1 = $ErrWave1_Str
			wave ErrWave2 = $ErrWave2_Str
			ErrProp(Operation_Type,SigWave1,SigWave2,ErrWave1,ErrWave2)
		case 2:
			break
		endswitch
		
End



Function ErrProp(Operation_Type,SigWave1,SigWave2,ErrWave1,ErrWave2)

	//Establish Function Parameters
	String Operation_Type
	Wave SigWave1,SigWave2,ErrWave1,ErrWave2
	
	//Establish Local Variables
	variable i
	variable npnts = dimsize(SigWave1,0)
	variable npnts_check = dimsize(SigWave2,0)
	CheckDimsize(SigWave1,SigWave2,0)
	npnts = dimsize(ErrWave1,0)
	npnts_check = dimsize(ErrWave2,0)
	CheckDimsize(ErrWave1,ErrWave2,0)
	
	//Create new sig and err wave
	string newSigwave = "newSIGwave_RENAMEME"
	string newErrWave = "newERRwave_RENAMEME"
	string newErrWave_relative = "newERRwave_Relative_RENAMEME"
	string newErrWave_percent = "newErrwave_Percent_RENAMEME"
	duplicate/O SigWave1, $newSigWave
	duplicate/O ErrWave1, $newErrWave
	duplicate/O ErrWave1, $newErrWave_relative
	duplicate/O ErrWave1, $newErrWave_percent
	wave Sig3 = $newSigWave
	wave Err3 = $newErrWave
	wave Err3_relative = $newErrWave_relative
	wave Err3_percent = $newErrWave_Percent
	Sig3 = NaN;Err3 = NaN;Err3_relative=NaN; Err3_percent=NaN
	
	
	//Set up if statements
	if(stringmatch(Operation_Type,"Add")) //If we want to add
	//Add the waves first
		Sig3 = SigWave1+SigWave2
	//Now worry about error
		Err3 = Sqrt(((ErrWave1)^2)+((ErrWave2)^2))
		Err3_relative = Err3/Sig3 
		Err3_percent = Err3_relative*100
	elseif(stringmatch(Operation_Type,"Subtract")) //If we want to subtract
	//Subtract the waves first
		Sig3 = SigWave1-SigWave2
	//Now worry about error
		Err3 = Sqrt(((ErrWave1)^2)+((ErrWave2)^2))
		Err3_relative = Err3/Sig3 
		Err3_percent = Err3_relative*100
	elseif(stringmatch(Operation_Type,"Multiply")) //If we want to multiply
	//Multiply the waves first
		Sig3 = SigWave1*SigWave2
	//Now worry about error
		Err3 = Sig3*(Sqrt(((ErrWave1/SigWave1)^2)+((ErrWave2/Sigwave2)^2)))
		Err3_relative = Err3/Sig3 
		Err3_percent = Err3_relative*100
	elseif(stringmatch(Operation_Type,"Divide")) //If we want to divide
	//Divide the waves first
		Sig3 = SigWave1/SigWave2
	//Now worry about error
		Err3 = Sig3*(Sqrt(((ErrWave1/SigWave1)^2)+((ErrWave2/Sigwave2)^2)))
		Err3_relative = Err3/Sig3 
		Err3_percent = Err3_relative*100
	endif
	


End



Function CheckDimsize(w1,w2,Dim)

	wave w1, w2
	variable dim
	variable npnts1, npnts2, i
	npnts1 = dimsize(w1,Dim)
	npnts2 = dimsize(w2,Dim)
	if(npnts1!=npnts2) //If they are not equal length
		Abort nameofwave(w1)+" is not equal length to "+nameofwave(w1)
	elseif(npnts1==npnts2) //If they are the same length
		//do nothing
	else
		abort "Error in CheckDimsize() function. Aborting."
	endif
	


End




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////Lauren Garafolo's flight map code for flight campaings is below. I am adapting it into my .ipf to have a consolidated code.///////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



Function FlightTrack_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			//Start Timers
			stopalltimers()
			variable Timer = startMSTimer
			//Prompt 1 strings and variables
			string ImgName = ""			
			variable  La1, La2, Lo1, Lo2	
			//Prompt 2 strings and variables
			string LatitudeWave_str = ""
			string LongitudeWave_str = "" 
			String ZWave_str = ""
			String MapImage_str = ""
			variable Start_index, stop_index, interval
			//Prompt 1
			Prompt ImgName, "What would you like to call the image loaded in?"
			prompt La1, "What is the latitude of the top left coordinate?"
			prompt La2, "What is the latitude of the bottom left coordinate?"
			prompt Lo1, "What is the longitude of the top right coordinate?"
			prompt Lo2, "What is the longitude of the bottom right coordinate?"
			prompt LatitudeWave_str, "What is the wave contining latitude information?"
			prompt LongitudeWave_str, "What is the wave contining longitude information?"
			prompt ZWave_str, "What is the wave used to color the flight track?"
			doprompt "Please enter the following. For Lat/Long click 'edit coordinates' in NASA worldview snapshot.", ImgName, La1, La2, Lo1, Lo2, LatitudeWave_str, LongitudeWave_str, ZWave_Str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave LatitudeWave = $LatitudeWave_str
			wave LongitudeWave = $LongitudeWave_str
			wave ZWave = $ZWave_str
			//Code1
			FlightMap_PictureSetup(ImgName,La1,La2,Lo1,Lo2,LatitudeWave,LongitudeWave, ZWave)
			
			
			//Prompt 2
			prompt MapImage_str, "What is the name of the image map?"
			prompt start_index, "What is the index value of the first point to include on the flight track?"
			prompt stop_index, "What is the index value of the last point to include on the flight track?"
			prompt interval, "What is the number of points added per frame?"
			doprompt "Please Enter the following infomation.", MapImage_str, start_index, stop_index, interval
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave LatitudeWave = $LatitudeWave_str
			wave LongitudeWave = $LongitudeWave_str
			wave MapImage = $MapImage_Str
			FlightTrackMovie(start_index, stop_index, interval, LatitudeWave, LongitudeWave, ZWave, MapImage, ImgName,La1,La2,Lo1,Lo2)
			//End Timers
			Timer = StopMSTimer(0)
			variable ElapsedTime = Timer/1E6/60
			doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
		case 2:
			break
		endswitch
end


//AJD 7/16/2025: Addition to make the loading process easier
Function FlightMap_PictureSetup(ImgName,La1,La2,Lo1,Lo2,LatitudeWave,LongitudeWave, ZWave)

	//Establish Function Parameters
	String ImgName	
	Variable La1,La2,Lo1,Lo2
	Wave LatitudeWave,LongitudeWave, ZWave

	//Load Image
	ImageLoad/T=jpeg/Q/N=$ImgName/G ""
	Setscale x Lo2, Lo1, $ImgName
	setscale y La1, La2, $ImgName

	
	//Fix NCAR to NASA worldview longitude scale
	Duplicate/O LongitudeWave, Long_neg
//	Long_neg = LongitudeWave-360
	
	AppendtoGraph/T=top LatitudeWave vs long_neg
	setaxis left La1, La2
	setaxis top Lo2, Lo1
	setaxis/A left //flip bad direction here;; better now?
	
	ModifyGraph zColor($nameofwave(LatitudeWave))={$nameofwave(ZWave),*,*,ColdWarm,0}
	ColorScale/C/N=text0 vert=0,width=200,height=10,trace=$nameofwave(LatitudeWave);DelayUpdate
	ColorScale/C/N=text0 "Black Carbon Mass Concentration";DelayUpdate
	ModifyGraph lsize=2
	
End

//////////////////////////////////////////////////
/////////     FlightTrackMovie.ipf     ///////////
////////         Lauren Garofalo       /////////// 
////////        Saved 7 June 2024       //////////
//////////////////////////////////////////////////

//Start_index = index value of the first point that I would like to include on the flight track. 
//stop_index = index value of the last point I want to include
//interval = the number of points added per frame
//LatitudeWave = wave with latitude
//LongitudeWave = wave with longitude
//ZWave = a wave that you want the flight track colored by
//MapImage = name of mapimage

Function FlightTrackMovie(start_index, stop_index, interval, LatitudeWave, LongitudeWave, ZWave, MapImage,ImgName,La1,La2,Lo1,Lo2)

variable start_index
variable stop_index
variable interval
variable La1,La2,Lo1,Lo2

Wave LatitudeWave
Wave LongitudeWave
Wave ZWave

Wave MapImage

String ImgName

variable loopstart = start_index + interval

string thiswavename
variable j =0

wave long_neg


//Determine max and min from ZWave
WaveStats/Q ZWave

//For the movie, you first have to create your first frame. This creates the frame, and adds the image and the first flight track segment

Display
AppendImage MapImage
//ModifyGraph width=356.4,height=276.48
ModifyGraph width=712.8,height=552.96

AppendtoGraph LatitudeWave[start_index,loopstart] vs long_neg[start_index,loopstart]
SetAxis left La2,La1 //Change with flight
SetAxis bottom Lo2,Lo1 // Change with flight2
//Setaxis/A Left

thiswavename = nameofwave(LatitudeWave) + "#" + num2str((j-start_index)/interval)
ModifyGraph zColor($thiswavename)={ZWave[j,j+interval],V_Min,V_Max,ColdWarm}, zColorMin($thiswavename)=(0,0,0)  // Change upper range with different species; I changed this to see if I can reverse the movie color
ModifyGraph lsize($nameofwave(LatitudeWave))=4

//Add axis labels and legend
Label left "Latitude"
Label bottom "Longitude"

ColorScale/C/N=text0/F=0/A=RT widthPct=2,heightPct=40,trace=$nameofwave(LatitudeWave) nameofwave(ZWave)

DoUpdate  //Makes first image 

NewMovie/F=60  //Open movie file. F = frames/s



//Plot up next segment of the flight.

	For (j= start_index+interval; j<=stop_index ; j+=interval)
		AppendtoGraph LatitudeWave[j,j+interval] vs Long_neg[j,j+interval] 
	
		thiswavename = nameofwave(LatitudeWave) + "#" + num2str((j-start_index)/interval)
		ModifyGraph zColor($thiswavename)={ZWave[j,j+interval],V_Min,V_Max,ColdWarm}, zColorMin($thiswavename)=(0,0,0)  // Change upper range with different species
		ModifyGraph lsize($thiswavename)=4

		DoUpdate
		AddMovieFrame  //Add frame at the end of each iteration of the for loop. As written, this adds a segment of the size given
							// by "intereval" to the graph

	Endfor

CloseMovie // Closes movie file

End





///////////////////////////////////Bonus: How to Read in an mp4 frame by frame

Function Extract_mp4 ()
	PlayMovieAction open = "C:\Users\lgarofal\OneDrive - Colostate\Documents\Documents\Group Meetings\Igor Tutorials\Mapping\TempMovie_04.mp4"
	
	
	PlayMovieAction stop, gotoEnd, getTime
	Variable tEnd = V_Value
	PlayMovieAction step=-1, getTime
	Variable frames = tEnd/(tEnd-V_value)
	print frames
	
	PlayMovieAction gotoBeginning
	
	
	PlayMovieAction extract
	Rename M_MovieFrame Frame0
	variable rows
	variable columns 
	Wave Frame0
	rows = DimSize(Frame0,0)
	columns = DimSize(Frame0,1)

	Variable i
	For (i=1; i<frames ;i++)
		PlayMovieAction extract
		string thisframenum
		thisframenum = "Frame" + num2str(i)
		
	
	//For some reason, Frame0 is loading in well, but the other frames have borders and too many pixels, 
	// so I'm trimming the extra pixels here
		Wave M_MovieFrame
		DeletePoints/M=1 438,10, M_MovieFrame
		DeletePoints 584,8, M_MovieFrame
		
		Rename M_MovieFrame $thisframenum
		PlayMovieAction step = 1
				
	EndFor
	
	PlayMovieAction kill 
		
End

Function VertConc_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			//Start Timers
			stopalltimers()
			variable Timer = startMSTimer
			//Prompt Variables
			string WLat_Str = ""
			string WLong_Str = ""
			string WSpecies_Str = ""
			string WAlt_Str = ""
			string WTime_Str = "" 
		
			prompt WLat_Str, "What is the name of the latitude wave?"
			prompt WLong_Str, "What is the name of the longitude wave?"
			prompt WSpecies_Str, "What is the name of the species wave to be plotted?"
			Prompt WAlt_Str, "What is the name of the the altitude wave?"
			prompt wTime_Str, "What is the name of the time wave to use?"
			
			doprompt "Please Enter the following infomation.", WTime_Str, WAlt_Str, WSpecies_Str //WLat_Str, WLong_Str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave WLat = $WLat_Str
			wave WLong = $WLong_Str
			wave WSpecies = $WSpecies_Str
			wave WAlt = $WAlt_Str
			wave wTime = $wTime_Str
			VertConc(WLat,WLong,WSpecies,WAlt, WTime)
			//End Timers
			Timer = StopMSTimer(0)
			variable ElapsedTime = Timer/1E6/60
			doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
		case 2:
			break
		endswitch
end

//AJD 7/19/2025 
//Plot a concentration of a species with respect to altitude and time. 
Function VertConc(WLat,WLong,WSpecies,WAlt, WTime)

	//Establish function parameters
	wave WLat, WLong, WSPecies, WAlt, WTime
	
	//Establish local parameters
	
	
	//Impliment graphing
	String gName = "VertConc_"+nameofwave(wSpecies)
	Display/N=$gName/W=(10,10,500,500)
	AppendtoGraph/W=$gName wAlt vs WTime	//First plot altitude (y) vs time (x)
	ModifyGraph lsize=2,ZColor($nameofwave(wAlt))={$nameofWave(wSpecies),*,*,ColdWarm,0}
	ColorScale/C/N=Text0/A=LT trace = $nameofwave(wAlt), vert=0,width=200,heightPct=1
	ColorScale/C/N=text0 nameofwave(wSpecies)
	label left "Altitude (units)"
	label bottom "Time"


End


Function AltConc_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			//Start Timers
			stopalltimers()
			variable Timer = startMSTimer
			//Prompt Variables
			string WLat_Str = ""
			string WLong_Str = ""
			string WSpecies_Str = ""
			string WAlt_Str = ""
			string WTime_Str = "" 
		
//			prompt WLat_Str, "What is the name of the latitude wave?"
//			prompt WLong_Str, "What is the name of the longitude wave?"
			prompt WSpecies_Str, "What is the name of the species wave to be plotted?"
			Prompt WAlt_Str, "What is the name of the the altitude wave?"
//			prompt wTime_Str, "What is the name of the time wave to use?"
			
			doprompt "Please Enter the following infomation.", WAlt_Str, WSpecies_Str //WLat_Str, WLong_Str,WTime_Str
			if(V_Flag==1)
				abort "User Aborted."
			endif
//			wave WLat = $WLat_Str
//			wave WLong = $WLong_Str
			wave WSpecies = $WSpecies_Str
			wave WAlt = $WAlt_Str
//			wave wTime = $wTime_Str
			AltConc(WSpecies,WAlt)
			//End Timers
			Timer = StopMSTimer(0)
			variable ElapsedTime = Timer/1E6/60
			doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
		case 2:
			break
		endswitch
end


//AJD 7/20/2025
//Plot altitude vs concentration
Function AltConc(WSpecies,WAlt)

	//Establish Function Parameters
	wave WSpecies,WAlt
	
	//Establish Local Parameters
	
	//Impliment graphing
	String gName = "AltConc_"+nameofwave(wSpecies)
	Display/N=$gName/W=(10,10,500,500)
	AppendtoGraph/W=$gName wAlt vs WSpecies	//First plot altitude (y) vs species concentration (x)
	ModifyGraph lsize=2,rgb=(0,0,0)
	TextBox/C/N=text0/F=0/A=LT nameofwave(wSpecies)
	label left "Altitude (units)"
	label bottom "Concentration (units)"


End




Function DoBasicGOTHAAMPlots_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			//Start Timers
			stopalltimers()
			variable Timer = startMSTimer
			//Prompt Variables
			string WLat_Str = ""
			string WLong_Str = ""
			string WSpecies_Str = ""
			string WAlt_Str = ""
			string WTime_Str = "" 
		
			prompt WLat_Str, "What is the name of the latitude wave?"
			prompt WLong_Str, "What is the name of the longitude wave?"
			prompt WSpecies_Str, "What is the name of the species wave to be plotted?"
			Prompt WAlt_Str, "What is the name of the the altitude wave?"
			prompt wTime_Str, "What is the name of the time wave to use?"
			
			doprompt "Please Enter the following infomation.", WTime_Str, WAlt_Str, WSpecies_Str //WLat_Str, WLong_Str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave WLat = $WLat_Str
			wave WLong = $WLong_Str
			wave WSpecies = $WSpecies_Str
			wave WAlt = $WAlt_Str
			wave wTime = $wTime_Str
			VertConc(WLat,WLong,WSpecies,WAlt, WTime)
			AltConc(WSpecies,WAlt)
			//End Timers
			Timer = StopMSTimer(0)
			variable ElapsedTime = Timer/1E6/60
			doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
		case 2:
			break
		endswitch
end



Function LagvsCT_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			//Start Timers
			stopalltimers()
			variable Timer = startMSTimer
			//Prompt Variables
			string WLag_Str = ""
			string WCT_Str = ""
//			string WSpecies_Str = ""
//			string WAlt_Str = ""
//			string WTime_Str = "" 
		
//			prompt WLat_Str, "What is the name of the latitude wave?"
//			prompt WLong_Str, "What is the name of the longitude wave?"
			prompt WLag_Str, "What is the name of the lag time wave?"	//This will need to be interoplated to a set time 
			Prompt WCT_Str, "What is the name of the coating thickness wave?"	//This will need to be interpolated to a set time
//			prompt wTime_Str, "What is the name of the time wave to use?"
			
			doprompt "Please Enter the following infomation.", WLag_Str, WCT_Str //WLat_Str, WLong_Str,WTime_Str
			if(V_Flag==1)
				abort "User Aborted."
			endif
//			wave WLat = $WLat_Str
//			wave WLong = $WLong_Str
			wave WLag = $wLag_Str
			wave WCT = $WCT_Str
//			wave wTime = $wTime_Str
			LagvsCT(WLag,wCT)
			//End Timers
			Timer = StopMSTimer(0)
			variable ElapsedTime = Timer/1E6/60
			doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
		case 2:
			break
		endswitch
end


//AJD 7/21/2025
//Makes Lag Time vs Coating Thickness

Function LagvsCT(WLag,wCT)

	//Establish Function Parameters
	wave WLag, WCt
	
	//Establish Local Parameters
	
	//Impliment graphing
	String gName = "LagtimevsCT"
	Display/N=$gName/W=(10,10,500,500)
	AppendtoGraph/W=$gName wLag vs WCT	//First plot altitude (y) vs species concentration (x)
	ModifyGraph lsize=2,rgb=(0,0,0), mode=2
	TextBox/C/N=text0/F=0/A=LT nameofwave(wLag)
	label left "Lag time (µs)"
	label bottom "Coating Thickness (nm)"
	
	


End

Function GOTHAAM_SP2_STPWaveFix_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			//Start Timers
			stopalltimers()
			variable Timer = startMSTimer
			//Prompt Variables
//			string WLat_Str = ""
//			string WLong_Str = ""
//			string WSpecies_Str = ""
//			string WAlt_Str = ""
//			string WTime_Str = "" 
//		
////			prompt WLat_Str, "What is the name of the latitude wave?"
////			prompt WLong_Str, "What is the name of the longitude wave?"
//			prompt WSpecies_Str, "What is the name of the species wave to be plotted?"
//			Prompt WAlt_Str, "What is the name of the the altitude wave?"
////			prompt wTime_Str, "What is the name of the time wave to use?"
//			
//			doprompt "Please Enter the following infomation.", WAlt_Str, WSpecies_Str //WLat_Str, WLong_Str,WTime_Str
//			if(V_Flag==1)
//				abort "User Aborted."
//			endif
//			wave WLat = $WLat_Str
//			wave WLong = $WLong_Str
//			wave WSpecies = $WSpecies_Str
//			wave WAlt = $WAlt_Str
//			wave wTime = $wTime_Str
			 GOTHAAM_SP2_STP_WaveFix()
			//End Timers
			Timer = StopMSTimer(0)
			variable ElapsedTime = Timer/1E6/60
			doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
		case 2:
			break
		endswitch
end

//AJD 7/22/2025

Function GOTHAAM_SP2_STP_WaveFix()

	//Establish Function Parameters
	
	
	//Establish Local Parameters
	Variable SL, SH, AL, AH
	
	//Find Waves
	Wave Time_Start //Waves from Aircraft ICARTT
	
	Wave SP2_DT //SP2 PBP DT wave (from raw folder)
	
	//Redimension waves based on min and max times of Time_Start and SP2_DT
	Variable PBPMin, PBPMax, CrossLow, CrossHigh, DeleteLow
	PBPMin = SP2_DT[0];PBPMax = SP2_DT[inf]//Provides time values; we will impliment these in the loop
	CrossLow = binarysearch(Time_Start, PBPMin)
	CrossHigh = binarysearch(Time_Start,PBPMax)
	
	//Idea: parse out the pressure and temperature ICARTT wave to match the PBP waves
	variable ARows = dimsize(Time_Start,0)
	variable SRows = dimsize(SP2_DT,0)
	variable i,j
	
	//Duplicate all imported ICARTT waves in the data folder
	String WList = WaveList("!SP2_*", ";", "TEXT:0")
	variable nWaves = itemsinlist(WList, ";")
	for(i=0;i<nWaves;i++)
		Wave TempWave = $stringfromlist(i,WList,";")
		String TempName = nameofwave(TempWave)
		Deletepoints CrossHigh+1, Inf, TempWave
		Deletepoints 0, CrossLow, TempWave
		Duplicate/O TempWave, $TempName+"_SP2"
		Wave TempDupWave = $TempName+"_SP2"
		Redimension/N=(SRows) TempDupWave
	endfor
	
	//Restablish dimensions now that waves are cut
	ARows = dimsize(Time_Start,0)
	SRows = dimsize(SP2_DT,0)
	
	//Gather duplicated waves in a list
	String DWList = Wavelist("*_SP2",";","TEXT:0")

//	//Duplicate ICARTT Waves and redimension them
//	Duplicate/O ATX, ATX_SP2
//	redimension/N=(SRows) ATX_SP2
//	Duplicate/O LATC, LATC_SP2
//	redimension/N=(SRows) LATC_SP2
//	Duplicate/O LONC, LONC_SP2
//	redimension/N=(SRows) LONC_SP2
//	Duplicate/O PSXC, PSXC_SP2
//	redimension/N=(SRows) PSXC_SP2
//	Duplicate/O Time_Start, Time_Start_SP2
//	redimension/N=(SRows) Time_Start_SP2
//	Duplicate/O GGALT, GGALT_SP2
//	redimension/N=(SRows) GGALT_SP2
	
	for(i=0;i<ARows;i++)
		//For the last point
		if(i==ARows-1)
			for(j=0;j<nWaves;j++)
				Wave TempDupWave = $stringfromlist(j,DWList,";")
				Wave TempWave = $stringfromlist(j,WList,";")
				TempDupWave[SH+1,inf] = TempWave[i]
			Endfor
//			ATX_SP2[SH+1,inf] = ATX[i]
//			LATC_SP2[SH+1,inf] = LATC[i]
//			LONC_SP2[SH+1,inf] = LONC[i]
//			PSXC_SP2[SH+1,inf] = PSXC[i]
//			GGALT_SP2[SH+1,inf] = GGALT[i]
//			Time_Start_SP2[SH+1,inf] = Time_Start[i]
			break //Break out of loop
		else
			//Establish Aircraft Frame
			AL = Time_Start[i]
			AH = Time_Start[i+1]
		endif
		
		
		//Establish Aircraft Frame
		AL = Time_Start[i]
		AH = Time_Start[i+1]
		
		
		//Determine index that Aircraft Frame overlaps with (make adjustments for unique cases)
		SL = binarySearch(SP2_DT,AL)
		if(SL==-1)
			SL=0
		endif
		SH = binarySearch(SP2_DT,AH)
		if(SH==-2)
			SH=SRows-1
		endif
		
		for(j=0;j<nWaves;j++)
			Wave TempDupWave = $stringfromlist(j,DWList,";")
			Wave TempWave = $stringfromlist(j,WList,";")
			TempDupWave[SL,SH] = TempWave[i]
		Endfor
		
		//Extrapolate Waves
//		ATX_SP2[SL,SH] = ATX[i]
//		LATC_SP2[SL,SH] = LATC[i]
//		LONC_SP2[SL,SH] = LONC[i]
//		PSXC_SP2[SL,SH] = PSXC[i]
//		Time_Start_SP2[SL,SH] = Time_Start[i]
//		GGALT_SP2[SL,SH] = GGALT[i]
	
	Endfor


	//Duplicate waves to root
	for(j=0;j<nWaves;j++)
		Wave TempDupWave = $stringfromlist(j,DWList,";")
		string MoveWaveName = nameofwave(TempDupWave)
		MoveWave TempDupWave, root:$MoveWaveName
	Endfor
	
//	Duplicate/O ATX_SP2, Root:ATX_SP2_C
//	Duplicate/O LATC_SP2, Root:LATC_SP2
//	Duplicate/O LONC_SP2, Root:LONC_SP2
//	Duplicate/O PSXC_SP2, Root:PSXC_SP2
//	Duplicate/O Time_Start_SP2, Root:Time_Start_SP2
//	Duplicate/O GGALT_SP2, Root:GGALT_SP2
//	Duplicate/O ATX_SP2, ATX_SP2_K
//	wave ATX_SP2_K
//	ATX_SP2_K+=273.15	//K = C + 273.15
//	movewave ATX_SP2_K, root:ATX_SP2_K

	//Create K Temperature wave
	setdatafolder root:
	wave ATX_SP2
	Duplicate/O ATX_SP2, ATX_SP2_C
	Duplicate/O ATX_SP2, ATX_SP2_K
	ATX_SP2_K+=273.15	//K = C + 273.15

End




Function BCSDOutlier_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			//Start Timers
			stopalltimers()
			variable Timer = startMSTimer
			//Prompt Variables
			string WLat_Str = ""
			string WLong_Str = ""
			string WSpecies_Str = ""
			string WLNSD_Str = ""
			string WLNSDCoef_Str = "" 
			string WLNBCGM_Str = ""
			variable UserOutlier_High, UserOutlier_Low
		
//			prompt WLat_Str, "What is the name of the latitude wave?"
//			prompt WLong_Str, "What is the name of the longitude wave?"
			prompt WLNSD_Str, "What is the name of the lognormal SD wave (2D)?"
			Prompt WLNSDCoef_Str, "What is the name of the SD coefficent wave (2D)?"
			Prompt WLNBCGM_Str, "What is the name of the Lognormal GM wave (1D)?"
			prompt UserOutlier_High, "What is the high range cutoff (values above this will be NaNed)?"
			prompt UserOutlier_Low, "What is the low range cutoff (values below this will be NaNed)?"
//			prompt wTime_Str, "What is the name of the time wave to use?"
			
			doprompt "Please Enter the following infomation.", WLNSD_Str, WLNSDCoef_Str,WLNBCGM_Str, UserOutlier_High, UserOutlier_Low //WLat_Str, WLong_Str,WTime_Str
			if(V_Flag==1)
				abort "User Aborted."
			endif
//			wave WLat = $WLat_Str
//			wave WLong = $WLong_Str
			wave WLNSD = $WLNSD_Str
			wave WLNSDCoef = $WLNSDCoef_Str
			wave WLNBCGM=$WLNBCGM_Str
//			wave wTime = $wTime_Str
			BCSD_Outlier(WLNSD,WLNSDCoef,WLNBCGM,UserOutlier_High,UserOutlier_Low)
			//End Timers
			Timer = StopMSTimer(0)
			variable ElapsedTime = Timer/1E6/60
			doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
		case 2:
			break
		endswitch
end

//AJD: 7/27/2025; remove outliers from lognormal BCSD by taking the Gmean calculated and a user inputted cutoff
Function BCSD_Outlier(WLNSD,WLNSDCoef,WLNBCGM,UserOutlier_High,UserOutlier_Low)

	//Establish Function Parameters
	wave WLNSD, WLNSDCoef,WLNBCGM
	Variable UserOutlier_High, UserOutlier_Low
	
	//Establish local parameters
	variable i
	variable nrows = dimsize(WLNSD,0)
	
	for(i=0;i<nrows;i++)
		if(WLNSDCoef[i][3]>UserOutlier_High || WLNSDCoef[i][3]<UserOutlier_Low)
			WLNSD[i][]=NaN
			WLNBCGM[i]=NaN
		endif
	endfor


End


Function AvgInterpWList_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			//Prompt Variables
			string wListIdentify_Str = ""
			string X1_Str = ""
			string X2_Str = ""
		
			Prompt wListIdentify_Str, "What is the identifying string to create the wavelist?"
			prompt X1_Str, "What faster time wave?"
			prompt X2_Str, "What is the slower time wave?"
			doprompt "Please Enter the following infomation.", wListIdentify_Str, X1_Str,X2_Str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave X1 = $X1_Str
			wave X2 = $X2_Str
			Avg_InterpList(wListIdentify_Str,X2,X1,1)
		case 2:
			break
		endswitch
end


//Function ideas from literature
//mean lag time (y-axis) vs mean coating thickness (x-axis):: Done
//different sp2 parameters vs alt/time -> geo mean, ct thick, etc
//lognormal coef contain what I am looking for, I can use my 2D to 1D wave function to get an easier to manipulate format. 

//BC concentration in plumes are measured in ng/m3 - STP (BC over mexico)





//Cory variable recommendations -> Pressure PSFDC anbd PSFC (corrected version of D)
//Use PSFC //PSXC -> Referenced pressure used; use this
//_A -> avionics
//GGLat and GGLong -> Cory preference
//GG variables with altitude as well



Function SD_Hist_Slider_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			//Start Timers
//			stopalltimers()
			variable Timer = startMSTimer
			//Prompt Variables
			string wTime_Str = ""
			string w2D_Str = ""
		
			prompt w2D_Str, "What is the name of the SD wave or histogram (2D)?"
			prompt wTime_Str, "What is the name of the time wave to use?"
			
			doprompt "Please Enter the following infomation."
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave w2D = $w2D_Str
			wave wTime = $wTime_Str
			SD_Hist_Slider(w2D, wTime)
			//End Timers
//			Timer = StopMSTimer(0)
//			variable ElapsedTime = Timer/1E6/60
//			doAlert/T="Code Completion" 0, "The code has completed in "+ num2str(ElapsedTime) +" minutes."
		case 2:
			break
		endswitch
end


//AJD: 8/3/25; This will be in development for a bit. The idea is to have a SD or Histogram slider so I can view coating histograms that I generate or size distributions that I have.
//I assume the user has some sort of time wave to go along with the SD/Hist (this is what the code was designed to look at).
//I am starting this as a fun coding project for me when my main work is done for GOTHAAM (i.e. flights, data processing, data upload, basic data analysis thoughts). 
//This function will likley be one of the more complex ones that I have built, but I want to make it more streamlines than the PSI one, but I still need to remind myself to annotate well so other people can understand the process
//Looking towards the PSI toolkit code 'MatrixSuperSlider' for guidance
Function SD_Hist_Slider(w2D, wTime)

	//Establish Function Parameters
	wave w2D, wTime
	
	//Establish Local Parameters
	variable i
	
	//Get dimensions of the waves
	variable nrows2D, ncols2D, nrows1D
	nrows2D = dimsize(w2D,0)	//Rows of the SD/Hist
	ncols2D = dimsize(w2D,1) //Bins of the SD/Hist
	nrows1D = dimsize(wTime,0)	//Rows of the Time Wave
	
	//Check rows of 2D wave and Time wave to ensure they are the same
	CheckDimsize(w2D,wTime,0)
	
	//Establish DF Hierarchy
	String StartDF= GetDataFolder(1)
	setdatafolder root:AdamToolkit:
	DFREF AJDDF = getdatafolderDFR()
	if(dataFolderExists("SD_Hist_Slider")==1)	//If the data folder 'SD_Hist_Slider' currently exists wipe is and reset
		setdatafolder "SD_Hist_Slider"
		DFREF SDHistDF = getdatafolderDFR()
		KillDataFolder SDHistDF
		NewDataFolder/O/S SD_Hist_Slider
	else //If the data folder 'SD_Hist_Slider' does not exist then create is
		NewDataFolder/O/S SD_Hist_Slider
		DFREF SDHistDF = getdatafolderDFR()
	endif
	
	//Establish naming and identification
	String GraphName = "Hist_SD_Slider_"+nameofwave(w2D)
	String GraphIDString = ""
	GraphIDString = Graphname+"_0" //Temporary for now
	
	
	//Establish parameters needed for slider
	//Take the individual SD/Hist columns as the Y-Wave
	for(i=0;i<nCols2D;i++)
		Make/o/d/n=0 $"YWave"+num2str(i)
		wave graphYWave=$"YWave"+num2str(i)
		redimension/n=(nCols2D) graphYWave
		graphYwave=w2D[i][p]
	endfor
	//Take the SD/Hist rows as the X-Wave
	for(i=0;i<nRows2D;i++)
		Make/o/d/n=0 $"XWave"+num2str(i)
		wave graphXWave=$"XWave"+num2str(i)
		redimension/n=(nRows2D) graphXWave
		graphXwave=w2D[i][p]
	endfor		
	//Prepare the time or run wave (add on to this as well)
	string TimeRunPath = ""
	string TimeRunTypeStr = ""
	
	//Create Graph
	make/o/n=1 tmpDisplWavMSS={1}
	Display/W=(170,60,640,330) /L=left tmpDisplWavMSS as GraphName
	AppendtoGraph /L=left/B=bottom graphYWave vs  graphXWave
	ControlBar 49
	Slider $"SDHist"+GraphIDstring, pos={9,3},size={265,16},proc=SDHistSliderProc
	Slider $"CPSlider"+GraphIDstring,fSize=8
	Slider $"CPSlider"+GraphIDstring,limits={0,nRows2D,1},variable=CurrPoint,vert= 0, ticks=0
	//START BELOW WHEN COMING BACK TO THIS
//	SetVariable $"CPSetVar"+GraphIDstring,pos={312,3},size={180,16},proc=MatSupSlidCurrPtSetVarProc,title="Current Point"
//	SetVariable $"CPSetVar"+GraphIDstring,limits={LowLimit,HighLimit,1},value=CurrPoint
//	SetVariable $"SSSetVar"+GraphIDstring,pos={500,4},size={100,16},proc=MatSupSlidStepSizeSetVarProc,title="step size"
//	SetVariable $"SSSetVar"+GraphIDstring,limits={1,HighLimit,1},value=StepSize
//	SetVariable $"CPValDisp"+GraphIDstring,pos={386,26},size={203,16},title="time or run"
//	SetVariable $"CPValDisp"+GraphIDstring,value=CurrTimeOrRun,noedit= 1
//	Button $"MovieButt"+GraphIDstring,pos={9,23},size={50,20},proc=MatSupSlidMovieProc,title="Movie"
//	SetVariable $"SpeedVar"+GraphIDstring,pos={68,26},size={121,16},title="Speed [1/s]"
//	SetVariable $"SpeedVar"+GraphIDstring,limits={0,100,0.1},value=Speed
//	CheckBox $"SaveCheck"+GraphIDstring,pos={199,26},size={41,14},title="save"
//	CheckBox $"SaveCheck"+GraphIDstring,variable=SaveVal
//	//run set var proc
//	String ctrlnamecall="CPSetVar"+GraphIDstr
//	String varNameCall="CurrPoint"+GraphIDstr
//	MatSupSlidCurrPtSetVarProc(ctrlnamecall,CurrPoint,"",varNameCall)
//	killwaves tmpDisplWavMSS
//	setdatafolder $savedDF
//	return GraphIDstr
	
	//Set user back to inital data folder
	setdatafolder StartDF
	
End

//Based on MatSupSlidCurrPtSliderProc function from PSI SP2 toolkit
Function SDHistSliderProc(ctrlName,SliderValue,event): SliderControl

	//Establish Function Parameters
	String ctrlName
	Variable sliderValue
	Variable event	// bit field: bit 0: value set, 1: mouse down, 2: mouse up, 3: mouse moved

	//Establish local parameters
	Variable SuffixIndex
	SuffixIndex=strsearch(ctrlName, "_", inf  , 1)
	String GraphIDstr=ctrlName[SuffixIndex, inf]
	String ctrlnamecall="CPSetVar"+GraphIDstr
	String varNameCall="CurrPoint"+GraphIDstr
	if(event %& 0x1)	// bit 0, value set
//		MatSupSlidCurrPtSetVarProc(ctrlnamecall,sliderValue,"",varNameCall)
	endif

	return 0
end





//Completely clear out all Variables, Strings, and Waves in a data folder
Function FindDFInfo(DF)

	//Establish Function Parameters
	DFREF DF	
	
	//Establish Local Parameters
	Variable i
	
	//Gather information about Waves, Variables, and Strings in a the data folder
	String DFStrs, DFVars, DFWaves
	DFWaves = dataFolderDir(2)
	DFVars = dataFolderDir(4)
	DFStrs = dataFolderDir(8)
	
	//Generate Lists of Waves, Variables, and Strings	
	string WaveList0 = listMatch(DFWaves, "WAVES:*",";")
	string WaveList1 = ChopBeginningOff(WaveList0,"WAVES:") 
	string WaveList2 = replaceString(",", WaveList1,";")
	
	string VarList0 = listMatch(DFVars, "VARIABLES:*",";")
	string VarList1 = ChopBeginningOff(WaveList0,"VARIABLES:") 
	string VarList2 = replaceString(",", WaveList1,";")
	
	string StrList0 = listMatch(DFStrs, "STRINGS:*",";")
	string StrList1 = ChopBeginningOff(WaveList0,"STRINGS:") 
	string StrList2 = replaceString(",", WaveList1,";")
	
	//Gather important information about each parameter
	Variable nWaves, nVars, nStrs
	nWaves = itemsInList(WaveList2, ";")
	nVars = itemsInList(VarList2, ";")
	nStrs = itemsInList(StrList2, ";")
	
	//User can insert code here to do stuff with the information
	
	 
end

Function /S ChopBeginningOff(str,beginning)
	String str, beginning
	//This function chops the ending provided in "ending" off the end of the string "str" if it is there.
	if(numtype(strsearch(str,beginning,0,2))==0)
		string ChoppedStr = ReplaceString(beginning, str, "")
		return ChoppedStr
	else
		print numtype(strsearch(str,beginning,0,2)==0)
		abort "Error in ChopBeginningOff()"
	endif
End




Function LoadNetCDF4_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			//Establish DF
			DFREF StartDF = getdatafolderDFR()
			NewDataFolder/O/S NETCDF4_LoadIn
			DFREF NETCDFDF = getdatafolderDFR()
			
			wave/T DataSet_List
//			Load_NetCDF_From_List("", -4, DataSet_List=DataSet_List)//STRING strFile_Path, VARIABLE vUser_UTC_Offset, [WAVE/T/Z Dataset_List])
			setdatafolder StartDF

		case 2:
			break
		endswitch
end



Function P2P_Stats_Hist_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			//Use Graph to identify wave information
			wave W2D = $CsrXWave(A, "")
			string wTimeFast_Str = ""
			string w1D_Str= ""
			string wTimeSlow_Str = ""
			prompt wTimeFast_Str, "What is the name of the time (faster time if you are incorperating a PBP wave)?"
			prompt w1D_Str, "What is the name of the signal wave?"
			prompt wTimeSlow_Str, "What is the name of the slow time wave (if you are incorperating PBP data)?"
			doprompt "Enter the following. The command line will generate a line to use when you adjust your points.", wTimeFast_Str, W1D_Str,WTimeSlow_Str
			if(V_Flag==1)
				Abort
			endif
			wave wTimeFast = $wTimeFast_Str
			wave W1D = $W1D_Str
			Wave wTimeSlow = $wTimeSlow_Str
			P2P_Stats_Hist(w2D, wTimeFast, W1D, wTimeSlow = wTimeSlow)
		case 2:
			break
		endswitch
end

//The idea of this function is to determine some stats from the 1D wave that was used to make the histogram between two cursor points on the top graph the user is on
Function P2P_Stats_Hist(w2D, wTimeFast, W1D, [wTimeSlow])

	//Establish Function Parameters
	wave w2D, wTimeFast, W1D, wTimeSlow

	//Establish Local Parameters
	Variable p1, p2,t1,t2,wPoint1, wPoint2
	
	//Establish cursor frame (rows)
	//Find where the cursors are in the histogram
	p1 = xcsr(A, "")
	p2 = xcsr(B, "")
	//Find the timeframe this corresponds too
	t1 = wTimeFast[p1]
	t2 = wTimeFast[p2]
	//See if the optional paraemeter has been declared
	if(paramisdefault(wTimeSlow)==0)//if it has been declared
		wPoint1 = binarysearch(wTimeSlow,t1)
		wPoint2 = binarySearch(wTimeSlow,t2)
		Duplicate/R=[wPoint1,wPoint2]/Free/O w1D, StatsWave
		Wavetransform ZapNaNs StatsWave	//Get rid of the NaNs that might be in the wave (will mess up median and IQRs (they will return NaNs)
	elseif(paramisDefault(wTimeSlow)==1)//if it has not been declared
		//Access points between cursor waves
		Duplicate/R=[p1,p2]/Free/O w1D, StatsWave
		wavetransform ZapNaNs StatsWave
	endif

	//Perform stats and generate output
	WaveStats/Q StatsWave
	Statsquantiles/Q StatsWave
	Print "Stats from "+nameofwave(W1D)+" between the histogram points of "+num2str(p1)+" and "+num2str(p2)+"."
	Print "Average = "+num2str(V_Avg)+". StdDev = "+num2str(V_SDev)+". Median = "+num2str(V_Median)+". IQR = "+num2str(V_Q25)+"/"+num2str(V_Q75)+"."
	Print "nPnts = "+num2str(V_npnts)
	
	if(paramisdefault(wTimeSlow)==0)
		print "P2P_Stats_Hist("+nameOfWave(W2D)+","+nameofWave(wTimeFast)+","+nameofwave(w1D)+","+"wTimeSlow="+nameofwave(wTimeSlow)+")"
	elseif(paramisDefault(wTimeSlow)==1)
		print "P2P_Stats_Hist("+nameOfWave(W2D)+","+nameofWave(wTimeFast)+","+nameofwave(w1D)+","+")"
	endif

	//Delete Stats Waves
	killwaves/Z W_StatsQuantiles
	killwaves/z W_WaveStats
	
End

//AJD 8/24/25 Interp 2 SP2 TimeFrame
Function Interp2SP2TimeFrame_Button(ba) : ButtonControl
	STRUCT WMButtonAction &ba
	switch(ba.eventCode)
		case 1: //mouse up
			doalert/T="Data Folder Check" 2, "Are you in the datafolder of intrest?"
			if(V_flag==1)
			elseif(V_Flag==2 || V_Flag==3)
				abort "Aborting procedure."
			endif
			//Prompt Variables
			string wListIdentify_Str = ""
			string TWave_UserStr = ""
//			string X2_Str = ""
		
			Prompt wListIdentify_Str, "What is the identifying string to create the wavelist?"
			prompt TWave_UserStr, "What faster time wave?"
//			prompt X2_Str, "What is the slower time wave?"
			doprompt "Please Enter the following infomation.", wListIdentify_Str, TWave_UserStr//,X2_Str
			if(V_Flag==1)
				abort "User Aborted."
			endif
			wave TWave_User = $TWave_UserStr
//			wave X2 = $X2_Str
			Interp2SP2TimeFrame(wListIdentify_Str,TWave_User)
		case 2:
			break
		endswitch
end

//Interpolate wavelist to SP2 waves in the SP2 toolkit; this will be helpful when looking at different timeframes during an analysis.
Function Interp2SP2TimeFrame(wListIdentify_Str,TWave_User)

	//Establish Function Parameters
	String wListIdentify_Str
	Wave TWave_User
	
	//Establish Local Parameters
	String FindWList = "*"+wListIdentify_Str+"*"
	string SigWaves_User = wavelist(FindWList, ";", "TEXT:0")
	variable nWaves = itemsinlist(SigWaves_User,";") //How many waves does the userwavelist contain?
	variable idx
	
	//Find SP2 waves
//	String DFSeeker_Raw ="*_SP2"; String DFSeeker_INI = "INI"; String DFSeeker_PBP = "*_SP2_PBP"
//	String DFSeeker_ConcTser = "ConcTser";	String DFSeeker_LEOBase = "LEO"; String DFSeeker_LEOMain = "Main"
//	String DFSeeker_LEOTrace = "TraceFit"; String DFSeeker_SDTSer = "SizeDistTser";	String List_DFREF = ""
//	List_DFREF = SP2FindImportantDFs()
	
	String List_DFREF = SP2FindImportantDFs()
	String ConcTSerDF = stringfromlist(3,List_DFREF,";")
	
	setdatafolder ConcTserDF
	
	
	
	
End