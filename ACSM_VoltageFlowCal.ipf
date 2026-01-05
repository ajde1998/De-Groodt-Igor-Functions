#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.


Function VoltageFlowCal(flow, voltage)		//This function will take the voltage given by the Pop table's 'pressure board V2' and convert it into pressure. 
	wave flow, voltage	//Provide the wave that contains the flows and the voltages recorded. 
	variable npnts = dimsize(voltage,0)
	variable pressure 
	variable c_mbar = 0.125
	variable c_Pa = 12.5
	variable c_Torr = 0.094
	variable FS_CRM373 = 10
	//pressure equation from 'CMR371>>>RM375 instruction manual' page 12 (we have a CRM373)
	
	//
	//
	//
	// p = (U - 1) x c (F.S.)
	//
	//where U is the measured signal out
	
	//c is a converstion factor to either mbar, Pa, or Torr
	//c(mbar) = 0.125; c(Pa) = 12.5; c(Torr) = 0.094
	
	//F.S. or Full scale (percent of full scale) -> For example, a 100 psi gauge with 0.1 % of FS accuracy would be accurate to ± 0.1 psi across its entire range. By convention, a gauge specified as 0.1% accuracy is implied to be 0.1% FS. 
	//from: https://www.ametekcalibration.com/knowledge/pressure-calibration/of-reading-vs-of-scale#:~:text=%E2%80%9C%25%20of%20full%20scale%20(FS,implied%20to%20be%200.1%25%20FS.
	//for the CRM373 the F.S. value is 10 (in the manual example they use 1000 as they use the CRM371 model as an example)
	
	//Convert flow rate from ccm to ccs
	
	duplicate/O Flow, Flow_CCS
	
	Flow_CCS = flow_CCS/60			// cc		   1 min				cc
										//____	 *	_____________ == ________ == ccs
										// min		  60 seconds			sec
	
	
	
	//set up the loop do go through all of the voltages
	variable i 
	make/o/n=(npnts) Converted_Pressure_Mbar = NaN
	note/k Converted_Pressure_Mbar "This is the converted pressure from the equation provided in the Pumps manual (see procedure for more information)."
	for(i=0;i<npnts;i+=1)
		Converted_Pressure_Mbar[i] = (voltage[i]-1) * c_mbar * FS_CRM373
	
	Endfor
	
	//Create the graph
	display
	appendtograph Flow_CCS vs Converted_Pressure_Mbar
	label left "Flowrate in CCS"
	label bottom "Pressure in Mbar Converted From Voltage reading"
	TextBox/C/N=text0/A=LT "At low pressures there is nonlinearity due to the change in the flow regime from viscous to kinetic. ";DelayUpdate
	AppendText "Ensure that you are only fitting the linear portion of the data. "
End