unit AksReader_Library_3_0_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 04.04.2011 16:22:01 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Projects\AksReader Library 3.0\Bin\Release\AksReader Library 3.0.tlb (1)
// LIBID: {8D2382F2-88C0-444D-9F7C-387B33C17810}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
//   (2) v2.0 mscorlib, (C:\Windows\Microsoft.NET\Framework\v2.0.50727\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TReaderManager) : Server mscoree.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, mscorlib_TLB, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  AksReader_Library_3_0MajorVersion = 1;
  AksReader_Library_3_0MinorVersion = 0;

  LIBID_AksReader_Library_3_0: TGUID = '{8D2382F2-88C0-444D-9F7C-387B33C17810}';

  DIID_IReaderCollection: TGUID = '{A9B61FCA-F9AD-39C1-AF89-295DA1F2AE67}';
  DIID_IReaderManagerEvent: TGUID = '{39E9E928-9181-4BA3-9EB3-9DFDA0E30965}';
  DIID_IReaderManager: TGUID = '{7188BCAD-DCE2-388E-9A50-152E315E2308}';
  CLASS_ReaderCollection: TGUID = '{620A21BE-525F-337A-9589-64D664E9F949}';
  DIID_IReader: TGUID = '{CE90E632-EB90-3D90-9738-775FFB9C88CB}';
  CLASS_Reader: TGUID = '{D815E9DA-214A-303C-BA8A-1E79B474E186}';
  CLASS_ReaderManager: TGUID = '{46420321-A331-3E59-BD89-BEF8971C3FF6}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum ConnectionType
type
  ConnectionType = TOleEnum;
const
  ConnectionType_Client = $00000000;
  ConnectionType_Server = $00000001;

// Constants for enum CommunicationType
type
  CommunicationType = TOleEnum;
const
  CommunicationType_SerialPort = $00000000;
  CommunicationType_Tcp_Ip = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IReaderCollection = dispinterface;
  IReaderManagerEvent = dispinterface;
  IReaderManager = dispinterface;
  IReader = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ReaderCollection = IReaderCollection;
  Reader = IReader;
  ReaderManager = IReaderManager;


// *********************************************************************//
// DispIntf:  IReaderCollection
// Flags:     (4096) Dispatchable
// GUID:      {A9B61FCA-F9AD-39C1-AF89-295DA1F2AE67}
// *********************************************************************//
  IReaderCollection = dispinterface
    ['{A9B61FCA-F9AD-39C1-AF89-295DA1F2AE67}']
    function Contains(const name: WideString): WordBool; dispid 15;
    property Count: Integer readonly dispid 16;
    function IndexOf(const Reader: IReader): Integer; dispid 17;
    property Item[index: Integer]: IReader readonly dispid 18;
    property Item_2[const name: WideString]: IReader readonly dispid 19;
  end;

// *********************************************************************//
// DispIntf:  IReaderManagerEvent
// Flags:     (4096) Dispatchable
// GUID:      {39E9E928-9181-4BA3-9EB3-9DFDA0E30965}
// *********************************************************************//
  IReaderManagerEvent = dispinterface
    ['{39E9E928-9181-4BA3-9EB3-9DFDA0E30965}']
    procedure OnConnected(const Reader: IReader); dispid 1;
    procedure OnDisconnected(const Reader: IReader); dispid 2;
    procedure OnReceviceData(const Reader: IReader; ReaderId: Byte; Data: {??PSafeArray}OleVariant); dispid 3;
    procedure OnReceviceText(const Reader: IReader; ReaderId: Byte; const Data: WideString); dispid 4;
  end;

// *********************************************************************//
// DispIntf:  IReaderManager
// Flags:     (4096) Dispatchable
// GUID:      {7188BCAD-DCE2-388E-9A50-152E315E2308}
// *********************************************************************//
  IReaderManager = dispinterface
    ['{7188BCAD-DCE2-388E-9A50-152E315E2308}']
    function Connect(const IpAddress: WideString; Port: Integer): WordBool; dispid 5;
    function Listen(Port: Integer): WordBool; dispid 6;
    function OpenPort(const ComPortName: WideString; Baudrate: Integer): WordBool; dispid 7;
    function Close: WordBool; dispid 8;
    property IsReady: WordBool readonly dispid 9;
    property ConnectionType: ConnectionType readonly dispid 10;
    property CommunicationType: CommunicationType readonly dispid 11;
    property Readers: IReaderCollection readonly dispid 12;
  end;

// *********************************************************************//
// DispIntf:  IReader
// Flags:     (4096) Dispatchable
// GUID:      {CE90E632-EB90-3D90-9738-775FFB9C88CB}
// *********************************************************************//
  IReader = dispinterface
    ['{CE90E632-EB90-3D90-9738-775FFB9C88CB}']
    property name: WideString readonly dispid 13;
    function SendData(ReaderId: Byte; CommandId: Byte; const Parameter: WideString; 
                      out ReturnValue: WideString; TimeOut: Integer): WordBool; dispid 14;
  end;

// *********************************************************************//
// The Class CoReaderCollection provides a Create and CreateRemote method to          
// create instances of the default interface IReaderCollection exposed by              
// the CoClass ReaderCollection. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoReaderCollection = class
    class function Create: IReaderCollection;
    class function CreateRemote(const MachineName: string): IReaderCollection;
  end;

// *********************************************************************//
// The Class CoReader provides a Create and CreateRemote method to          
// create instances of the default interface IReader exposed by              
// the CoClass Reader. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoReader = class
    class function Create: IReader;
    class function CreateRemote(const MachineName: string): IReader;
  end;

// *********************************************************************//
// The Class CoReaderManager provides a Create and CreateRemote method to          
// create instances of the default interface IReaderManager exposed by              
// the CoClass ReaderManager. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoReaderManager = class
    class function Create: IReaderManager;
    class function CreateRemote(const MachineName: string): IReaderManager;
  end;

  TReaderManagerOnConnected = procedure(ASender: TObject; const Reader: IReader) of object;
  TReaderManagerOnDisconnected = procedure(ASender: TObject; const Reader: IReader) of object;
  TReaderManagerOnReceviceData = procedure(ASender: TObject; const Reader: IReader; ReaderId: Byte; 
                                                             Data: {??PSafeArray}OleVariant) of object;
  TReaderManagerOnReceviceText = procedure(ASender: TObject; const Reader: IReader; ReaderId: Byte; 
                                                             const Data: WideString) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TReaderManager
// Help String      : 
// Default Interface: IReaderManager
// Def. Intf. DISP? : Yes
// Event   Interface: IReaderManagerEvent
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TReaderManagerProperties= class;
{$ENDIF}
  TReaderManager = class(TOleServer)
  private
    FOnConnected: TReaderManagerOnConnected;
    FOnDisconnected: TReaderManagerOnDisconnected;
    FOnReceviceData: TReaderManagerOnReceviceData;
    FOnReceviceText: TReaderManagerOnReceviceText;
    FIntf:        IReaderManager;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TReaderManagerProperties;
    function      GetServerProperties: TReaderManagerProperties;
{$ENDIF}
    function      GetDefaultInterface: IReaderManager;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_IsReady: WordBool;
    function Get_ConnectionType: ConnectionType;
    function Get_CommunicationType: CommunicationType;
    function Get_Readers: IReaderCollection;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IReaderManager);
    procedure Disconnect; override;
    function Connect1(const IpAddress: WideString; Port: Integer): WordBool;
    function Listen(Port: Integer): WordBool;
    function OpenPort(const ComPortName: WideString; Baudrate: Integer): WordBool;
    function Close: WordBool;
    property DefaultInterface: IReaderManager read GetDefaultInterface;
    property IsReady: WordBool read Get_IsReady;
    property ConnectionType: ConnectionType read Get_ConnectionType;
    property CommunicationType: CommunicationType read Get_CommunicationType;
    property Readers: IReaderCollection read Get_Readers;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TReaderManagerProperties read GetServerProperties;
{$ENDIF}
    property OnConnected: TReaderManagerOnConnected read FOnConnected write FOnConnected;
    property OnDisconnected: TReaderManagerOnDisconnected read FOnDisconnected write FOnDisconnected;
    property OnReceviceData: TReaderManagerOnReceviceData read FOnReceviceData write FOnReceviceData;
    property OnReceviceText: TReaderManagerOnReceviceText read FOnReceviceText write FOnReceviceText;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TReaderManager
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TReaderManagerProperties = class(TPersistent)
  private
    FServer:    TReaderManager;
    function    GetDefaultInterface: IReaderManager;
    constructor Create(AServer: TReaderManager);
  protected
    function Get_IsReady: WordBool;
    function Get_ConnectionType: ConnectionType;
    function Get_CommunicationType: CommunicationType;
    function Get_Readers: IReaderCollection;
  public
    property DefaultInterface: IReaderManager read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoReaderCollection.Create: IReaderCollection;
begin
  Result := CreateComObject(CLASS_ReaderCollection) as IReaderCollection;
end;

class function CoReaderCollection.CreateRemote(const MachineName: string): IReaderCollection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ReaderCollection) as IReaderCollection;
end;

class function CoReader.Create: IReader;
begin
  Result := CreateComObject(CLASS_Reader) as IReader;
end;

class function CoReader.CreateRemote(const MachineName: string): IReader;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Reader) as IReader;
end;

class function CoReaderManager.Create: IReaderManager;
begin
  Result := CreateComObject(CLASS_ReaderManager) as IReaderManager;
end;

class function CoReaderManager.CreateRemote(const MachineName: string): IReaderManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ReaderManager) as IReaderManager;
end;

procedure TReaderManager.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{46420321-A331-3E59-BD89-BEF8971C3FF6}';
    IntfIID:   '{7188BCAD-DCE2-388E-9A50-152E315E2308}';
    EventIID:  '{39E9E928-9181-4BA3-9EB3-9DFDA0E30965}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TReaderManager.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IReaderManager;
  end;
end;

procedure TReaderManager.ConnectTo(svrIntf: IReaderManager);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TReaderManager.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TReaderManager.GetDefaultInterface: IReaderManager;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TReaderManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TReaderManagerProperties.Create(Self);
{$ENDIF}
end;

destructor TReaderManager.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TReaderManager.GetServerProperties: TReaderManagerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TReaderManager.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    1: if Assigned(FOnConnected) then
         FOnConnected(Self, IUnknown(TVarData(Params[0]).VPointer) as IReader {const IReader});
    2: if Assigned(FOnDisconnected) then
         FOnDisconnected(Self, IUnknown(TVarData(Params[0]).VPointer) as IReader {const IReader});
    3: if Assigned(FOnReceviceData) then
         FOnReceviceData(Self,
                         IUnknown(TVarData(Params[0]).VPointer) as IReader {const IReader},
                         Params[1] {Byte},
                         Params[2] { ??PSafeArray OleVariant});
    4: if Assigned(FOnReceviceText) then
         FOnReceviceText(Self,
                         IUnknown(TVarData(Params[0]).VPointer) as IReader {const IReader},
                         Params[1] {Byte},
                         Params[2] {const WideString});
  end; {case DispID}
end;

function TReaderManager.Get_IsReady: WordBool;
begin
    Result := DefaultInterface.IsReady;
end;

function TReaderManager.Get_ConnectionType: ConnectionType;
begin
    Result := DefaultInterface.ConnectionType;
end;

function TReaderManager.Get_CommunicationType: CommunicationType;
begin
    Result := DefaultInterface.CommunicationType;
end;

function TReaderManager.Get_Readers: IReaderCollection;
begin
    Result := DefaultInterface.Readers;
end;

function TReaderManager.Connect1(const IpAddress: WideString; Port: Integer): WordBool;
begin
  Result := DefaultInterface.Connect(IpAddress, Port);
end;

function TReaderManager.Listen(Port: Integer): WordBool;
begin
  Result := DefaultInterface.Listen(Port);
end;

function TReaderManager.OpenPort(const ComPortName: WideString; Baudrate: Integer): WordBool;
begin
  Result := DefaultInterface.OpenPort(ComPortName, Baudrate);
end;

function TReaderManager.Close: WordBool;
begin
  Result := DefaultInterface.Close;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TReaderManagerProperties.Create(AServer: TReaderManager);
begin
  inherited Create;
  FServer := AServer;
end;

function TReaderManagerProperties.GetDefaultInterface: IReaderManager;
begin
  Result := FServer.DefaultInterface;
end;

function TReaderManagerProperties.Get_IsReady: WordBool;
begin
    Result := DefaultInterface.IsReady;
end;

function TReaderManagerProperties.Get_ConnectionType: ConnectionType;
begin
    Result := DefaultInterface.ConnectionType;
end;

function TReaderManagerProperties.Get_CommunicationType: CommunicationType;
begin
    Result := DefaultInterface.CommunicationType;
end;

function TReaderManagerProperties.Get_Readers: IReaderCollection;
begin
    Result := DefaultInterface.Readers;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TReaderManager]);
end;

end.
