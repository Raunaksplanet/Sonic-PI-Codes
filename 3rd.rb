# Sonic Pi Synth Wave Track - "Neon Pulse"
# BPM and setup
use_bpm 128

# Live Loop: Driving 4/4 Kick and Clap
live_loop :drums do
  sample :bd_tek, amp: 2
  sleep 1
  sample :drum_snare_soft, amp: 1.2
  sleep 0.5
  sample :bd_tek, amp: 2, rate: 1.2
  sleep 0.5
  sample :drum_snare_soft, amp: 1.2
  sleep 1
  sample :bd_tek, amp: 2
  sleep 0.5
  sample :drum_cymbal_closed, amp: 0.6
  sleep 0.5
end

# Live Loop: Hi-Hats for constant energy
live_loop :hihats do
  16.times do
    sample :drum_cymbal_closed, amp: 0.4, rate: 1.5 + rand(0.2)
    sleep 0.25
  end
end

# Live Loop: Pulsing Bassline
live_loop :bass, delay: 16 do # Starts after 16 beats (intro)
  use_synth :fm
  use_transpose -12 # Play an octave lower
  with_fx :lpf, cutoff: 80 do
    with_fx :distortion, distort: 0.3 do
      notes = (ring :e2, :e2, :g2, :e2, :a2, :g2, :e2, :e2)
      sleeps = (ring 1.5, 0.5, 0.5, 0.5, 1, 1, 1, 1)
      
      notes.zip(sleeps).each do |n, s|
        play n, release: 0.3, amp: 1.5, cutoff: 70
        sleep s
      end
    end
  end
end

# Live Loop: Arpeggiated Synth
live_loop :arp, delay: 16 do # Starts after 16 beats (intro)
  use_synth :dpulse
  with_fx :reverb, room: 0.7, damp: 0.8 do
    notes = (scale :e3, :minor_pentatonic, num_octaves: 2).shuffle
    play_pattern_timed notes, 0.125, release: 0.1, amp: 0.4
  end
end

# SECTION: Main Riff (The Cool Part!)
# This defines the main melody pattern
define :main_riff do |note, sleep_time, amp_val|
  use_synth :chipbass
  with_fx :ixi_techno, phase: 16, cutoff_min: 90, cutoff_max: 120 do
    play note, release: 0.2, amp: amp_val
    sleep sleep_time
  end
end

# Live Loop: Main Lead Melody
live_loop :lead, delay: 32 do # Starts after 32 beats (intro + 16)
  use_bpm 128
  
  # Melody Pattern in E Minor
  main_riff :e4, 0.5, 1.0
  main_riff :g4, 0.5, 1.0
  main_riff :b4, 0.5, 1.0
  main_riff :a4, 0.5, 1.0
  main_riff :g4, 1, 1.0
  main_riff :e4, 0.5, 1.0
  main_riff :g4, 0.5, 1.0
  main_riff :a4, 1, 1.0
  main_riff :g4, 1, 1.0
  sleep 1
end

# INTRO: A cool riser and cymbal to start
puts "Starting the Intro..."
sample :drum_roll, rate: 0.5, amp: 1.5
sleep 2
sample :drum_cymbal_open, amp: 1.5
sleep 14 # Sleeps for the remainder of the 16-beat intro

# OUTRO: A fade-out effect (This will stop everything after 96 beats)
live_loop :conductor do
  sleep 96 # Total length of the piece (96 beats)
  puts "Fading out..."
  # This slowly reduces the global amplitude over 8 beats
  with_fx :level, amp: 1 do |ctrl|
    16.times do
      control ctrl, amp: 1 # This line needs a fix, see note below*
      sleep 0.5
    end
  end
  stop # This stops the conductor and all other live_loops
end