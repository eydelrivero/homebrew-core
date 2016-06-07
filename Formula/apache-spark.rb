class ApacheSpark < Formula
  desc "Engine for large-scale data processing"
  homepage "https://spark.apache.org/"
  url "https://www.apache.org/dyn/closer.lua?path=spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz"
  version "1.6.1"
  sha256 "09f3b50676abc9b3d1895773d18976953ee76945afa72fa57e6473ce4e215970"
  head "https://github.com/apache/spark.git"

  bottle :unneeded

  def install
    # Rename beeline to distinguish it from hive's beeline
    mv "bin/beeline", "bin/spark-beeline"

    rm_f Dir["bin/*.cmd"]
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end
  
  devel do
    url "http://apache.rediris.es/spark/spark-2.0.0-preview/spark-2.0.0-preview.tgz"
    sha256 "038933abda726b219ebef1944fe6681e71400534c75a0c413fa3a098a56c9ce1"
  end

  test do
    system "#{bin}/spark-shell <<<'sc.parallelize(1 to 1000).count()'"
  end
end
