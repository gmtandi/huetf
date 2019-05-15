void (entity player, string login, string secret) login = {
	string url = infokey(world, "loginurl");
	string data = strcat("nickname=", login);
	data = strcat(data,"&secret=");
	data = strcat(data,secret);
	bprint(2,"Posting ");
	bprint(2,login);
	bprint(2," and ");
	bprint(2,secret);
	bprint(2," to ");
	bprint(2,url);
	bprint(2,"\n");
	uri_get(url, 10, "application/x-www-form-urlencoded", data);
}

void(float reqid, float responsecode, string resourcebody) URI_Get_Callback = {
	if (!responsecode) {
		bprint(2, " - ");
		self.nickname = resourcebody;
		forceinfokey(self,"*nickname", self.nickname);
		bprint(2,resourcebody);
		bprint(2, "\n");
	}
	else {
		bprint(2, ftos(responsecode));
		bprint(2, "\n");
	}
}