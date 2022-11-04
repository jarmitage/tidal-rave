(
// Server.default.options.inDevice_("BlackHole 16ch");
// Server.default.options.outDevice_("BlackHole 16ch");
// Server.default.options.inDevice_("MacBook Pro Microph");
// Server.default.options.outDevice_("MacBook Pro Output");
Server.default.options.inDevice_("K-Mix");
Server.default.options.outDevice_("K-Mix");

// Server.supernova;
Server.scsynth;

s.options.sampleRate = 48000; // the sample rate must match RAVE
s.options.blockSize = 512;//16; // a low block size within scsynth is fine,
s.options.hardwareBufferSize = 2048; // but the hardware buffer size needs to match RAVE
// (to avoid dropouts)

"OMP_NUM_THREADS".setenv("1"); // jfc

s.waitForBoot{
	~bus = Bus.new(index:0, numChannels:2);
}
)

s.quit

// if macOS complains about unknown binaries:
("xattr -d -r com.apple.quarantine"+Platform.userExtensionDir.quote++"/LivingLooper/").runInTerminal

(
MIDIIn.connectAll;
// MIDIdef.trace//(false)
MIDIdef.program(\softstep, { arg val, chan, src;
	val.postln;
	~synth.set(\loop, val)
});

MIDIdef.noteOn(\softstep_on, { arg val, num, chan, src;
	~synth.set(\loop, (num - 0).postln)
});

MIDIdef.noteOff(\softstep_off, { arg val, num, chan, src;
	~synth.set(\loop, 0.postln)
});

~synth = {
	var in = (SoundIn.ar(0)*2).softclip;
    var out = //Limiter.ar(
       LivingLooper.new(
			"~/Documents/git/pro/iil/artifacts/livinglooper/2022-11-04_ll_test/2022-11-04_ll-test.ts", 5,
			in,
            \loop.kr(0), // loop index
		).softclip;
		// [0]
// );
	// out!2
	Splay.ar(out);//+Splay.ar(in);

}.play(outbus:~bus);
)


~synth.set(\loop, 1)

~synth.set(\loop, 0)


s.quit

s.record
s.stopRecording
