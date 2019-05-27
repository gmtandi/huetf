void (entity player, string login, string secret) performLogin = {
	string data = strcat("login=", login);
	data = strcat(data,"&secret=");
	data = strcat(data,secret);	
	uri_get(loginUrl, 10, "application/x-www-form-urlencoded", data);
	self.login_in_progress = 1;
	dprint(infokey(self,"name"));
	dprint(" trying to login as ");
	dprint(login);
	dprint("\n");
}

void(float reqid, float responsecode, string resourcebody) URI_Get_Callback = {
	self.login_in_progress = 0;
	if (!responsecode) {
		self.login = resourcebody;
		forceinfokey(self,"*login", self.login);
		bprint(2, infokey(self,"name"));
		bprint(2, " has logged in as \s");
		bprint(2, self.login);
		bprint(2, "\s\n");
		dprint(infokey(self,"name"));
		dprint(" logged in as ");
		dprint(self.login);
		dprint("\n");
		CenterPrint3(self, "You have logged in as ", self.login, "\n");
	}
	else {
		dprint(infokey(self,"name"));
		dprint(" login failed: ");
		dprint(self.login);
		dprint("\n");
		CenterPrint3(self, ftos(responsecode), " - Login FAILED, invalid Login/Secret", "\n");
	}
}