/*
 * This macro substracts the background thresholds, and measures the area fraction 
 *
 *2019-10-09
 */

 // clean up workspace
run("Close All");

 //load data 
//run("Cell Colony (31K)");
open("/Users/ankitachavan/Desktop/Cell_Colony.tif");

//Subtract background
run("Subtract Background...", "rolling=100 light sliding");

// Threshold
setAutoThreshold("Otsu");
setOption("BlackBackground", true);
run("Convert to Mask");

// Measure
run("Set Measurements...", "area_fraction display redirect=None decimal=3");
run("Analyze Particles...", "  show=Masks summarize");
