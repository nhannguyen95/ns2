#include "caesar.h"

static class caesar_packetHeaderClass : public PacketHeaderClass {
public:caesar_packetHeaderClass() :PacketHeaderClass("PacketHeader/caesar_packet", sizeof(hdr_caesar)) {
	bind_offset(&hdr_caesar::offset_);
}
} class_caesar_packethdr;

static class caesar_packetClass : public TclClass {
public:caesar_packetClass() :TclClass("Agent/caesar_packet") {}
	   TclObject* create(int, const char*const*) {
		   return (new CaesarAgent());
	   }
} class_caesar_packet;

CaesarAgent::CaesarAgent() :Agent(PT_CAESAR_PACKET) {
	bind("packetSize_", &size_);
}

int CaesarAgent::command(int argc, const char*const* argv) {
	if (argc == 3) {
		if (strcmp(argv[1], "send") == 0 ) {
			// Create a new packet
			Packet* pkt = allocpkt();
			// Access the header for the new packet:
			hdr_caesar* hdr = hdr_caesar::access(pkt);
			// Access the IP header for the received packet:
			hdr_ip* hdrip = hdr_ip::access(pkt);
			// Set the 'ret' field to 0, so the receiving node
			// knows that it has to generate an echo packet
			hdr->ret = 0;
			// Store the current time in the 'send_time' field
			hdr->send_time = Scheduler::instance().clock();
			// copy data to be sent to header
			char temp[20];
			strcpy(temp, argv[2]);
			int l = strlen(argv[2]);
			hdr->lmsg = l;
			for (i = 0;i < l;i++)
				hdr->data[i] = temp[i];
			
			// key of caesar algorithm
			hdr->key = 13; // ROT13

			encrypt(hdr->data, hdr->key, l);

			send(pkt, 0); 
			
			return (TCL_OK);
		}
	}
	return (Agent::command(argc, argv));
}

void CaesarAgent::encrypt(int* out, int key, int l) { 
	for(int i = 0; i < l; i++) 
		out[i] = (out[i] + key) % 29;
}

void CaesarAgent::recv(Packet* pkt, Handler*)
{ // Access the IP header for the received packet:
	hdr_ip* hdrip = hdr_ip::access(pkt);
	hdr_caesar* hdr = hdr_caesar::access(pkt);
	if (hdr->ret == 1) 
	{
		
 
		decrypt(hdr->data, hdr->key, hdr->l);

		printf("Original message: %s\n", hdr->data);	
			
		
		Packet::free(pkt);
	}
}

void CaesarAgent::decrypt(int* out, int key, int l) { 
	for(int i = 0; i < l; i++) 
		out[i] = (out[i] - key) % 29;
}


