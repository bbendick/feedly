# Export opml from feedly
# Convert from opml to json
cat feedly.json | jq -rc '.opml.body.outline[]' | while IFS='' read stack; do 
	ccc=$(echo $stack | jq -r ._text); 
	#echo $stack | jq ._text;
	echo "### ${ccc}";
	#ccc='f-tech';
	#echo $ccc;
	jq --arg gg "$ccc" -r '.opml.body.outline[] | select(._text == $gg) | .outline[] | "- [\(._title)](\(._htmlUrl))"' feedly.json;
done
