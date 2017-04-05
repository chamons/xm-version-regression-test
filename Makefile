versions = mac_10.7 mac_10.8 mac_10.9 mac_10.10 mac_10.11 mac_10.12

all:: $(addprefix obj/, $(versions)) $(addprefix bin/, $(versions))

clean::
	@rm -r obj/
	@rm -r bin/

obj/mac_%:
	@mkdir -p obj/mac_$*
	@cp template/* obj/mac_$*/
	@sed -i.bak 's:%REGRESSION_VERSION%:$*:g' obj/mac_$*/Info.plist
	@sed -i.bak 's:%REGRESSION_VERSION%:$*:g' obj/mac_$*/AppDelegate.cs
	@xbuild obj/mac_$*/XMRegressionTest.csproj /verbosity:quiet /nologo
	@xbuild obj/mac_$*/XMRegressionTest.csproj /verbosity:quiet /nologo /p:Configuration=Release

bin/mac_%: obj/mac_%/
	@mkdir -p bin/mac_$*/
	@cp -R obj/mac_$*/bin/Debug/XMRegressionTest.app bin/mac_$*/XMRegressionTest-Debug.app
	@cp -R obj/mac_$*/bin/Release/XMRegressionTest.app bin/mac_$*/XMRegressionTest-Release.app