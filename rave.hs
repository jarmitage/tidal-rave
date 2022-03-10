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
                OSC "/rave/{ravemodel}/temp"  $ ArgList [("ravetemp", Nothing)]
               ]
:}

-- RAVE Parameters
:{
let ravemix   = pF "ravemix"
    raveprior = pI "raveprior"
    ravetemp  = pF "ravetemp"
    rave      = pS "ravemodel"
:}

-- RAVE OSC Map
raveOscMap = (raveTarget, raveOSCSpecs)
