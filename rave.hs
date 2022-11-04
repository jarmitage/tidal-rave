-- RAVE Target
:{
raveTarget = Target {oName     = "RAVE", 
                    oAddress   = "127.0.0.1", 
                    oHandshake = False, 
                    oPort      = 6789, 
                    oBusPort   = Nothing, 
                    oLatency   = 0.1, 
                    oSchedule  = Pre BundleStamp, 
                    oWindow    = Nothing
                  }
:}

-- RAVE OSC Specs
:{
raveOSCSpecs = [OSC "/rave/{ravemodel}/mix"   $ ArgList [("ravemix", Nothing)],
                OSC "/rave/{ravemodel}/prior" $ ArgList [("raveprior", Nothing)],
                OSC "/rave/{ravemodel}/temp"  $ ArgList [("ravetemp", Nothing)],
                OSC "/rave/{ravemodel}/gain"  $ ArgList [("ravegain", Nothing)],
                OSC "/rave/{ravemodel}/pan"   $ ArgList [("ravepan", Nothing)],
                OSC "/rave/{ravemodel}/pitch/ratio" $ ArgList [("ravepitchratio", Nothing)],
                OSC "/rave/{ravemodel}/pitch/grain" $ ArgList [("ravepitchgrain", Nothing)],
                OSC "/rave/{ravemodel}/pitch/disperse" $ ArgList [("ravepitchdisperse", Nothing)],
                OSC "/rave/{ravemodel}/pitch/time" $ ArgList [("ravepitchtimedisperse", Nothing)]
               ]
:}

-- RAVE Parameters
:{
let ravemix   = pF "ravemix"
    raveprior = pI "raveprior"
    ravetemp  = pF "ravetemp"
    ravegain  = pF "ravegain"
    ravepan   = pF "ravepan"
    rave      = pS "ravemodel"
:}

-- RAVE PitchShift.ar
:{
let ravepitchratio = pF "ravepitchratio"
    ravepitchgrain = pF "ravepitchgrain"
    ravepitchdisperse = pF "ravepitchdisperse"
    ravepitchtimedisperse = pF "ravepitchtimedisperse"
:}

-- RAVE Shortcuts
:{
let ravepitch r d t = ravepitchratio r # ravepitchdisperse d # ravepitchtimedisperse t
:}

-- RAVE OSC Map
raveOscMap = (raveTarget, raveOSCSpecs)

-- RAVE Utilities
-- hushrave = once $ rave "[speech, darbouka, fallout]" # ravegain 0



