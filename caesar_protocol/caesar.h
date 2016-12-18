#ifndef _caesar_h
#define _caesar_h

#include "agent.h"
#include "tclcl.h"
#include "packet.h"
#include "address.h"
#include "ip.h"

// caesar packet header
struct hdr_caesar { 
	char ret, data[128];
	int key, lmsg;
	double send_time;
	static int offset_;
};

class CaesarAgent : public Agent {
public:
	CaesarAgent();
	int command(int argc, const char*const* argv);
	void recv(Packet*, Handler*);
	void encrypt(int* out, int key, int l);
	void decrypt(int* out, int key, int l);
};

