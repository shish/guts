
all: SparkleLib.Gut.dll

SparkleLib.Gut.dll:
	dmcs -out:SparkleLib.Gut.dll -target:library -r:../SparkleShare/bin/SparkleLib.dll sparkleshare/*.cs

pep8:
	pep8 -r guts --ignore=E501,E701

clean:
	rm -f SparkleLib.Gut.dll
