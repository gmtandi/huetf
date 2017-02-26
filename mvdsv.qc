//=-=-=-=-=

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
	sprint (self, SBAR_PRINT, "maplist:\n");
	while (((str != "") && (fl1 < fl2)))
	{
		fl1 = (fl1 + SBAR_GRENS);
		str2 = ftos ((fl1 - _d));
		sprint5 (self, SBAR_PRINT, "", str2, "‘ ", str, "\n");
		str2 = ftos (fl1);
		str = infokey (world, str2);
	}
};

float () UserCmd =
{
	local float arg_num;
	local float fl;
	local string tmp;

	arg_num = argc ();
	if ((arg_num == 0))
	{
		return (0);
	}
	if ((argv (0) == "test"))
	{
		sprint (self, SBAR_PRINT, "whazzup\n");
		return (SBAR_GRENS);
	}
	else
	{
		if ((argv (0) == "dlist"))
		{
			stuffcmd (self, "cmd demolist");
			if ((arg_num == SBAR_PRINT))
			{
				stuffcmd (self, " ");
				stuffcmd (self, argv (SBAR_GRENS));
			}
			stuffcmd (self, "\n");
			return (SBAR_GRENS);
		}
		else
		{
			if ((argv (0) == "dl"))
			{
				if ((arg_num == SBAR_PRINT))
				{
					stuffcmd (self, "cmd download demonum/");
					stuffcmd (self, argv (SBAR_GRENS));
					stuffcmd (self, "\n");
					return (SBAR_GRENS);
				}
				if ((arg_num == SBAR_GRENS))
				{
					sprint (self, SBAR_PRINT, "type: cmd dlist, for a list of available demos\n");
					sprint (self, SBAR_PRINT, "to download, type: cmd dl #, where # is the demo number\n");
					sprint (self, SBAR_PRINT, "\n");
					return (SBAR_GRENS);
				}
			}
			else
			{
				if ((argv (0) == "adminpwd"))
				{
					if ((arg_num == SBAR_PRINT))
					{
						if ((self.is_admin == AS_MELEE))
						{
							sprint (self, SBAR_PRINT, "You are already an admin\n");
							return (SBAR_GRENS);
						}
						if ((self.is_admin == SBAR_PRINT))
						{
							sprint (self, SBAR_PRINT, "You cannot input password while electing.\n");
							return (SBAR_GRENS);
						}
						Admin_Check (argv (SBAR_GRENS));
						if ((self.is_admin == AS_MELEE))
						{
							Admin_Aliases ();
							bprint2 (SBAR_PRINT, self.netname, " çáéîó æõìì áäíéî óôáôõó!");
							bprint (AS_MELEE, "\n");
							sprint (self, SBAR_PRINT, "Type ãïííáîäó for admin commands.\n");
						}
						else
						{
							sprint (self, SBAR_PRINT, "incorrect admin password\n");
                                stuffcmd (self, "disconnect\n");

						}
						return (SBAR_GRENS);
					}
					if ((arg_num == SBAR_GRENS))
					{
						sprint (self, SBAR_PRINT, "usage: cmd adminpwd password, where password is the admin password\n");
						sprint (self, SBAR_PRINT, "\n");
						return (SBAR_GRENS);
					}
				}
				else
				{
					if ((argv (0) == "timelimit"))
					{
						if ((self.is_admin != AS_MELEE))
						{
							sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
							return (SBAR_GRENS);
						}
						if ((arg_num == SBAR_PRINT))
						{
							localcmd ("timelimit ");
							localcmd (argv (SBAR_GRENS));
							localcmd ("\n");
							return (SBAR_GRENS);
						}
						if ((arg_num == SBAR_GRENS))
						{
							tmp = infokey (world, argv (0));
							sprint (self, SBAR_PRINT, "timelimit is ");
							sprint (self, SBAR_PRINT, "\"");
							sprint (self, SBAR_PRINT, tmp);
							sprint (self, SBAR_PRINT, "\"\n");
							return (SBAR_GRENS);
						}
					}
					else
					{
						if ((argv (0) == "prematch"))
						{
							if ((self.is_admin != AS_MELEE))
							{
								sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
								return (SBAR_GRENS);
							}
							if ((arg_num == SBAR_PRINT))
							{
								localcmd ("prematch ");
								localcmd (argv (SBAR_GRENS));
								localcmd ("\n");
								return (SBAR_GRENS);
							}
							if ((arg_num == SBAR_GRENS))
							{
								tmp = infokey (world, argv (0));
								sprint (self, SBAR_PRINT, "prematch is ");
								sprint (self, SBAR_PRINT, "\"");
								sprint (self, SBAR_PRINT, tmp);
								sprint (self, SBAR_PRINT, "\"\n");
								return (SBAR_GRENS);
							}
						}
						else
						{
							if ((argv (0) == "fraglimit"))
							{
								if ((self.is_admin != AS_MELEE))
								{
									sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
									return (SBAR_GRENS);
								}
								if ((arg_num == SBAR_PRINT))
								{
									localcmd ("fraglimit ");
									localcmd (argv (SBAR_GRENS));
									localcmd ("\n");
									return (SBAR_GRENS);
								}
								if ((arg_num == SBAR_GRENS))
								{
									tmp = infokey (world, argv (0));
									sprint (self, SBAR_PRINT, "fraglimit is ");
									sprint (self, SBAR_PRINT, "\"");
									sprint (self, SBAR_PRINT, tmp);
									sprint (self, SBAR_PRINT, "\"\n");
									return (SBAR_GRENS);
								}
							}
							else
							{
								if ((argv (0) == "teamplay"))
								{
									if ((self.is_admin != AS_MELEE))
									{
										sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
										return (SBAR_GRENS);
									}
									if ((arg_num == SBAR_PRINT))
									{
										localcmd ("teamplay ");
										localcmd (argv (SBAR_GRENS));
										localcmd ("\n");
										return (SBAR_GRENS);
									}
									if ((arg_num == SBAR_GRENS))
									{
										tmp = infokey (world, argv (0));
										sprint (self, SBAR_PRINT, "teamplay is ");
										sprint (self, SBAR_PRINT, "\"");
										sprint (self, SBAR_PRINT, tmp);
										sprint (self, SBAR_PRINT, "\"\n");
										return (SBAR_GRENS);
									}
								}
								else
								{
									if ((argv (0) == "overtime"))
									{
										if ((self.is_admin != AS_MELEE))
										{
											sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
											return (SBAR_GRENS);
										}
										if ((arg_num == SBAR_PRINT))
										{
											localcmd ("localinfo overtime ");
											localcmd (argv (SBAR_GRENS));
											localcmd ("\n");
											return (SBAR_GRENS);
										}
										if ((arg_num == SBAR_GRENS))
										{
											tmp = infokey (world, argv (0));
											sprint (self, SBAR_PRINT, "overtime is ");
											sprint (self, SBAR_PRINT, "\"");
											sprint (self, SBAR_PRINT, tmp);
											sprint (self, SBAR_PRINT, "\"\n");
											return (SBAR_GRENS);
										}
									}
									else
									{
										if ((argv (0) == "cft"))
										{
											if ((self.is_admin != AS_MELEE))
											{
												sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
												return (SBAR_GRENS);
											}
											if ((arg_num == SBAR_PRINT))
											{
												localcmd ("localinfo cft ");
												localcmd (argv (SBAR_GRENS));
												localcmd ("\n");
												return (SBAR_GRENS);
											}
											if ((arg_num == SBAR_GRENS))
											{
												tmp = infokey (world, argv (0));
												sprint (self, SBAR_PRINT, "ceasefire time is ");
												sprint (self, SBAR_PRINT, "\"");
												sprint (self, SBAR_PRINT, tmp);
												sprint (self, SBAR_PRINT, "\"\n");
												return (SBAR_GRENS);
											}
										}
										else
										{
											if ((argv (0) == "password"))
											{
												if ((self.is_admin != AS_MELEE))
												{
													sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
													return (SBAR_GRENS);
												}
												if ((arg_num == SBAR_PRINT))
												{
													localcmd ("password ");
													localcmd (argv (SBAR_GRENS));
													localcmd ("\n");
													bprint ("\n");
													argv (SBAR_GRENS);
													bprint3 (SBAR_PRINT, "Server Password changed to \"", argv (SBAR_GRENS), "\"\n");
													bprint ("\n");
													return (SBAR_GRENS);
												}
												if ((arg_num == SBAR_GRENS))
												{
													sprint (self, SBAR_PRINT, "usage: cmd password pwd\n");
													sprint (self, SBAR_PRINT, "\n");
													return (SBAR_GRENS);
												}
											}
											else
											{
												if ((argv (0) == "record"))
												{
													if ((self.is_admin != AS_MELEE))
													{
														sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
														return (SBAR_GRENS);
													}
													if ((arg_num == SBAR_PRINT))
													{
														localcmd ("record ");
														localcmd (argv (SBAR_GRENS));
														localcmd ("\n");
														return (SBAR_GRENS);
													}
													if ((arg_num == SBAR_GRENS))
													{
														sprint (self, SBAR_PRINT, "usage: cmd record demo, where demo is the demo name\n");
														sprint (self, SBAR_PRINT, "\n");
														return (SBAR_GRENS);
													}
												}
												else
												{
													if ((argv (0) == "easyrecord"))
													{
														if ((self.is_admin != AS_MELEE))
														{
															sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
															return (SBAR_GRENS);
														}
														if ((arg_num == SBAR_PRINT))
														{
															localcmd ("easyrecord ");
															localcmd (argv (SBAR_GRENS));
															localcmd ("\n");
															return (SBAR_GRENS);
														}
														if ((arg_num == SBAR_GRENS))
														{
															localcmd ("easyrecord\n");
															return (SBAR_GRENS);
														}
													}
													else
													{
														if ((argv (0) == "autorecord"))
														{
															if ((self.is_admin != AS_MELEE))
															{
																sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
																return (SBAR_GRENS);
															}
															if ((arg_num == SBAR_PRINT))
															{
																localcmd ("localinfo demo_auto_left ");
																localcmd (argv (SBAR_GRENS));
																localcmd ("\n");
																return (SBAR_GRENS);
															}
															if ((arg_num == SBAR_GRENS))
															{
																tmp = infokey (world, "demo_auto_left");
																if ((stof (tmp) > 0))
																{
																	dprint ("Auto-Recording off\n");
																	localcmd ("localinfo demo_auto_left 0\n");
																	return (SBAR_GRENS);
																}
																else
																{
																	dprint ("Auto-Recording the next match\n");
																	localcmd ("localinfo demo_auto_left 1\n");
																	return (SBAR_GRENS);
																}
															}
														}
														else
														{
															if ((argv (0) == "cancel"))
															{
																if ((self.is_admin != AS_MELEE))
																{
																	sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
																	return (SBAR_GRENS);
																}
																localcmd ("cancel\n");
																return (SBAR_GRENS);
															}
															else
															{
																if ((argv (0) == "stop"))
																{
																	if ((self.is_admin != AS_MELEE))
																	{
																		sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
																		return (SBAR_GRENS);
																	}
																	localcmd ("stop\n");
																	return (SBAR_GRENS);
																}
																else
																{
																	if ((argv (0) == "kick"))
																	{
																		if ((self.is_admin != AS_MELEE))
																		{
																			sprint (self, SBAR_PRINT, "You need full admin rights to use this command\n");
																			return (SBAR_GRENS);
																		}
																		Admin_CycleDeal ();
																		return (SBAR_GRENS);
																	}
																	else
																	{
																		if ((argv (0) == "map"))
																		{
																			if (((self.is_admin != SBAR_GRENS) && (self.is_admin != AS_MELEE)))
																			{
																				sprint (self, SBAR_PRINT, "You need admin rights to use this command\n");
																				return (SBAR_GRENS);
																			}
																			if ((self.is_admin != AS_MELEE))
																			{
																				if ((stof (infokey (world, "adminlevel")) < SBAR_PRINT))
																				{
																					sprint (self, SBAR_PRINT, "You have limited Access, You cannot use this command.\n");
																					self.impulse = 0;
																					return (SBAR_GRENS);
																				}
																				if (((clanbattle == SBAR_GRENS) && !cb_prematch))
																				{
																					sprint (self, SBAR_PRINT, "Clan Battle in progress....\n");
																					self.impulse = 0;
																					return (SBAR_GRENS);
																				}
																			}
																			if ((arg_num == SBAR_PRINT))
																			{
																				localcmd ("map ");
																				localcmd (argv (SBAR_GRENS));
																				localcmd ("\n");
																				return (SBAR_GRENS);
																			}
																			if ((arg_num == SBAR_GRENS))
																			{
																				sprint (self, SBAR_PRINT, "usage: cmd map mapname, where mapname is the map name you wish to change to\n");
																				sprint (self, SBAR_PRINT, "\n");
																				return (SBAR_GRENS);
																			}
																		}
																		else
																		{
																			if ((argv (0) == "maplist"))
																			{
																				PrintMaps ();
																				return (SBAR_GRENS);
																			}
																			else
																			{
																				if (((argv (0) == "help") || (argv (0) == "list")))
																				{
																					sprint (self, SBAR_PRINT, "Commands list:\n");
																					sprint (self, SBAR_PRINT, "cmd adminpwd\n");
																					sprint (self, SBAR_PRINT, "cmd dl\n");
																					sprint (self, SBAR_PRINT, "cmd dlist\n");
																					sprint (self, SBAR_PRINT, "cmd timelimit\n");
																					sprint (self, SBAR_PRINT, "cmd prematch\n");
																					sprint (self, SBAR_PRINT, "cmd fraglimit\n");
																					sprint (self, SBAR_PRINT, "cmd teamplay\n");
																					sprint (self, SBAR_PRINT, "cmd overtime\n");
																					sprint (self, SBAR_PRINT, "cmd cft\n");
																					sprint (self, SBAR_PRINT, "cmd password\n");
																					sprint (self, SBAR_PRINT, "cmd map\n");
																					sprint (self, SBAR_PRINT, "cmd record\n");
																					sprint (self, SBAR_PRINT, "cmd easyrecord\n");
																					sprint (self, SBAR_PRINT, "cmd autorecord\n");
																					sprint (self, SBAR_PRINT, "cmd cancel\n");
																					sprint (self, SBAR_PRINT, "cmd stop\n");
																					sprint (self, SBAR_PRINT, "cmd kick\n");
																					sprint (self, SBAR_PRINT, "cmd help || list (this command)\n");
																					sprint (self, SBAR_PRINT, "\n");
																					return (SBAR_GRENS);
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
		return (SBAR_GRENS);
	}
	else
	{
		if ((argv (0) == "info"))
		{
			if ((arg_num == AS_MELEE))
			{
				if ((argv (SBAR_PRINT) == "\\"))
				{
					localcmd ("localinfo ");
					localcmd (argv (SBAR_GRENS));
					localcmd (" \"");
					localcmd ("\"\n");
					dprint ("localinfo ");
					dprint (argv (SBAR_GRENS));
					dprint (" removed");
					dprint ("\n");
					return (SBAR_GRENS);
				}
				localcmd ("localinfo ");
				localcmd (argv (SBAR_GRENS));
				localcmd (" ");
				localcmd (argv (SBAR_PRINT));
				localcmd ("\n");
				return (SBAR_GRENS);
			}
			if ((arg_num == SBAR_PRINT))
			{
				tmp = infokey (world, argv (SBAR_GRENS));
				dprint ("localinfo ");
				dprint (argv (SBAR_GRENS));
				dprint (": \"");
				dprint (tmp);
				dprint ("\"\n");
				return (SBAR_GRENS);
			}
			if ((arg_num == SBAR_GRENS))
			{
				localcmd ("localinfo\n");
				return (SBAR_GRENS);
			}
		}
		else
		{
			if ((argv (0) == "svinfo"))
			{
				if ((arg_num == AS_MELEE))
				{
					if ((argv (SBAR_PRINT) == "\\"))
					{
						localcmd ("serverinfo ");
						localcmd (argv (SBAR_GRENS));
						localcmd (" \"");
						localcmd ("\"\n ");
						dprint ("serverinfo ");
						dprint (argv (SBAR_GRENS));
						dprint (" removed");
						dprint ("\n");
						return (SBAR_GRENS);
					}
					localcmd ("serverinfo ");
					localcmd (argv (SBAR_GRENS));
					localcmd (" ");
					localcmd (argv (SBAR_PRINT));
					localcmd ("\n");
					return (SBAR_GRENS);
				}
				if ((arg_num == SBAR_PRINT))
				{
					tmp = infokey (world, argv (SBAR_GRENS));
					dprint ("serverinfo ");
					dprint (argv (SBAR_GRENS));
					dprint (": \"");
					dprint (tmp);
					dprint ("\"\n");
					return (SBAR_GRENS);
				}
				if ((arg_num == SBAR_GRENS))
				{
					localcmd ("serverinfo\n");
					return (SBAR_GRENS);
				}
			}
			else
			{
				if ((argv (0) == "prematch"))
				{
					if ((arg_num == SBAR_PRINT))
					{
						localcmd ("localinfo prematch ");
						localcmd (argv (SBAR_GRENS));
						localcmd ("\n");
						return (SBAR_GRENS);
					}
					if ((arg_num == SBAR_GRENS))
					{
						tmp = infokey (world, argv (0));
						dprint ("prematch is ");
						dprint ("\"");
						dprint (tmp);
						dprint ("\"\n");
						return (SBAR_GRENS);
					}
				}
				else
				{
					if ((argv (0) == "overtime"))
					{
						if ((arg_num == SBAR_PRINT))
						{
							localcmd ("localinfo overtime ");
							localcmd (argv (SBAR_GRENS));
							localcmd ("\n");
							return (SBAR_GRENS);
						}
						if ((arg_num == SBAR_GRENS))
						{
							tmp = infokey (world, argv (0));
							dprint ("overtime is ");
							dprint ("\"");
							dprint (tmp);
							dprint ("\"\n");
							return (SBAR_GRENS);
						}
					}
					else
					{
						if ((argv (0) == "cft"))
						{
							if ((arg_num == SBAR_PRINT))
							{
								localcmd ("localinfo cft ");
								localcmd (argv (SBAR_GRENS));
								localcmd ("\n");
								return (SBAR_GRENS);
							}
							if ((arg_num == SBAR_GRENS))
							{
								tmp = infokey (world, argv (0));
								dprint ("ceasefire time is ");
								dprint ("\"");
								dprint (tmp);
								dprint ("\"\n");
								return (SBAR_GRENS);
							}
						}
						else
						{
							if ((argv (0) == "gspeed"))
							{
								if ((arg_num == SBAR_PRINT))
								{
									gspeed = stof (argv (SBAR_GRENS));
									if (((gspeed < 0) || (gspeed > AS_MELEE)))
									{
										gspeed = 0;
									}
									localcmd ("localinfo gspeed ");
									localcmd (argv (SBAR_GRENS));
									localcmd ("\n");
									return (SBAR_GRENS);
								}
								if ((arg_num == SBAR_GRENS))
								{
									tmp = infokey (world, argv (0));
									dprint ("ground speed is ");
									dprint ("\"");
									dprint (tmp);
									dprint ("\"\n");
									return (SBAR_GRENS);
								}
							}
							else
							{
								if ((argv (0) == "roundtime"))
								{
									if ((arg_num == SBAR_PRINT))
									{
										localcmd ("localinfo round_time ");
										localcmd (argv (SBAR_GRENS));
										localcmd ("\n");
										return (SBAR_GRENS);
									}
									if ((arg_num == SBAR_GRENS))
									{
										tmp = infokey (world, argv (0));
										dprint ("round time is ");
										dprint ("\"");
										dprint (tmp);
										dprint ("\"\n");
										return (SBAR_GRENS);
									}
								}
								else
								{
									if ((argv (0) == "rounds"))
									{
										if ((arg_num == SBAR_PRINT))
										{
											localcmd ("localinfo rounds ");
											localcmd (argv (SBAR_GRENS));
											localcmd ("\n");
											return (SBAR_GRENS);
										}
										if ((arg_num == SBAR_GRENS))
										{
											tmp = infokey (world, argv (0));
											dprint ("rounds is ");
											dprint ("\"");
											dprint (tmp);
											dprint ("\"\n");
											return (SBAR_GRENS);
										}
									}
									else
									{
										if ((argv (0) == "autorecord"))
										{
											if ((arg_num == SBAR_PRINT))
											{
												localcmd ("localinfo demo_auto_left ");
												localcmd (argv (SBAR_GRENS));
												localcmd ("\n");
												return (SBAR_GRENS);
											}
											if ((arg_num == SBAR_GRENS))
											{
												tmp = infokey (world, "demo_auto_left");
												if ((stof (tmp) > 0))
												{
													dprint ("Auto-Recording off\n");
													localcmd ("localinfo demo_auto_left 0\n");
													return (SBAR_GRENS);
												}
												else
												{
													dprint ("Auto-Recording the next match\n");
													localcmd ("localinfo demo_auto_left 1\n");
													return (SBAR_GRENS);
												}
											}
										}
										else
										{
											if ((argv (0) == "restart"))
											{
												RestartMap ();
												return (SBAR_GRENS);
											}
											else
											{
												if ((argv (0) == "startmatch"))
												{
													fl = TeamFortress_NoTeams ();
													if ((fl < SBAR_GRENS))
													{
														dprint ("No teams in game\n");
														dprint ("Match cannot be started.\n");
														return (SBAR_GRENS);
													}
													pmtime = 0;
													StartTimer ();
													return (SBAR_GRENS);
												}
												else
												{
													if ((argv (0) == "break"))
													{
														pmtime = 0;
														StartTimer ();
														return (SBAR_GRENS);
													}
													else
													{
														if ((argv (0) == "clan"))
														{
															ClanMode ();
															return (SBAR_GRENS);
														}
														else
														{
															if ((argv (0) == "tfvsdm"))
															{
																Toggle_TFvsDM ();
																return (SBAR_GRENS);
															}
															else
															{
																if ((argv (0) == "practice"))
																{
																	Toggle_Practice ();
																	return (SBAR_GRENS);
																}
																else
																{
																	if ((argv (0) == "tfstrike"))
																	{
																		Toggle_TFStrike ();
																		return (SBAR_GRENS);
																	}
																	else
																	{
																		if ((argv (0) == "duel"))
																		{
																			Toggle_Duel ();
																			return (SBAR_GRENS);
																		}
																		else
																		{
																			if ((argv (0) == "teamfrags"))
																			{
																				Toggle_Teamfrags ();
																				return (SBAR_GRENS);
																			}
																			else
																			{
																				if ((argv (0) == "fullts"))
																				{
																					Toggle_Fullts ();
																					return (SBAR_GRENS);
																				}
																				else
																				{
																					if ((argv (0) == "clansetup"))
																					{
																						ClanSetup ();
																						return (SBAR_GRENS);
																					}
																					else
																					{
																						if ((argv (0) == "reset"))
																						{
																							ResetSetup ();
																							return (SBAR_GRENS);
																						}
																						else
																						{
																							if ((argv (0) == "fbskins"))
																							{
																								ToggleFbskins ();
																								return (SBAR_GRENS);
																							}
																							else
																							{
																								if ((argv (0) == "frj"))
																								{
																									Toggle_Frj ();
																									return (SBAR_GRENS);
																								}
																								else
																								{
																									if ((argv (0) == "silence"))
																									{
																										ToggleSpecTalk ();
																										return (SBAR_GRENS);
																									}
																									else
																									{
																										if ((argv (0) == "grapple"))
																										{
																											Toggle_Grapple ();
																											return (SBAR_GRENS);
																										}
																										else
																										{
																											if ((argv (0) == "ceasefire"))
																											{
																												Admin_CeaseFire ();
																												return (SBAR_GRENS);
																											}
																											else
																											{
																												if ((argv (0) == "freeze"))
																												{
																													ToggleFreeze ();
																													return (SBAR_GRENS);
																												}
																												else
																												{
																													if ((argv (0) == "speedcap"))
																													{
																														Toggle_SpeedCap ();
																														return (SBAR_GRENS);
																													}
																													else
																													{
																														if ((argv (0) == "flash"))
																														{
																															ToggleFlash ();
																															return (SBAR_GRENS);
																														}
																														else
																														{
																															if ((argv (0) == "flag_model"))
																															{
																																Toggle_flag_emu ();
																																return (SBAR_GRENS);
																															}
																															else
																															{
																																if ((argv (0) == "grenpacks"))
																																{
																																	Toggle_Grenpacks ();
																																	return (SBAR_GRENS);
																																}
																																else
																																{
																																	if ((argv (0) == "gibs"))
																																	{
																																		Toggle_Gibs ();
																																		return (SBAR_GRENS);
																																	}
																																	else
																																	{
																																		if ((argv (0) == "highlander"))
																																		{
																																			Toggle_Highlander ();
																																			return (SBAR_GRENS);
																																		}
																																		else
																																		{
																																			if ((argv (0) == "lights"))
																																			{
																																				Toggle_Lighting ();
																																				return (SBAR_GRENS);
																																			}
																																			else
																																			{
																																				if ((argv (0) == "detpack"))
																																				{
																																					Toggle_Detpack ();
																																					return (SBAR_GRENS);
																																				}
																																				else
																																				{
																																					if ((argv (0) == "pipedelay"))
																																					{
																																						Toggle_PipeDelay ();
																																						return (SBAR_GRENS);
																																					}
																																					else
																																					{
																																						if ((argv (0) == "grentype"))
																																						{
																																							Toggle_GrenType ();
																																							return (SBAR_GRENS);
																																						}
																																						else
																																						{
																																							if ((argv (0) == "sgfire"))
																																							{
																																								Toggle_SentryFire ();
																																								return (SBAR_GRENS);
																																							}
																																							else
																																							{
																																								if ((argv (0) == "sgtype"))
																																								{
																																									Toggle_SentryType ();
																																									return (SBAR_GRENS);
																																								}
																																								else
																																								{
																																									if ((argv (0) == "time"))
																																									{
																																										calltimeofday ();
																																										return (SBAR_GRENS);
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
																																											return (SBAR_GRENS);
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

void (float sec, float min, float hour, float day, float mon, float year, string date) timeofday =
{
	local entity t;

	t = find (world, classname, "prematch");
	if ((t != world))
	{
		t.no_grenades_1 = sec;
		t.no_grenades_2 = min;
		t.tp_grenades_1 = hour;
		t.tp_grenades_2 = day;
		t.armorclass = mon;
		t.tf_items = year;
		return;
	}
	dprint (date);
	dprint ("\n");
};
