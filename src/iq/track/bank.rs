// SPDX-License-Identifier: AGPL-3.0-only
//! The tracking bank (many channels on one stream) and the replay of one stream through
//! many loop designs.

use super::channel::{Channel, ChannelInit, EpochOutput};
use super::LoopConfig;
use crate::iq::{Cf64, IqError, IqSource, SampleSpec};

/// Samples read from a source per chunk.
const CHUNK: usize = 1 << 16;

/// `N` channels fed from one sample stream.
#[derive(Debug)]
pub struct TrackingBank {
    spec: SampleSpec,
    channels: Vec<Channel>,
}

impl TrackingBank {
    /// A bank on a stream sampled as `spec` with one channel per `(init, config)` pair.
    pub fn new(spec: SampleSpec, channels: &[(ChannelInit, LoopConfig)]) -> Result<Self, String> {
        let channels = channels
            .iter()
            .map(|(init, cfg)| Channel::new(&spec, init, cfg))
            .collect::<Result<Vec<_>, _>>()?;
        Ok(Self { spec, channels })
    }

    /// The stream's sampling.
    pub fn spec(&self) -> SampleSpec {
        self.spec
    }

    /// The channels, in construction order.
    pub fn channels(&self) -> &[Channel] {
        &self.channels
    }

    /// Feed the next `samples` of the stream to every channel; `out[i]` receives channel
    /// `i`'s loop updates (`out` is resized to the channel count).
    pub fn process(&mut self, samples: &[Cf64], out: &mut Vec<Vec<EpochOutput>>) {
        out.resize_with(self.channels.len(), Vec::new);
        for (ch, o) in self.channels.iter_mut().zip(out.iter_mut()) {
            ch.process(samples, o);
        }
    }

    /// Read `src` to its end (or to `max_samples`) and return every channel's loop
    /// updates. Memory grows with the number of updates kept; use [`Self::process`] on
    /// chunks to stream instead.
    pub fn run(
        &mut self,
        src: &mut dyn IqSource,
        max_samples: Option<u64>,
    ) -> Result<Vec<Vec<EpochOutput>>, IqError> {
        let mut out = Vec::new();
        out.resize_with(self.channels.len(), Vec::new);
        let mut buf = vec![Cf64::default(); CHUNK];
        let mut done = 0u64;
        loop {
            let want = match max_samples {
                Some(m) => (m.saturating_sub(done)).min(CHUNK as u64) as usize,
                None => CHUNK,
            };
            if want == 0 {
                break;
            }
            let n = src.read(&mut buf[..want])?;
            if n == 0 {
                break;
            }
            self.process(&buf[..n], &mut out);
            done += n as u64;
        }
        Ok(out)
    }
}

/// One loop design's results from [`replay`].
#[derive(Clone, Debug, PartialEq)]
pub struct ReplayResult {
    /// The loop design.
    pub config: LoopConfig,
    /// Loop updates per channel, in the order of the `inits` given to [`replay`].
    pub channels: Vec<Vec<EpochOutput>>,
}

/// Run `src` (to its end or to `max_samples`) through every loop design in `configs`, each
/// tracking every signal in `inits`. The stream is read once: the bank holds one channel
/// per (design, signal) pair, so the results are those of running each design alone.
pub fn replay(
    src: &mut dyn IqSource,
    inits: &[ChannelInit],
    configs: &[LoopConfig],
    max_samples: Option<u64>,
) -> Result<Vec<ReplayResult>, IqError> {
    let pairs: Vec<(ChannelInit, LoopConfig)> = configs
        .iter()
        .flat_map(|c| inits.iter().map(move |i| (i.clone(), c.clone())))
        .collect();
    let mut bank = TrackingBank::new(src.spec(), &pairs).map_err(IqError::Format)?;
    let mut out = bank.run(src, max_samples)?.into_iter();
    Ok(configs
        .iter()
        .map(|c| ReplayResult {
            config: c.clone(),
            channels: out.by_ref().take(inits.len()).collect(),
        })
        .collect())
}
