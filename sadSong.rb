use_bpm 60

# Soft piano-like chords
live_loop :chords do
  use_synth :piano
  play_chord [:a3, :c4, :e4], sustain: 3, release: 2, amp: 1.5
  sleep 4
  play_chord [:f3, :a3, :c4], sustain: 3, release: 2, amp: 1.5
  sleep 4
  play_chord [:d3, :f3, :a3], sustain: 3, release: 2, amp: 1.5
  sleep 4
  play_chord [:e3, :g3, :b3], sustain: 3, release: 2, amp: 1.5
  sleep 4
end

# Soft ambient background
live_loop :pad do
  sync :chords
  use_synth :hollow
  play_chord [:a2, :e3, :a3], release: 8, amp: 0.7
  sleep 8
end

# Gentle melody
live_loop :melody do
  use_synth :blade
  play_pattern_timed [:c5, :e5, :a4, :g4, :f4, :e4], [1, 1.5, 1, 2, 1, 2], release: 2, amp: 1
end

# Subtle heartbeat kick
live_loop :heartbeat do
  sample :bd_fat, amp: 1
  sleep 1.5
  sample :bd_fat, amp: 0.7
  sleep 2.5
end
