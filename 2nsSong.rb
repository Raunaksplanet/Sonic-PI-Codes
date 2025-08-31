
use_bpm 90

live_loop :drums do
  sample :bd_haus, amp: 2
  sleep 0.5
  sample :sn_dolf, amp: 0.8 if spread(3,8).tick
  sleep 0.5
end

live_loop :hats do
  sync :drums
  sample :drum_cymbal_closed, amp: 0.5 if spread(7,16).tick
  sleep 0.25
end

live_loop :bass do
  sync :drums
  use_synth :fm
  play :e2, release: 0.4, cutoff: rrand(70, 120)
  sleep 0.5
  play :g2, release: 0.3, cutoff: rrand(70, 120)
  sleep 0.5
  play :b1, release: 0.4, cutoff: rrand(70, 120)
  sleep 1
end

live_loop :chords do
  sync :drums
  use_synth :prophet
  play_chord chord(:e3, :minor7), sustain: 2, release: 2, amp: 1.5
  sleep 4
end

live_loop :melody do
  sync :drums
  use_synth :blade
  with_fx :echo, phase: 0.25, decay: 4 do
    play scale(:e4, :minor_pentatonic).choose, release: 0.2, amp: 1.3
    sleep 0.25
  end
end
