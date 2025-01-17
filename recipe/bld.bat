@echo on

go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%\bin\gosh.exe -ldflags="-s -w -X main.version=v%PKG_VERSION%" .\cmd\gosh || goto :error
go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%\bin\shfmt.exe -ldflags="-s -w -X main.version=v%PKG_VERSION%" .\cmd\shfmt || goto :error
go-licenses save .\cmd\gosh --save_path=license-files_gosh || goto :error
go-licenses save .\cmd\shfmt --save_path=license-files_shfmt || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
