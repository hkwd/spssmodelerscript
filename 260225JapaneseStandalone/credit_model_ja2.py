# 信用予測モデルのためのSPSS Modelerスクリプト

# 新しいストリームを作成
stream = modeler.script.stream()

# 入力ファイルパスを定義
input_file = u"C:\\temp6\\tree_credit_ja.csv"

# 可変ファイルノード(CSV入力)を作成
varfilenode = stream.createAt("variablefile", "file", 100, 100)
varfilenode.setPropertyValue("full_filename", input_file)
varfilenode.setPropertyValue("encoding", "UTF-8")

# フィールドメタデータを定義するためのタイプノードを作成
# ノード名に日本語を使用（ユニコードプレフィックス u"" を使用）
typenode = stream.createAt("type", u"フィールド定義", 250, 100)

# 可変ファイルノードをタイプノードにリンク
stream.link(varfilenode, typenode)


# ストリームを保存
output_stream_path = u"C:\\temp6\\credit_model_stream.str"
session = modeler.script.session()
taskrunner = session.getTaskRunner()
taskrunner.saveStreamToFile(stream, output_stream_path)

# 日本語メッセージを出力（ユニコードプレフィックス u"" を使用）
print u"ストリームが正常に作成され、保存されました: " + output_stream_path

# Made with Bob
