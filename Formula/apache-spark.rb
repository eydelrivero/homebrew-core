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
    sha256 "iQEcBAABAgAGBQJXO8P7AAoJEHxsEF/8jtCJk20H/RW/OKh3tAitQvyfkiTRbNEYMpuGEgPxhkNZvIADmPt/e75G6whnuRWtFQxkAUGngyZ/TKrD46IchV6ys143o8ob3OtprgyqMKkziHw4FlkeH16Ku0Y6UqLyB0jgJzrVk1U755NN1FfDKNsWYPr0D5Hhu1hU9956DUi8+AlmwTJ7hzRDBItQunA2iI/au3AtkZKFa15GKgYm1Wptbnx97rN5Kz9E1rpLIrAYqREC+lPRbBsWYWEJXupR892/2SD0mA8E54WhAh/gy1Ky48g7taOcH3t7ZH3v+YMsw/zP+Kuk4lmYFpeU1iXbgKVyHUZYQisa9PWPFUMwyV1sK5CFJX4==aO08"
  end

  test do
    system "#{bin}/spark-shell <<<'sc.parallelize(1 to 1000).count()'"
  end
end
