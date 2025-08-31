use_bpm 100

# Bassline
live_loop :bass do
  use_synth :fm
  play :e2, release: 0.5, amp: 1.5
  sleep 0.5
  play :g2, release: 0.5
  sleep 0.5
  play :a2, release: 0.5
  sleep 0.5
  play :g2, release: 0.5
  sleep 0.5
end

# Kick & Snare
live_loop :drums do
  sample :bd_haus, amp: 2
  sleep 0.5
  sample :sn_dub, amp: 1.2
  sleep 0.5
end

# Hi-hats
live_loop :hats do
  sleep 0.25
  sample :drum_cymbal_closed, amp: 0.7
  sleep 0.25
end

# Melody
live_loop :lead do
  use_synth :prophet
  play_pattern_timed [:e4, :g4, :a4, :g4, :e4, :g4, :b4, :a4], 0.25, release: 0.3, cutoff: rrand(70, 120)
end

# Ambient pad for cool vibes
live_loop :pad do
  use_synth :hollow
  play :e3, sustain: 4, release: 2, amp: 0.6
  sleep 4
end


