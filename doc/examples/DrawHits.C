
// Example macro for drawing hits for all JLEIC detectors.
// See README.md in /eic/examples directory for mor info.
//
// run with:
//
//  root output.root -x DrawHits.C
//

void DrawHits()
{
	TTree *flux = (TTree*)gROOT->FindObject("flux");
	
	// NOTE: Here we plot lab Z along the canvas' X -axis and
	// lab X along the canvas' Z - axis (i.e. into screen).
	// This more closely matches the most illustrations of
	// the detector.
	TH3F *axes = new TH3F("axes", "JLEIC Hits;Z (cm);Y (cm); X (cm)", 100, -4000.0, 5000.0, 100, -2500.0, 2500.0, 100, -2500.0, 2500.0);
	axes->GetXaxis()->SetTitleOffset(2);
	axes->GetYaxis()->SetTitleOffset(2);
	axes->GetZaxis()->SetTitleOffset(2);
	axes->Draw();

	// Compton and tagger
	flux->SetMarkerColor(kBlack);
	flux->Draw("avg_x:avg_y:avg_z", "id>=00000 && id<20000", "same");

	// EMCAL Barrel
	flux->SetMarkerColor(kGreen+2);
	flux->Draw("avg_x:avg_y:avg_z", "id>=31000 && id<32000", "same");

	// EMCAL Upstream outer
	flux->SetMarkerColor(kGreen+1);
	flux->Draw("avg_x:avg_y:avg_z", "id>=34000 && id<35000", "same");

	// EMCAL Upstream inner
	flux->SetMarkerColor(kGreen+2);
	flux->Draw("avg_x:avg_y:avg_z", "id>=35000 && id<36000", "same");

	// Silicon tracker
	// n.b. 60000-7000 are tubes that look to be virtual planes
	flux->SetMarkerColor(kRed);
	flux->Draw("avg_x:avg_y:avg_z", "id>=50000 && id<51000", "same");

	// GEM Downstream
	//   527XX=upstream 528XX=mid 529XX=downstream
	flux->SetMarkerColor(kBlue);
	flux->Draw("avg_x:avg_y:avg_z", "id>=52700 && id<53000", "same");

	// GEM/TRD
	//   530XX=upstream  531XX=downstream
	flux->SetMarkerColor(kBlue+2);
	flux->Draw("avg_x:avg_y:avg_z", "id>=53000 && id<53200", "same");

	// GEM Upstream
	//   Numbering goes from downstrea (closest to IP) to upstream
	//   535XX - 538XX=upstream
	flux->SetMarkerColor(kBlue);
	flux->Draw("avg_x:avg_y:avg_z", "id>=53500 && id<53900", "same");
}

