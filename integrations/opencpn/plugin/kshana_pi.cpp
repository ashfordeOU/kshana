#include "kshana_pi.h"
#include <wx/dcbuffer.h>
#include <wx/fileconf.h>
#include <wx/spinctrl.h>
#include <wx/timer.h>
#include <wx/tokenzr.h>

extern "C" DECL_EXP opencpn_plugin* create_pi(void* ppimgr) { return new kshana_pi(ppimgr); }
extern "C" DECL_EXP void destroy_pi(opencpn_plugin* p) { delete p; }

static const char* kDisclaimer =
    "Advisory software, not type-approved navigation equipment. The operator stays responsible "
    "for the safe navigation of the vessel.";

// A small floating window: score, band, gate, top reasons, age. Drawn, not laid out, so it is
// one self-contained piece of code.
class KshanaPanel : public wxFrame {
 public:
  KshanaPanel(wxWindow* parent, kshana_pi* pi)
      : wxFrame(parent, wxID_ANY, "Kshana trust", wxDefaultPosition, wxSize(300, 230),
                wxCAPTION | wxCLOSE_BOX | wxRESIZE_BORDER | wxFRAME_FLOAT_ON_PARENT |
                    wxFRAME_TOOL_WINDOW),
        pi_(pi),
        timer_(this) {
    SetBackgroundStyle(wxBG_STYLE_PAINT);
    Bind(wxEVT_PAINT, &KshanaPanel::OnPaint, this);
    Bind(wxEVT_TIMER, [this](wxTimerEvent&) { pi_->Tick(); Refresh(); });
    Bind(wxEVT_CLOSE_WINDOW, [this](wxCloseEvent&) { Hide(); });
    timer_.Start(1000);
  }
  ~KshanaPanel() override { timer_.Stop(); }

 private:
  static wxColour ColourFor(kshana::Level l) {
    switch (l) {
      case kshana::Level::Normal: return wxColour(46, 125, 50);
      case kshana::Level::Warn: return wxColour(230, 150, 0);
      case kshana::Level::Alarm: return wxColour(198, 40, 40);
      case kshana::Level::Stale: return wxColour(120, 120, 120);
      default: return wxColour(90, 90, 90);
    }
  }
  static const char* NameFor(kshana::Level l, char band) {
    switch (l) {
      case kshana::Level::Waiting: return "WAITING FOR $PKSHT";
      case kshana::Level::Stale: return "NO CURRENT SCORE";
      default: break;
    }
    switch (band) {
      case 'N': return "NOMINAL";
      case 'D': return "DEGRADED";
      case 'U': return "UNTRUSTED";
      default: return "CALIBRATING";
    }
  }

  void OnPaint(wxPaintEvent&) {
    wxAutoBufferedPaintDC dc(this);
    dc.SetBackground(*wxWHITE_BRUSH);
    dc.Clear();
    const double now = pi_->Now();
    const kshana::Level lv = pi_->state_.level(now);
    const kshana::Trust& t = pi_->state_.last();
    wxSize sz = GetClientSize();
    dc.SetBrush(wxBrush(ColourFor(lv)));
    dc.SetPen(*wxTRANSPARENT_PEN);
    dc.DrawRectangle(0, 0, sz.x, 64);
    dc.SetTextForeground(*wxWHITE);
    dc.SetFont(wxFont(26, wxFONTFAMILY_SWISS, wxFONTSTYLE_NORMAL, wxFONTWEIGHT_BOLD));
    wxString score = (pi_->state_.has_data() && t.has_score && lv != kshana::Level::Stale)
                         ? wxString::Format("%.0f", t.score)
                         : wxString("--");
    dc.DrawText(score, 12, 12);
    dc.SetFont(wxFont(11, wxFONTFAMILY_SWISS, wxFONTSTYLE_NORMAL, wxFONTWEIGHT_BOLD));
    dc.DrawText(NameFor(lv, t.band), 100, 22);
    dc.SetTextForeground(*wxBLACK);
    dc.SetFont(wxFont(9, wxFONTFAMILY_SWISS, wxFONTSTYLE_NORMAL, wxFONTWEIGHT_NORMAL));
    int y = 72;
    if (pi_->state_.has_data()) {
      const char* g = t.gate == 'W' ? "gate: fix marked invalid" : t.gate == 'P' ? "gate: passing" : "gate: off";
      dc.DrawText(g, 12, y);
      y += 16;
      for (size_t i = 0; i < t.reasons.size() && i < 2; i++) {
        dc.DrawText(wxString::Format("%s  -%.1f", t.reasons[i].monitor, t.reasons[i].points), 12, y);
        y += 16;
      }
      dc.DrawText(wxString::Format("age %.0f s", pi_->state_.age_s(now)), 12, y);
      y += 16;
    }
    dc.SetTextForeground(wxColour(80, 80, 80));
    dc.SetFont(wxFont(8, wxFONTFAMILY_SWISS, wxFONTSTYLE_NORMAL, wxFONTWEIGHT_NORMAL));
    // wrap the disclaimer to the window width, word by word
    wxString line, word;
    int dy = sz.y - 52;
    wxStringTokenizer tk(kDisclaimer, " ");
    while (tk.HasMoreTokens()) {
      word = tk.GetNextToken();
      wxString trial = line.empty() ? word : line + " " + word;
      if (dc.GetTextExtent(trial).x > sz.x - 20 && !line.empty()) {
        dc.DrawText(line, 10, dy);
        dy += 12;
        line = word;
      } else {
        line = trial;
      }
    }
    dc.DrawText(line, 10, dy);
  }

  kshana_pi* pi_;
  wxTimer timer_;
};

kshana_pi::kshana_pi(void* pmgr) : opencpn_plugin_118(pmgr) {
  wxImage img(32, 32);  // a plain shield-ish glyph drawn in code: no binary asset to ship
  img.InitAlpha();
  for (int y = 0; y < 32; y++)
    for (int x = 0; x < 32; x++) {
      bool in = x >= 4 && x < 28 && y >= 3 && y < 29 && (y < 20 || abs(x - 16) < (29 - y) * 2);
      img.SetRGB(x, y, 30, 90, 160);
      img.SetAlpha(x, y, in ? 255 : 0);
    }
  icon_ = wxBitmap(img);
}

kshana_pi::~kshana_pi() {}

wxString kshana_pi::GetLongDescription() {
  return wxString("Shows the Kshana receiver-trust score (0-100), band, gate state and top reasons from the "
                  "$PKSHT sentence in OpenCPN's NMEA stream, and sounds an alert when trust becomes "
                  "untrusted. Needs `kshana receiver-trust live --gate` (or --pksht) feeding a connection. ") +
         kDisclaimer;
}

double kshana_pi::Now() const { return clock_.TimeInMicro().ToDouble() / 1e6; }

void kshana_pi::LoadConfig() {
  wxFileConfig* c = GetOCPNConfigObject();
  if (!c) return;
  c->SetPath("/PlugIns/KshanaTrust");
  c->Read("Sound", &sound_, true);
  c->Read("AutoShow", &auto_show_, true);
  long l;
  c->Read("RaiseAfter", &l, 1); cfg_.raise_after = l < 1 ? 1 : (int)l;
  c->Read("ClearAfter", &l, 10); cfg_.clear_after = l < 1 ? 1 : (int)l;
  double d;
  c->Read("StaleAfterS", &d, 10.0); cfg_.stale_after_s = d;
}

void kshana_pi::SaveConfig() {
  wxFileConfig* c = GetOCPNConfigObject();
  if (!c) return;
  c->SetPath("/PlugIns/KshanaTrust");
  c->Write("Sound", sound_);
  c->Write("AutoShow", auto_show_);
  c->Write("RaiseAfter", (long)cfg_.raise_after);
  c->Write("ClearAfter", (long)cfg_.clear_after);
  c->Write("StaleAfterS", cfg_.stale_after_s);
}

int kshana_pi::Init() {
  LoadConfig();
  state_ = kshana::TrustState(cfg_);
  clock_.Start();
  tool_id_ = InsertPlugInTool("", &icon_, &icon_, wxITEM_NORMAL, "Kshana trust",
                              "Kshana GNSS trust score (advisory)", nullptr, -1, 0, this);
  panel_ = new KshanaPanel(GetOCPNCanvasWindow(), this);
  return WANTS_NMEA_SENTENCES | WANTS_PREFERENCES | INSTALLS_TOOLBAR_TOOL | WANTS_CONFIG;
}

bool kshana_pi::DeInit() {
  SaveConfig();
  if (tool_id_ >= 0) RemovePlugInTool(tool_id_);
  tool_id_ = -1;
  if (panel_) {
    panel_->Destroy();
    panel_ = nullptr;
  }
  return true;
}

void kshana_pi::OnToolbarToolCallback(int) {
  if (panel_) panel_->Show(!panel_->IsShown());
}

void kshana_pi::SetNMEASentence(wxString& sentence) {
  if (!sentence.StartsWith("$PKSHT")) return;
  if (!state_.feed(std::string(sentence.mb_str()), Now())) return;
  if (state_.take_alarm_edge()) {
    if (sound_) wxBell();
    if (panel_ && auto_show_) panel_->Show();
  }
  if (panel_) panel_->Refresh();
}

void kshana_pi::Tick() {}

void kshana_pi::ShowPreferencesDialog(wxWindow* parent) {
  wxDialog dlg(parent, wxID_ANY, "Kshana trust", wxDefaultPosition, wxDefaultSize,
               wxDEFAULT_DIALOG_STYLE);
  wxBoxSizer* v = new wxBoxSizer(wxVERTICAL);
  wxCheckBox* snd = new wxCheckBox(&dlg, wxID_ANY, "Sound an alert when trust becomes untrusted");
  snd->SetValue(sound_);
  wxCheckBox* show = new wxCheckBox(&dlg, wxID_ANY, "Show the panel when trust becomes untrusted");
  show->SetValue(auto_show_);
  wxSpinCtrl* raise = new wxSpinCtrl(&dlg, wxID_ANY, "", wxDefaultPosition, wxDefaultSize,
                                     wxSP_ARROW_KEYS, 1, 60, cfg_.raise_after);
  wxSpinCtrl* clear = new wxSpinCtrl(&dlg, wxID_ANY, "", wxDefaultPosition, wxDefaultSize,
                                     wxSP_ARROW_KEYS, 1, 600, cfg_.clear_after);
  wxSpinCtrl* stale = new wxSpinCtrl(&dlg, wxID_ANY, "", wxDefaultPosition, wxDefaultSize,
                                     wxSP_ARROW_KEYS, 0, 3600, (int)cfg_.stale_after_s);
  v->Add(snd, 0, wxALL, 8);
  v->Add(show, 0, wxALL, 8);
  wxFlexGridSizer* g = new wxFlexGridSizer(2, 6, 8);
  g->Add(new wxStaticText(&dlg, wxID_ANY, "Sentences at a worse level before it is shown"));
  g->Add(raise);
  g->Add(new wxStaticText(&dlg, wxID_ANY, "Sentences at a better level before it is lowered"));
  g->Add(clear);
  g->Add(new wxStaticText(&dlg, wxID_ANY, "No $PKSHT for this many seconds = no current score (0 = off)"));
  g->Add(stale);
  v->Add(g, 0, wxALL, 8);
  wxStaticText* note = new wxStaticText(&dlg, wxID_ANY, kDisclaimer);
  note->Wrap(420);
  v->Add(note, 0, wxALL, 8);
  v->Add(dlg.CreateStdDialogButtonSizer(wxOK | wxCANCEL), 0, wxALL | wxALIGN_RIGHT, 8);
  dlg.SetSizerAndFit(v);
  if (dlg.ShowModal() == wxID_OK) {
    sound_ = snd->GetValue();
    auto_show_ = show->GetValue();
    cfg_.raise_after = raise->GetValue();
    cfg_.clear_after = clear->GetValue();
    cfg_.stale_after_s = stale->GetValue();
    state_ = kshana::TrustState(cfg_);
    SaveConfig();
  }
}
