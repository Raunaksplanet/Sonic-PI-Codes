use_bpm 90

live_loop :heartbeat do
  sample :bd_haus, amp: 2, rate: 0.8
  sleep 1
  sample :bd_haus, amp: 1.5, rate: 0.7
  sleep 0.5
end

live_loop :dark_pad do
  use_synth :dark_ambience
  play choose([:c2, :d2, :f2]), sustain: 4, release: 4, amp: 0.5
  sleep 4
end

live_loop :hi_tension do
  sync :heartbeat
  use_synth :blade
  play choose([:g4, :a4, :c5]), release: 0.3, cutoff: rrand(70, 110), amp: 0.7
  sleep 0.25
end

live_loop :metal_hits do
  sync :heartbeat
  with_fx :reverb, room: 0.8 do
    sample :drum_cymbal_hard, amp: 0.4, rate: 0.5 if one_in(6)
  end
  sleep 1
end

live_loop :strings do
  use_synth :prophet
  with_fx :slicer, phase: 0.25, mix: 0.4 do
    play_chord [:c3, :g3, :b3], sustain: 8, release: 8, amp: 0.6
    sleep 8
  end
end