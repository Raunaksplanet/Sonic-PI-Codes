use_bpm 100

# Bassline
live_loop :bass do
  use_synth :fm
  play :e2, release: 0.5, amp: 1.5
  sleep 0.5
  play :e2, release: 0.5, amp: 1.2
  sleep 0.5
  play :g2, release: 0.5, amp: 1.5
  sleep 0.5
  play :b2, release: 0.5, amp: 1.2
  sleep 0.5
end

# Kick
live_loop :kick do
  sample :bd_haus, amp: 2
  sleep 1
end

# Snare
live_loop :snare do
  sleep 0.5
  sample :sn_dolf, amp: 1
  sleep 0.5
end

# Hi-hats
live_loop :hats do
  sleep 0.25
  sample :drum_cymbal_closed, amp: 0.5
end

# Melody
live_loop :melody do
  use_synth :blade
  play_pattern_timed [:e4, :g4, :b4, :g4, :e5, :b4, :g4], [0.5,0.5,0.5,0.5,1,0.5,1], release: 0.8, amp: 1.3
end

# Ambient pad
live_loop :pad do
  sync :bass
  use_synth :hollow
  play_chord [:e3, :g3, :b3, :e4], release: 4, amp: 0.6
  sleep 4
end