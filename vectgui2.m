function varargout = vectgui2(varargin)
%      VECTGUI2 is an esay-to-use 3D vector field_axes simulator with a friendly GUI.
%      It can visualize the vector field_axes, calculate divergence and also plot the curl_axes of
%      the field_axes, all in one single GUI. All you need to do is to enter the symbolic
%      expression for x,y and z component of the vector field_axes, specify the ranges for
%      x, y and z coordinates and push the Draw button.
%            
%      Warning: When entering symbolic expression for x,y and z component, be sure
%      to use element-by-element operators. i.e. multiplication(.*), division(./)
%      and power(.^)
%
%      The default range for x,y and z coordinates is [-1 1], where -1 is the lower limit
%      and 1 is the upper limit. Feel free to change it.
%
%      There are two ways to use this GUI depending on whether you want output return
%      to workspace. See examples below.
%
%      Example:
%      
%      >> VECTGUI2
%      % This command simply opens GUI but does not return anything to workspace.
%
%      >> H = VECTGUI2;
%      % This command opens GUI and also returns a cell array H to workspace.
%      
%      Cell array H has 6 components:
%
%           H{1} contains coordinates of the data points. It is a 125x3 double array.
%           The first column contains x coordinates, the second contains y coordinates,
%           and the third column contains z coordinates.
%
%           H{2} contains vector components at the data points in H{1}. It is also a 125x3
%           double array. The first column contains x components, the second contains y 
%           components, and the third column contains z components of the field_axes.
%
%           H{3} contains divergence at the data points in H{1}. Since divergence is scalar,
%           H{3} is a 125x1 double array.
%
%           H{4} contains curl_axes components at the data points in H{1}. Since curl_axes is vector,
%           H{4} is a 125x3 double array. The first column contains x components, the second
%           contains y components, and the third column contains z components of the curl_axes.
%
%           H{5} contains the handle of the axes where vector field_axes was plotted.
%
%           H{6} contains the handle of the axes where curl_axes of the field_axes was plotted.
%
%      Final note - Close button is disabled until you click Output button. Please push
%      Output button before you exit the GUI, even if you chose not to return anything
%      to workspace.
%      
%      VECTGUI2 is an upgraded GUI version of function VECTLINE. See also VECTLINE
%
%      Last Modified by Rentian Xiong v1.0 25-Jun-2005 21:18:02
%

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vectgui2_OpeningFcn, ...
                   'gui_OutputFcn',  @vectgui2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% End initialization code - DO NOT EDIT


% --- Executes just before vectgui2 is made visible.
function vectgui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vectgui2 (see VARARGIN)

set(hObject, 'ToolBar', 'Figure','MenuBar','Figure','Units', 'Normalized', 'position', [0.2 0.2 0.6 0.6]) 

set(handles.output_pushbutton,'Enable','Off');      % disable output_pushbutton when start
set(handles.draw_pushbutton,'Enable','Off');        % disable draw_pushbutton when start
set(handles.close_pushbutton,'Enable','Off');       % disable close_pushbutton when start
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes vectgui2 wait for user response (see UIRESUME)
uiwait(handles.figure1);                            % wait for user input

% --- Outputs from this function are returned to the command line.
function varargout = vectgui2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    varargout{1} = {handles.position,handles.vector,handles.divergence,...
            handles.curl_axes,handles.field_axes_handle,handles.curl_axes_handle};       % Return cell array to workspace

% Get default command line output from handles structure

% --- Executes during object creation, after setting all properties.
function x_comp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function x_comp_Callback(hObject, eventdata, handles)
% hObject    handle to x_comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_comp as text
%        str2double(get(hObject,'String')) returns contents of x_comp as a double

set(handles.draw_pushbutton,'Enable','On');         % Enable draw_pushbutton after function is available
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function y_comp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function y_comp_Callback(hObject, eventdata, handles)
% hObject    handle to y_comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_comp as text
%        str2double(get(hObject,'String')) returns contents of y_comp as a double

set(handles.draw_pushbutton,'Enable','On');         % Enable draw_pushbutton after function is available
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function z_comp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function z_comp_Callback(hObject, eventdata, handles)
% hObject    handle to z_comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_comp as text
%        str2double(get(hObject,'String')) returns contents of z_comp as a double

set(handles.draw_pushbutton,'Enable','On');         % Enable draw_pushbutton after function is available
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function x_range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function x_range_Callback(hObject, eventdata, handles)
% hObject    handle to x_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_range as text
%        str2double(get(hObject,'String')) returns contents of x_range as a double

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function y_range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function y_range_Callback(hObject, eventdata, handles)
% hObject    handle to y_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_range as text
%        str2double(get(hObject,'String')) returns contents of y_range as a double

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function z_range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function z_range_Callback(hObject, eventdata, handles)
% hObject    handle to z_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_range as text
%        str2double(get(hObject,'String')) returns contents of z_range as a double

guidata(hObject, handles);

% --- Executes on button press in draw_pushbutton.
function draw_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to draw_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cla        % Clean the figure
clc
x_range = str2num(get(handles.x_range,'String'));
y_range = str2num(get(handles.y_range,'String'));
z_range = str2num(get(handles.z_range,'String'));

x_comp = get(handles.x_comp,'String');
y_comp = get(handles.y_comp,'String');
z_comp = '0';

xmin = x_range(1);
xmax = x_range(2);
ymin = y_range(1);
ymax = y_range(2);
zmin = z_range(1);
zmax = z_range(2);

dx = (xmax-xmin)/4;
dy = (ymax-ymin)/4;
dz = (zmax-zmin)/4;

if dx ~= 0
    xm = xmin:dx:xmax;
else
    xm = zeros(1,5);
end
      
if dy ~= 0
    ym = ymin:dy:ymax;
else
    ym = zeros(1,5);
end
       
if dz ~= 0
    zm = zmin:dz:zmax;
else
    zm = zeros(1,5);
end

[meshx,meshy,meshz]=meshgrid(xm,ym,zm);             % construct data points
[meshx2,meshy2]=meshgrid(xm,ym);
if x_comp ~= '0'
    x_fun = inline(x_comp,'x','y','z');  % construct inline object for x component
    x_fun2 = inline(x_comp,'x','y'); 
    xc = x_fun(meshx,meshy,meshz);
    xc2=x_fun2(meshx2,meshy2);
else
    xc = zeros(5,5,5);
end

if y_comp ~= '0'
    y_fun = inline(y_comp,'x','y','z');             % construct inline object for y component
    y_fun2 = inline(y_comp,'x','y'); 
    yc = y_fun(meshx,meshy,meshz);
    yc2 = y_fun2(meshx2,meshy2);
else
    yc = zeros(5,5,5);
end

if z_comp ~= '0'
    z_fun = inline(z_comp,'x','y','z');             % construct inline object for z component
    zc = z_fun(meshx,meshy,meshz);
else
    zc = zeros(5,5,5);
end

axes(handles.field_axes)                            % choose field_axes to plot the field
handles.field_axes_handle = gca;                    % return handle of field_axes to workspace
quiver3(meshx,meshy,meshz,xc,yc,zc)                 % plot the vector field
axis vis3d
xlabel('x')
ylabel('y')
zlabel('z')
grid on

[curlx,curly,curlz]=curl(meshx,meshy,meshz,xc,yc,zc);       % calculate curl
axes(handles.curl_axes)                             % choose curl_axes to plot the curl
handles.curl_axes_handle = gca;                     % return handle of curl_axes to workspace

axis vis3d
xlabel('x')
ylabel('y')
zlabel('z')
grid on

div = divergence(meshx,meshy,meshz,xc,yc,zc) ;
div2=divergence(meshx2,meshy2,xc2,yc2);
axes(handles.diver);
xlabel('x')
ylabel('y')
zlabel('z')
grid on
quiver(meshx2,meshy2,xc2,yc2);
hold on
contour(meshx2,meshy2,div2,'ShowText','on')

%%contour(xc,xc,div2);% calculate divergence


handles.position = [meshx(:),meshy(:),meshz(:)];   % return coordinates to workspace
handles.vector = [xc(:),yc(:),zc(:)];              % return vector components to workspace
handles.divergence = div(1,2,1); 

% return divergence to workspace
handles.curl_axes = [curlx(:),curly(:),curlz(:)];       % return curl to workspace

set(handles.output_pushbutton,'Enable','On');      % enable output_pushbutton after draw

guidata(hObject, handles);

% --- Executes on button press in output_pushbutton.
function output_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to output_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.close_pushbutton,'Enable','On');      % enable close_pushbutton after output
uiresume    % resume GUI


% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

delete(handles.figure1)     % close GUI
