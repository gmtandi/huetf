void () PrintMaps =
{
	local string str;
	local string str2;
	local float fl1;
	local float fl2;

	fl1 = _d;
	fl2 = (_d + _d);
	str2 = ftos (fl1);
	str = infokey (world, str2);
	sprint (self, 2, "maplist:\n");
	while (((str != "") && (fl1 < fl2)))
	{
		fl1 = (fl1 + 1);
		str2 = ftos ((fl1 - _d));
		sprint5 (self, 2, "", str2, "‘ ", str, "\n");
		str2 = ftos (fl1);
		str = infokey (world, str2);
	}
};

float (string arg1, string arg2) ParseCmds =
{
	local float arg_num;
	local float fl;
	local string tmp;
	if (arg1)
        arg_num = 1;
    if (arg2)
        arg_num = 2;
	if ((arg1 == "test"))
	{
		sprint (self, 2, "whazzup\n");
		return (1);
	}
	else
	{
		if ((arg1 == "dlist"))
		{
			stuffcmd (self, "cmd demolist");
			if ((arg_num == 2))
			{
				stuffcmd (self, " ");
				stuffcmd (self, arg2);
			}
			stuffcmd (self, "\n");
			return (1);
		}
		else
		{
			if ((arg1 == "dl"))
			{
				if ((arg_num == 2))
				{
					stuffcmd (self, "cmd download demonum/");
					stuffcmd (self, arg2);
					stuffcmd (self, "\n");
					return (1);
				}
				if ((arg_num == 1))
				{
					sprint (self, 2, "type: cmd dlist, for a list of available demos\n");
					sprint (self, 2, "to download, type: cmd dl #, where # is the demo number\n");
					sprint (self, 2, "\n");
					return (1);
				}
			}
			else
			{
				if ((arg1 == "adminpwd"))
				{
					if ((arg_num == 2))
					{
						if ((self.is_admin == 3))
						{
							sprint (self, 2, "You are already an admin\n");
							return (1);
						}
						if ((self.is_admin == 2))
						{
							sprint (self, 2, "You cannot input password while electing.\n");
							return (1);
						}
						Admin_Check (arg2);
						if ((self.is_admin == 3))
						{
							Admin_Aliases ();
							bprint2 (2, self.netname, " çáéîó æõìì áäíéî óôáôõó!");
							bprint (3, "\n");
							sprint (self, 2, "Type ãïííáîäó for admin commands.\n");
						}
// REMOVED
//						else
//						{
//							sprint (self, 2, "incorrect admin password\n");
//                                stuffcmd (self, "disconnect\n");
//						}
						return (1);
					}
					if ((arg_num == 1))
					{
						sprint (self, 2, "usage: cmd adminpwd password, where password is the admin password\n");
						sprint (self, 2, "\n");
						return (1);
					}
				}
				else
				{
					if ((arg1 == "timelimit"))
					{
						if ((self.is_admin != 3))
						{
							sprint (self, 2, "You need full admin rights to use this command\n");
							return (1);
						}
						if ((arg_num == 2))
						{
							localcmd ("timelimit ");
							localcmd (arg2);
							localcmd ("\n");
							return (1);
						}
						if ((arg_num == 1))
						{
							tmp = infokey (world, arg1);
							sprint (self, 2, "timelimit is ");
							sprint (self, 2, "\"");
							sprint (self, 2, tmp);
							sprint (self, 2, "\"\n");
							return (1);
						}
					}
					else
					{
						if ((arg1 == "prematch"))
						{
							if ((self.is_admin != 3))
							{
								sprint (self, 2, "You need full admin rights to use this command\n");
								return (1);
							}
							if ((arg_num == 2))
							{
								localcmd ("prematch ");
								localcmd (arg2);
								localcmd ("\n");
								return (1);
							}
							if ((arg_num == 1))
							{
								tmp = infokey (world, arg1);
								sprint (self, 2, "prematch is ");
								sprint (self, 2, "\"");
								sprint (self, 2, tmp);
								sprint (self, 2, "\"\n");
								return (1);
							}
						}
						else
						{
							if ((arg1 == "fraglimit"))
							{
								if ((self.is_admin != 3))
								{
									sprint (self, 2, "You need full admin rights to use this command\n");
									return (1);
								}
								if ((arg_num == 2))
								{
									localcmd ("fraglimit ");
									localcmd (arg2);
									localcmd ("\n");
									return (1);
								}
								if ((arg_num == 1))
								{
									tmp = infokey (world, arg1);
									sprint (self, 2, "fraglimit is ");
									sprint (self, 2, "\"");
									sprint (self, 2, tmp);
									sprint (self, 2, "\"\n");
									return (1);
								}
							}
							else
							{
								if ((arg1 == "teamplay"))
								{
									if ((self.is_admin != 3))
									{
										sprint (self, 2, "You need full admin rights to use this command\n");
										return (1);
									}
									if ((arg_num == 2))
									{
										localcmd ("teamplay ");
										localcmd (arg2);
										localcmd ("\n");
										return (1);
									}
									if ((arg_num == 1))
									{
										tmp = infokey (world, arg1);
										sprint (self, 2, "teamplay is ");
										sprint (self, 2, "\"");
										sprint (self, 2, tmp);
										sprint (self, 2, "\"\n");
										return (1);
									}
								}
								else
								{
									if ((arg1 == "overtime"))
									{
										if ((self.is_admin != 3))
										{
											sprint (self, 2, "You need full admin rights to use this command\n");
											return (1);
										}
										if ((arg_num == 2))
										{
											localcmd ("localinfo overtime ");
											localcmd (arg2);
											localcmd ("\n");
											return (1);
										}
										if ((arg_num == 1))
										{
											tmp = infokey (world, arg1);
											sprint (self, 2, "overtime is ");
											sprint (self, 2, "\"");
											sprint (self, 2, tmp);
											sprint (self, 2, "\"\n");
											return (1);
										}
									}
									else
									{
										if ((arg1 == "cft"))
										{
											if ((self.is_admin != 3))
											{
												sprint (self, 2, "You need full admin rights to use this command\n");
												return (1);
											}
											if ((arg_num == 2))
											{
												localcmd ("localinfo cft ");
												localcmd (arg2);
												localcmd ("\n");
												return (1);
											}
											if ((arg_num == 1))
											{
												tmp = infokey (world, arg1);
												sprint (self, 2, "ceasefire time is ");
												sprint (self, 2, "\"");
												sprint (self, 2, tmp);
												sprint (self, 2, "\"\n");
												return (1);
											}
										}
										else
										{
											if ((arg1 == "password"))
											{
												if ((self.is_admin != 3))
												{
													sprint (self, 2, "You need full admin rights to use this command\n");
													return (1);
												}
												if ((arg_num == 2))
												{
													localcmd ("password ");
													if (arg2 == "none") {
														localcmd ("\"\"");
													} else {
														localcmd (arg2);
													}
													localcmd ("\n");
													bprint (2,"\n");
													arg2;
													if (arg2 == "none") {
														bprint (2, "Server Password removed!\n");
													} else {
														bprint3 (2, "Server Password changed to \"", arg2, "\"\n");
													}
													bprint (2,"\n");
													return (1);
												}
												if ((arg_num == 1))
												{
													sprint (self, 2, "usage: cmd password pwd\n");
													sprint (self, 2, "\n");
													return (1);
												}
											}
											else
											{
												if ((arg1 == "record"))
												{
													if ((self.is_admin != 3))
													{
														sprint (self, 2, "You need full admin rights to use this command\n");
														return (1);
													}
													if ((arg_num == 2))
													{
														localcmd ("record ");
														localcmd (arg2);
														localcmd ("\n");
														return (1);
													}
													if ((arg_num == 1))
													{
														sprint (self, 2, "usage: cmd record demo, where demo is the demo name\n");
														sprint (self, 2, "\n");
														return (1);
													}
												}
												else
												{
													if ((arg1 == "easyrecord"))
													{
														if ((self.is_admin != 3))
														{
															sprint (self, 2, "You need full admin rights to use this command\n");
															return (1);
														}
														if ((arg_num == 2))
														{
															localcmd ("easyrecord ");
															localcmd (arg2);
															localcmd ("\n");
															return (1);
														}
														if ((arg_num == 1))
														{
															localcmd ("easyrecord\n");
															return (1);
														}
													}
													else
													{
														if ((arg1 == "autorecord"))
														{
															if ((self.is_admin != 3))
															{
																sprint (self, 2, "You need full admin rights to use this command\n");
																return (1);
															}
															if ((arg_num == 2))
															{
																localcmd ("localinfo demo_auto_left ");
																localcmd (arg2);
																localcmd ("\n");
																return (1);
															}
															if ((arg_num == 1))
															{
																tmp = infokey (world, "demo_auto_left");
																if ((stof (tmp) > 0))
																{
																	dprint ("Auto-Recording off\n");
																	localcmd ("localinfo demo_auto_left 0\n");
																	return (1);
																}
																else
																{
																	dprint ("Auto-Recording the next match\n");
																	localcmd ("localinfo demo_auto_left 1\n");
																	return (1);
																}
															}
														}
														else
														{
															if ((arg1 == "cancel"))
															{
																if ((self.is_admin != 3))
																{
																	sprint (self, 2, "You need full admin rights to use this command\n");
																	return (1);
																}
																localcmd ("cancel\n");
																return (1);
															}
															else
															{
																if ((arg1 == "stop"))
																{
																	if ((self.is_admin != 3))
																	{
																		sprint (self, 2, "You need full admin rights to use this command\n");
																		return (1);
																	}
																	localcmd ("stop\n");
																	return (1);
																}
																else
																{
																	if ((arg1 == "kick"))
																	{
																		if ((self.is_admin != 3))
																		{
																			sprint (self, 2, "You need full admin rights to use this command\n");
																			return (1);
																		}
																		Admin_CycleDeal ();
																		return (1);
																	}
																	else
																	{
																		if ((arg1 == "map"))
																		{
																			if (((self.is_admin != 1) && (self.is_admin != 3)))
																			{
																				sprint (self, 2, "You need admin rights to use this command\n");
																				return (1);
																			}
																			if ((self.is_admin != 3))
																			{
																				if ((stof (infokey (world, "adminlevel")) < 2))
																				{
																					sprint (self, 2, "You have limited Access, You cannot use this command.\n");
																					self.impulse = 0;
																					return (1);
																				}
																				if (((clanbattle == 1) && !cb_prematch))
																				{
																					sprint (self, 2, "Clan Battle in progress....\n");
																					self.impulse = 0;
																					return (1);
																				}
																			}
																			if ((arg_num == 2))
																			{
																				bprint(2, self.netname);
																				bprint(2, " Has changed the map to ");
																				bprint(2, arg2);
																				bprint(2, "\n");
																				MapEndSequence();
																				printedEndGame = 1;
																				localcmd ("map ");
																				localcmd (arg2);
																				localcmd ("\n");
																				return (1);
																			}
																			if ((arg_num == 1))
																			{
																				sprint (self, 2, "usage: cmd map mapname, where mapname is the map name you wish to change to\n");
																				sprint (self, 2, "\n");
																				return (1);
																			}
																		}
																		else
																		{
																			if ((arg1 == "maplist"))
																			{
																				PrintMaps ();
																				return (1);
																			}
																			else
																			{
																				if (((arg1 == "help") || (arg1 == "list")))
																				{
																					sprint (self, 2, "Commands list:\n");
																					sprint (self, 2, "cmd adminpwd\n");
																					sprint (self, 2, "cmd dl\n");
																					sprint (self, 2, "cmd dlist\n");
																					sprint (self, 2, "cmd timelimit\n");
																					sprint (self, 2, "cmd prematch\n");
																					sprint (self, 2, "cmd fraglimit\n");
																					sprint (self, 2, "cmd teamplay\n");
																					sprint (self, 2, "cmd overtime\n");
																					sprint (self, 2, "cmd cft\n");
																					sprint (self, 2, "cmd password\n");
																					sprint (self, 2, "cmd map\n");
																					sprint (self, 2, "cmd record\n");
																					sprint (self, 2, "cmd easyrecord\n");
																					sprint (self, 2, "cmd autorecord\n");
																					sprint (self, 2, "cmd cancel\n");
																					sprint (self, 2, "cmd stop\n");
																					sprint (self, 2, "cmd kick\n");
																					sprint (self, 2, "cmd help || list (this command)\n");
																					sprint (self, 2, "\n");
																					return (1);
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return (0);
};

float () UserCmd =
{
	float isProcessed;
	string arg1, arg2;
    arg1 = argv(0);
    arg2 = argv(1);
    isProcessed = ParseCmds(arg1, arg2);
    return (isProcessed);
}

void (string cmd) SV_ParseClientCommand = {
    float isProcessed;
    tokenize(cmd);

    isProcessed = ParseCmds(argv(0), argv(1));
    
    if (!isProcessed)
    {
        clientcommand(self, cmd);
    }
}

float () ConsoleCmd =
{
	local string tmp;
	local float arg_num;
	local float fl;

	arg_num = argc ();
	if ((arg_num == 0))
	{
		return (0);
	}
	if ((argv (0) == "test"))
	{
		dprint ("whazzup\n");
		return (1);
	}
	else
	{
		if ((argv (0) == "info"))
		{
			if ((arg_num == 3))
			{
				if ((argv (2) == "\\"))
				{
					localcmd ("localinfo ");
					localcmd (argv (1));
					localcmd (" \"");
					localcmd ("\"\n");
					dprint ("localinfo ");
					dprint (argv (1));
					dprint (" removed");
					dprint ("\n");
					return (1);
				}
				localcmd ("localinfo ");
				localcmd (argv (1));
				localcmd (" ");
				localcmd (argv (2));
				localcmd ("\n");
				return (1);
			}
			if ((arg_num == 2))
			{
				tmp = infokey (world, argv (1));
				dprint ("localinfo ");
				dprint (argv (1));
				dprint (": \"");
				dprint (tmp);
				dprint ("\"\n");
				return (1);
			}
			if ((arg_num == 1))
			{
				localcmd ("localinfo\n");
				return (1);
			}
		}
		else
		{
			if ((argv (0) == "svinfo"))
			{
				if ((arg_num == 3))
				{
					if ((argv (2) == "\\"))
					{
						localcmd ("serverinfo ");
						localcmd (argv (1));
						localcmd (" \"");
						localcmd ("\"\n ");
						dprint ("serverinfo ");
						dprint (argv (1));
						dprint (" removed");
						dprint ("\n");
						return (1);
					}
					localcmd ("serverinfo ");
					localcmd (argv (1));
					localcmd (" ");
					localcmd (argv (2));
					localcmd ("\n");
					return (1);
				}
				if ((arg_num == 2))
				{
					tmp = infokey (world, argv (1));
					dprint ("serverinfo ");
					dprint (argv (1));
					dprint (": \"");
					dprint (tmp);
					dprint ("\"\n");
					return (1);
				}
				if ((arg_num == 1))
				{
					localcmd ("serverinfo\n");
					return (1);
				}
			}
			else
			{
				if ((argv (0) == "prematch"))
				{
					if ((arg_num == 2))
					{
						localcmd ("localinfo prematch ");
						localcmd (argv (1));
						localcmd ("\n");
						return (1);
					}
					if ((arg_num == 1))
					{
						tmp = infokey (world, argv (0));
						dprint ("prematch is ");
						dprint ("\"");
						dprint (tmp);
						dprint ("\"\n");
						return (1);
					}
				}
				else
				{
					if ((argv (0) == "overtime"))
					{
						if ((arg_num == 2))
						{
							localcmd ("localinfo overtime ");
							localcmd (argv (1));
							localcmd ("\n");
							return (1);
						}
						if ((arg_num == 1))
						{
							tmp = infokey (world, argv (0));
							dprint ("overtime is ");
							dprint ("\"");
							dprint (tmp);
							dprint ("\"\n");
							return (1);
						}
					}
					else
					{
						if ((argv (0) == "cft"))
						{
							if ((arg_num == 2))
							{
								localcmd ("localinfo cft ");
								localcmd (argv (1));
								localcmd ("\n");
								return (1);
							}
							if ((arg_num == 1))
							{
								tmp = infokey (world, argv (0));
								dprint ("ceasefire time is ");
								dprint ("\"");
								dprint (tmp);
								dprint ("\"\n");
								return (1);
							}
						}
						else
						{
							if ((argv (0) == "gspeed"))
							{
								if ((arg_num == 2))
								{
									gspeed = stof (argv (1));
									if (((gspeed < 0) || (gspeed > 3)))
									{
										gspeed = 0;
									}
									localcmd ("localinfo gspeed ");
									localcmd (argv (1));
									localcmd ("\n");
									return (1);
								}
								if ((arg_num == 1))
								{
									tmp = infokey (world, argv (0));
									dprint ("ground speed is ");
									dprint ("\"");
									dprint (tmp);
									dprint ("\"\n");
									return (1);
								}
							}
							else
							{
								if ((argv (0) == "roundtime"))
								{
									if ((arg_num == 2))
									{
										localcmd ("localinfo round_time ");
										localcmd (argv (1));
										localcmd ("\n");
										return (1);
									}
									if ((arg_num == 1))
									{
										tmp = infokey (world, argv (0));
										dprint ("round time is ");
										dprint ("\"");
										dprint (tmp);
										dprint ("\"\n");
										return (1);
									}
								}
								else
								{
									if ((argv (0) == "rounds"))
									{
										if ((arg_num == 2))
										{
											localcmd ("localinfo rounds ");
											localcmd (argv (1));
											localcmd ("\n");
											return (1);
										}
										if ((arg_num == 1))
										{
											tmp = infokey (world, argv (0));
											dprint ("rounds is ");
											dprint ("\"");
											dprint (tmp);
											dprint ("\"\n");
											return (1);
										}
									}
									else
									{
										if ((argv (0) == "autorecord"))
										{
											if ((arg_num == 2))
											{
												localcmd ("localinfo demo_auto_left ");
												localcmd (argv (1));
												localcmd ("\n");
												return (1);
											}
											if ((arg_num == 1))
											{
												tmp = infokey (world, "demo_auto_left");
												if ((stof (tmp) > 0))
												{
													dprint ("Auto-Recording off\n");
													localcmd ("localinfo demo_auto_left 0\n");
													return (1);
												}
												else
												{
													dprint ("Auto-Recording the next match\n");
													localcmd ("localinfo demo_auto_left 1\n");
													return (1);
												}
											}
										}
										else
										{
											if ((argv (0) == "restart"))
											{
												RestartMap ();
												return (1);
											}
											else
											{
												if ((argv (0) == "startmatch"))
												{
													fl = TeamFortress_NoTeams ();
													if ((fl < 1))
													{
														dprint ("No teams in game\n");
														dprint ("Match cannot be started.\n");
														return (1);
													}
													pmtime = 0;
													StartTimer ();
													return (1);
												}
												else
												{
													if ((argv (0) == "break"))
													{
														pmtime = 0;
														StartTimer ();
														return (1);
													}
													else
													{
														if ((argv (0) == "clan"))
														{
															ClanMode ();
															return (1);
														}
														else if ((argv (0) == "quadmode"))
														{
															QuadMode ();
															return (1);
														}
														else
														{
															if ((argv (0) == "tfvsdm"))
															{
																Toggle_TFvsDM ();
																return (1);
															}
															else
															{
																if ((argv (0) == "practice"))
																{
																	Toggle_Practice ();
																	return (1);
																}
																else
																{
																	if ((argv (0) == "tfstrike"))
																	{
																		Toggle_TFStrike ();
																		return (1);
																	}
																	else
																	{
																		if ((argv (0) == "duel"))
																		{
																			Toggle_Duel ();
																			return (1);
																		}
																		else
																		{
																			if ((argv (0) == "teamfrags"))
																			{
																				Toggle_Teamfrags ();
																				return (1);
																			}
																			else
																			{
																				if ((argv (0) == "fullts"))
																				{
																					Toggle_Fullts ();
																					return (1);
																				}
																				else
																				{
																					if ((argv (0) == "clansetup"))
																					{
																						ClanSetup ();
																						return (1);
																					}
																					else
																					{
																						if ((argv (0) == "reset"))
																						{
																							ResetSetup ();
																							return (1);
																						}
																						else
																						{
																							if ((argv (0) == "fbskins"))
																							{
																								ToggleFbskins ();
																								return (1);
																							}
																							else
																							{
																								if ((argv (0) == "frj"))
																								{
																									Toggle_Frj ();
																									return (1);
																								}
																								else
																								{
																									if ((argv (0) == "silence"))
																									{
																										ToggleSpecTalk ();
																										return (1);
																									}
																									else
																									{
																										if ((argv (0) == "grapple"))
																										{
																											Toggle_Grapple ();
																											return (1);
																										}
																										else
																										{
																											if ((argv (0) == "ceasefire"))
																											{
																												Admin_CeaseFire ();
																												return (1);
																											}
																											else
																											{
																												if ((argv (0) == "freeze"))
																												{
																													ToggleFreeze ();
																													return (1);
																												}
																												else
																												{
																													if ((argv (0) == "speedcap"))
																													{
																														Toggle_SpeedCap ();
																														return (1);
																													}
																													else
																													{
																														if ((argv (0) == "flash"))
																														{
																															ToggleFlash ();
																															return (1);
																														}
																														else
																														{
																															if ((argv (0) == "flag_model"))
																															{
																																Toggle_flag_emu ();
																																return (1);
																															}
																															else
																															{
																																if ((argv (0) == "grenpacks"))
																																{
																																	Toggle_Grenpacks ();
																																	return (1);
																																}
																																else
																																{
																																	if ((argv (0) == "gibs"))
																																	{
																																		Toggle_Gibs ();
																																		return (1);
																																	}
																																	else
																																	{
																																		if ((argv (0) == "highlander"))
																																		{
																																			Toggle_Highlander ();
																																			return (1);
																																		}
																																		else
																																		{
																																			if ((argv (0) == "lights"))
																																			{
																																				Toggle_Lighting ();
																																				return (1);
																																			}
																																			else
																																			{
																																				if ((argv (0) == "detpack"))
																																				{
																																					Toggle_Detpack ();
																																					return (1);
																																				}
																																				else
																																				{
																																					if ((argv (0) == "pipedelay"))
																																					{
																																						Toggle_PipeDelay ();
																																						return (1);
																																					}
																																					else
																																					{
																																						if ((argv (0) == "grentype"))
																																						{
																																							Toggle_GrenType ();
																																							return (1);
																																						}
																																						else
																																						{
																																							if ((argv (0) == "sgfire"))
																																							{
																																								Toggle_SentryFire ();
																																								return (1);
																																							}
																																							else
																																							{
																																								if ((argv (0) == "sgtype"))
																																								{
																																									Toggle_SentryType ();
																																									return (1);
																																								}
																																								else
																																								{
																																									if ((argv (0) == "time"))
																																									{
																																										calltimeofday ();
																																										return (1);
																																									}
																																									else
																																									{
																																										if ((argv (0) == "commands"))
																																										{
																																											dprint ("modsv commands added:\n");
																																											dprint ("---------------------\n");
																																											dprint ("prematch\n");
																																											dprint ("overtime\n");
																																											dprint ("rounds\n");
																																											dprint ("roundtime\n");
																																											dprint ("cft\n");
																																											dprint ("gspeed\n");
																																											dprint ("info\n");
																																											dprint ("svinfo\n");
																																											dprint ("password\n");
																																											dprint ("autorecord\n");
																																											dprint ("restart\n");
																																											dprint ("startmatch\n");
																																											dprint ("break\n");
																																											dprint ("clan\n");
																																											dprint ("practice\n");
																																											dprint ("tfstrike\n");
																																											dprint ("tfvsdm\n");
																																											dprint ("duel\n");
																																											dprint ("teamfrags\n");
																																											dprint ("fullts\n");
																																											dprint ("reset\n");
																																											dprint ("clansetup\n");
																																											dprint ("fbskins\n");
																																											dprint ("frj\n");
																																											dprint ("silence\n");
																																											dprint ("grapple\n");
																																											dprint ("ceasefire\n");
																																											dprint ("freeze\n");
																																											dprint ("speedcap\n");
																																											dprint ("flash\n");
																																											dprint ("flag_model\n");
																																											dprint ("grenpacks\n");
																																											dprint ("gibs\n");
																																											dprint ("highlander\n");
																																											dprint ("lights\n");
																																											dprint ("detpack\n");
																																											dprint ("pipedelay\n");
																																											dprint ("grentype\n");
																																											dprint ("sgfire\n");
																																											dprint ("sgtype\n");
																																											dprint ("time\n");
																																											dprint ("commands\n");
																																											dprint ("------------\n");
																																											dprint ("42 Commands\n");
																																											return (1);
																																										}
																																									}
																																								}
																																							}
																																						}
																																					}
																																				}
																																			}
																																		}
																																	}
																																}
																															}
																														}
																													}
																												}
																											}
																										}
																									}
																								}
																							}
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return (0);
};

void () UserInfo_Changed = {

   local string sk, st;
   local float arg_num, tc;


	arg_num = argc(); // tmp has been tokanized in ChatMessage function

	if (arg_num == 0)
		return;

      if (argv(1) == "rate")
      {
	   CheckConnectRate();
         return;
      }

      else if (argv(1) == "name")
      {
         if (argv(2) == string_null) 
         stuffcmd (self,"disconnect\n");

/*         if (argv(2) == "lunga") {
            stuffcmd (self,"name tang\n");
            stuffcmd (self,"\n");
         }*/
         return;

      }

      return;
};


float(string text, float say_team) ChatMessage =
{

   local float arg_num;

        tokanize(text);

        arg_num = argc(); // tmp has been tokanized in ChatMessage function

        if (arg_num == 0)
                return 0;


if (self.captain == 0 && captainmode) {
	return 1;
}

      if (argv(0) == "test")
      {
                bprint(2.00,"whazzup\n");
logevent( "EVENT: \r\n");
            return 1;
      }


      return 0;
};

