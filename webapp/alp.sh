alp ltsv -r \
	--sort sum \
	--file=logs/nginx/access.log \
	--filters 'Uri contains "/api/"' \
	-m '/api/estate/[0-9]+,/api/chair/[0-9]+,/api/recommended_estate/[0-9]+,/api/estate/req_doc/[0-9]+,/api/chair/buy/[0-9]+'
