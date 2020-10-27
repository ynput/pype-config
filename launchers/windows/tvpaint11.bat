set __app__="TVPaint Animation 11"
set __exe__="C:\Program Files\TVPaint Developpement\TVPaint Animation 11 (64bits)\TVPaint Animation 11 (64bits).exe"

if not exist %__exe__% goto :missing_app


if "%PYPE_TVPAINT_PROJECT_FILE%"=="" (
  start %__app__% %__exe__% %*
) else (
  start %__app__% %__exe__% "%PYPE_TVPAINT_PROJECT_FILE%" %*
)

goto :eof

:missing_app
    echo ERROR: %__app__% not found in %__exe__%
    exit /B 1
