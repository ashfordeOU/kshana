// Panel state for the Kshana score panel: wx-free so it is unit-tested on its own.
// Advisory software, not type-approved equipment: the operator stays responsible.
#pragma once
#include <string>
#include "pksht.h"

namespace kshana {

enum class Level { Waiting, Normal, Warn, Alarm, Stale };

struct PanelConfig {
  int raise_after = 1;         // consecutive sentences at a worse level before it is shown
  int clear_after = 10;        // consecutive sentences at a better level before it is lowered
  double stale_after_s = 10;   // no $PKSHT for this long: Stale (no score is current)
};

class TrustState {
 public:
  explicit TrustState(PanelConfig c = PanelConfig()) : cfg_(c) {}

  // Feed one NMEA sentence. Returns true if it was a valid $PKSHT (anything else is ignored).
  bool feed(const std::string& sentence, double now_s) {
    Trust t;
    if (!parse_pksht(sentence, t)) return false;
    last_ = t;
    have_ = true;
    last_rx_s_ = now_s;
    Level want = t.band == 'U' ? Level::Alarm : t.band == 'D' ? Level::Warn : Level::Normal;
    if (want == shown_) {
      pending_n_ = 0;
    } else {
      if (want != pending_) { pending_ = want; pending_n_ = 0; }
      pending_n_++;
      bool worse = rank(want) > rank(shown_);
      if (pending_n_ >= (worse ? cfg_.raise_after : cfg_.clear_after)) {
        if (want == Level::Alarm) alarm_edge_ = true;
        shown_ = want;
        pending_n_ = 0;
      }
    }
    return true;
  }

  // The level to display at monotonic time now_s.
  Level level(double now_s) const {
    if (!have_) return Level::Waiting;
    if (cfg_.stale_after_s > 0 && now_s - last_rx_s_ > cfg_.stale_after_s) return Level::Stale;
    return shown_;
  }

  // True once each time the alarm level is entered; the caller sounds or shows its alert.
  bool take_alarm_edge() {
    bool e = alarm_edge_;
    alarm_edge_ = false;
    return e;
  }

  bool has_data() const { return have_; }
  const Trust& last() const { return last_; }
  double age_s(double now_s) const { return have_ ? now_s - last_rx_s_ : -1.0; }

 private:
  static int rank(Level l) { return l == Level::Alarm ? 3 : l == Level::Warn ? 2 : 1; }
  PanelConfig cfg_;
  Trust last_;
  bool have_ = false;
  double last_rx_s_ = 0;
  Level shown_ = Level::Normal;
  Level pending_ = Level::Normal;
  int pending_n_ = 0;
  bool alarm_edge_ = false;
};

}  // namespace kshana
