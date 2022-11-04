// TODO
// Test their CPU
// DirtPan?

thisProcess.openUDPPort(6789);

(
~raveSpeech1OutBus = Bus.new(index:0, numChannels:2);
~raveSpeech1Bus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[0].outBus = ~raveSpeech1Bus;
~raveSpeech1Ctl = RAVEControl(s,
    // modelFile:"path/to/rave_rt_models/speech_realtime.ts"
    modelFile:"path/to/rave_rt_models/rave_sigga_combined_rt.ts"
);
~raveSpeech1Synth = {
    var in = InBus.ar(~raveSpeech1Bus, 2);
    var out = Limiter.ar(
        RAVE.ar(~raveSpeech1Ctl, Mix.ar(in), \raveSpeech1Prior.kr(0), \raveSpeech1Temp.kr(0));
    );
    out = (in * (1 - \raveSpeech1Mix.kr(1))) + (out * \raveSpeech1Mix.kr(1));
    out = out * \raveSpeech1Gain.kr(1) * 0.8;
    out = out!~dirt.numChannels;
    //out = Pan2.ar(out, \raveSpeech1Pan.kr(-1.0));
    out = PitchShift.ar(out, \raveSpeech1PitchGrain.kr(0.2), \raveSpeech1PitchRatio.kr(1.0), \raveSpeech1PitchDisperse.kr(0.003), \raveSpeech1PitchTimeDisperse.kr(0.003));
}.play(outbus:~raveSpeech1OutBus);
)

(
~raveSpeech1Ctl.load(~raveSpeech1Synth);
OSCFunc({ |msg| ~raveSpeech1Synth.set(\raveSpeech1Mix,msg[1]);}, "/rave/speech1/mix", nil);
OSCFunc({ |msg| ~raveSpeech1Synth.set(\raveSpeech1Prior,msg[1]);}, "/rave/speech1/prior", nil);
OSCFunc({ |msg| ~raveSpeech1Synth.set(\raveSpeech1Temp,msg[1]);}, "/rave/speech1/temp", nil);
OSCFunc({ |msg| ~raveSpeech1Synth.set(\raveSpeech1Gain,msg[1]);}, "/rave/speech1/gain", nil);
OSCFunc({ |msg| ~raveSpeech1Synth.set(\raveSpeech1Pan,msg[1]);}, "/rave/speech1/pan", nil);
OSCFunc({ |msg| ~raveSpeech1Synth.set(\raveSpeech1PitchRatio,msg[1]);}, "/rave/speech1/pitch/ratio", nil);
OSCFunc({ |msg| ~raveSpeech1Synth.set(\raveSpeech1PitchGrain,msg[1]);}, "/rave/speech1/pitch/grain", nil);
OSCFunc({ |msg| ~raveSpeech1Synth.set(\raveSpeech1PitchDisperse,msg[1]);}, "/rave/speech1/pitch/disperse", nil);
OSCFunc({ |msg| ~raveSpeech1Synth.set(\raveSpeech1PitchTimeDisperse,msg[1]);}, "/rave/speech1/pitch/time", nil);
)

(
~raveSpeech2OutBus = Bus.new(index:2, numChannels:2);
~raveSpeech2Bus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[1].outBus = ~raveSpeech2Bus;
~raveSpeech2Ctl = RAVEControl(s,
    modelFile:"path/to/rave_rt_models/speech_realtime.ts"
);
~raveSpeech2Synth = {
    var in = InBus.ar(~raveSpeech2Bus, 2);
    var out = Limiter.ar(
        RAVE.ar(~raveSpeech2Ctl, Mix.ar(in), \raveSpeech2Prior.kr(0), \raveSpeech2Temp.kr(0));
    );
    out = (in * (1 - \raveSpeech2Mix.kr(1))) + (out * \raveSpeech2Mix.kr(1));
    out = out * \raveSpeech2Gain.kr(1) * 0.8;
    out = out!~dirt.numChannels;
    //out = Pan2.ar(out, \raveSpeech2Pan.kr(-1.0));
    out = PitchShift.ar(out, \raveSpeech2PitchGrain.kr(0.2), \raveSpeech2PitchRatio.kr(1.0), \raveSpeech2PitchDisperse.kr(0.003), \raveSpeech2PitchTimeDisperse.kr(0.003));
}.play(outbus:~raveSpeech2OutBus);
)

(
~raveSpeech2Ctl.load(~raveSpeech2Synth);
OSCFunc({ |msg| ~raveSpeech2Synth.set(\raveSpeech2Mix,msg[1]);}, "/rave/speech2/mix", nil);
OSCFunc({ |msg| ~raveSpeech2Synth.set(\raveSpeech2Prior,msg[1]);}, "/rave/speech2/prior", nil);
OSCFunc({ |msg| ~raveSpeech2Synth.set(\raveSpeech2Temp,msg[1]);}, "/rave/speech2/temp", nil);
OSCFunc({ |msg| ~raveSpeech2Synth.set(\raveSpeech2Gain,msg[1]);}, "/rave/speech2/gain", nil);
OSCFunc({ |msg| ~raveSpeech2Synth.set(\raveSpeech2Pan,msg[1]);}, "/rave/speech2/pan", nil);
OSCFunc({ |msg| ~raveSpeech2Synth.set(\raveSpeech2PitchRatio,msg[1]);}, "/rave/speech2/pitch/ratio", nil);
OSCFunc({ |msg| ~raveSpeech2Synth.set(\raveSpeech2PitchGrain,msg[1]);}, "/rave/speech2/pitch/grain", nil);
OSCFunc({ |msg| ~raveSpeech2Synth.set(\raveSpeech2PitchDisperse,msg[1]);}, "/rave/speech2/pitch/disperse", nil);
OSCFunc({ |msg| ~raveSpeech2Synth.set(\raveSpeech2PitchTimeDisperse,msg[1]);}, "/rave/speech2/pitch/time", nil);
)

(
~raveSpeech3OutBus = Bus.new(index:4, numChannels:2);
~raveSpeech3Bus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[2].outBus = ~raveSpeech3Bus;
~raveSpeech3Ctl = RAVEControl(s,
    modelFile:"path/to/rave_rt_models/speech_realtime.ts"
);
~raveSpeech3Synth = {
    var in = InBus.ar(~raveSpeech3Bus, 2);
    var out = Limiter.ar(
        RAVE.ar(~raveSpeech3Ctl, Mix.ar(in), \raveSpeech3Prior.kr(0), \raveSpeech3Temp.kr(0));
    );
    out = (in * (1 - \raveSpeech3Mix.kr(1))) + (out * \raveSpeech3Mix.kr(1));
    out = out * \raveSpeech3Gain.kr(1) * 0.8;
    out = out!~dirt.numChannels;
    //out = Pan2.ar(out, \raveSpeech3Pan.kr(-1.0));
    out = PitchShift.ar(out, \raveSpeech3PitchGrain.kr(0.2), \raveSpeech3PitchRatio.kr(1.0), \raveSpeech3PitchDisperse.kr(0.003), \raveSpeech3PitchTimeDisperse.kr(0.003));
}.play(outbus:~raveSpeech3OutBus);
)

(
~raveSpeech3Ctl.load(~raveSpeech3Synth);
OSCFunc({ |msg| ~raveSpeech3Synth.set(\raveSpeech3Mix,msg[1]);}, "/rave/speech3/mix", nil);
OSCFunc({ |msg| ~raveSpeech3Synth.set(\raveSpeech3Prior,msg[1]);}, "/rave/speech3/prior", nil);
OSCFunc({ |msg| ~raveSpeech3Synth.set(\raveSpeech3Temp,msg[1]);}, "/rave/speech3/temp", nil);
OSCFunc({ |msg| ~raveSpeech3Synth.set(\raveSpeech3Gain,msg[1]);}, "/rave/speech3/gain", nil);
OSCFunc({ |msg| ~raveSpeech3Synth.set(\raveSpeech3Pan,msg[1]);}, "/rave/speech3/pan", nil);
OSCFunc({ |msg| ~raveSpeech3Synth.set(\raveSpeech3PitchRatio,msg[1]);}, "/rave/speech3/pitch/ratio", nil);
OSCFunc({ |msg| ~raveSpeech3Synth.set(\raveSpeech3PitchGrain,msg[1]);}, "/rave/speech3/pitch/grain", nil);
OSCFunc({ |msg| ~raveSpeech3Synth.set(\raveSpeech3PitchDisperse,msg[1]);}, "/rave/speech3/pitch/disperse", nil);
OSCFunc({ |msg| ~raveSpeech3Synth.set(\raveSpeech3PitchTimeDisperse,msg[1]);}, "/rave/speech3/pitch/time", nil);
)

(
~raveDarboukaOutBus = Bus.new(index:6, numChannels:2);
~raveDarboukaBus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[3].outBus = ~raveDarboukaBus;
~raveDarboukaCtl = RAVEControl(s,
    modelFile:"path/to/rave_rt_models/darbouka_realtime.ts"
);
~raveDarboukaSynth = {
    var in = InBus.ar(~raveDarboukaBus, 2);
    var out = Limiter.ar(
        RAVE.ar(~raveDarboukaCtl, Mix.ar(in), \raveDarboukaPrior.kr(0), \raveDarboukaTemp.kr(0));
    );
    out = (in * (1 - \raveDarboukaMix.kr(1))) + (out * \raveDarboukaMix.kr(1));
    out = out * \raveDarboukaGain.kr(1) * 0.8;
    out = out!~dirt.numChannels;
}.play(outbus:~raveDarboukaOutBus);
)
(
~raveDarboukaCtl.load(~raveDarboukaSynth);
OSCFunc({ |msg| ~raveDarboukaSynth.set(\raveDarboukaMix,msg[1]);}, "/rave/darbouka/mix", nil);
OSCFunc({ |msg| ~raveDarboukaSynth.set(\raveDarboukaPrior,msg[1]);}, "/rave/darbouka/prior", nil);
OSCFunc({ |msg| ~raveDarboukaSynth.set(\raveDarboukaTemp,msg[1]);}, "/rave/darbouka/temp", nil);
OSCFunc({ |msg| ~raveDarboukaSynth.set(\raveDarboukaGain,msg[1]);}, "/rave/darbouka/gain", nil);
)

(
~raveFalloutOutBus = Bus.new(index:8, numChannels:2);
~raveFalloutBus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[4].outBus = ~raveFalloutBus;
~raveFalloutCtl = RAVEControl(s,
    modelFile:"path/to/rave_rt_models/fallout_realtime.ts"
);
~raveFalloutSynth = {
    var in = InBus.ar(~raveFalloutBus, 2);
    var out = Limiter.ar(
        RAVE.ar(~raveFalloutCtl, Mix.ar(in), \raveFalloutPrior.kr(0), \raveFalloutTemp.kr(0));
    );
    out = (in * (1 - \raveFalloutMix.kr(1))) + (out * \raveFalloutMix.kr(1));
    out = out * \raveFalloutGain.kr(1) * 0.8;
    out = out!~dirt.numChannels;
}.play(outbus:~raveFalloutOutBus);
)
(
~raveFalloutCtl.load(~raveFalloutSynth);
OSCFunc({ |msg| ~raveFalloutSynth.set(\raveFalloutMix,msg[1]);}, "/rave/fallout/mix", nil);
OSCFunc({ |msg| ~raveFalloutSynth.set(\raveFalloutPrior,msg[1]);}, "/rave/fallout/prior", nil);
OSCFunc({ |msg| ~raveFalloutSynth.set(\raveFalloutTemp,msg[1]);}, "/rave/fallout/temp", nil);
OSCFunc({ |msg| ~raveFalloutSynth.set(\raveFalloutGain,msg[1]);}, "/rave/fallout/gain", nil);
)
