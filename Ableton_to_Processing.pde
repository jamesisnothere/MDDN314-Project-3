import rwmidi.*;  
int myPitch;
MidiInput mymididevice; 
 
void setup() { 
  
  size(480, 108); 
  smooth(); 
  background(70); 
 
// Show available MIDI input devices in console 
  MidiInputDevice devices[] = RWMidi.getInputDevices();
  
    for (int i = 0; i < devices.length; i++) { 
      println(i + ": " + devices[i].getName()); 
    } 

// Currently we assume the first device (#0) is the one we want 
  mymididevice = RWMidi.getInputDevices()[1].createInput(this); 

} 
 
void draw(){ 
      background(0);
      rectMode(CENTER);
      rect(width/2,height/2,myPitch+50,50);

} 

//Note ON recieved 
void noteOnReceived(Note myreceivednote) {
    println("note on " + myreceivednote.getChannel() + "  " + myreceivednote.getPitch()+ "  " + myreceivednote.getVelocity());
    myPitch = myreceivednote.getPitch();
}

// Note Off recieved 
void noteOffReceived(Note myreceivednote) {
    println("note off " + myreceivednote.getChannel() + "  " + myreceivednote.getPitch()+ "  " + myreceivednote.getVelocity());
}

// Program Change recieved  
void programChangeReceived(ProgramChange pc) {
    println("note off " + pc.getChannel() + "  " + pc.getNumber());
  }

// Control Change recieved 
void controllerChangeReceived(Controller cc) {
  println("cc channell is: " + cc.getChannel() + "  " + "cc number is: " + cc.getCC() + "  " + "cc value is:  " + cc.getValue() );
}

// System Exclusive recieved 
void sysexReceived(SysexMessage msg) {
  println("sysex " + msg);
}