// SPDX-License-Identifier: GPL-3.0-or-later
// Kshana trust score panel for OpenCPN. Reads the $PKSHT sentence from OpenCPN's NMEA stream,
// so it needs no connection of its own. Advisory software, not type-approved equipment:
// the operator stays responsible for the safe navigation of the vessel.
#pragma once
#include <wx/wx.h>
#include "ocpn_plugin.h"
#include "trust_state.h"

class KshanaPanel;

class kshana_pi : public opencpn_plugin_118 {
 public:
  explicit kshana_pi(void* pmgr);
  ~kshana_pi() override;

  int Init() override;
  bool DeInit() override;
  int GetAPIVersionMajor() override { return 1; }
  int GetAPIVersionMinor() override { return 18; }
  int GetPlugInVersionMajor() override { return 0; }
  int GetPlugInVersionMinor() override { return 35; }
  wxBitmap* GetPlugInBitmap() override { return &icon_; }
  wxString GetCommonName() override { return "Kshana trust"; }
  wxString GetShortDescription() override {
    return "GNSS trust score panel (advisory, not type-approved)";
  }
  wxString GetLongDescription() override;
  int GetToolbarToolCount() override { return 1; }
  void OnToolbarToolCallback(int id) override;
  void SetNMEASentence(wxString& sentence) override;
  void ShowPreferencesDialog(wxWindow* parent) override;

  // called by the panel's timer
  void Tick();

 private:
  void LoadConfig();
  void SaveConfig();
  double Now() const;

  wxBitmap icon_;
  int tool_id_ = -1;
  KshanaPanel* panel_ = nullptr;
  kshana::TrustState state_;
  kshana::PanelConfig cfg_;
  bool sound_ = true;
  bool auto_show_ = true;
  bool seen_pksht_ = false;
  char last_logged_band_ = 0;
  wxStopWatch clock_;
  friend class KshanaPanel;
};
