BEGIN {sent[5000];receiv[5000];delay[5000]}
{
	fromnode= 20;
	tonode = 21;
	flow = 1;

	#Begin Header: Gan cac gia tri $i
	event = $1; time = $2;
	from = $3; to = $4;
	pktype = $5; pksize = $6;
	flags = $7; fid = $8;
	src = $9; dst = $10;
	seqnum = $11; pkid = $12;

	#End Header
	if ((event == "+") && (from == fromnode) && (fid == flow)) sent[pkid] = time;
	if ((event == "r") && (to == tonode) && (fid == flow))
	{
		receiv[pkid] = time;
		delay[pkid] = receiv[pkid] - sent[pkid];
		printf time " "delay[pkid] "\n";
	}
}
END {}
