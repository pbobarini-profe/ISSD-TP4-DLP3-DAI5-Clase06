<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vuelos.aspx.cs" Inherits="ISSD_TP4_DLP3_DAI5_clase06.Vuelos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .margenes{
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container margenes">
            <div class="d-flex justify-content-center mb-2">
            <asp:TextBox ID="TextBox1" runat="server" TextMode="DateTimeLocal" CssClass="form-control mb-2"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Number" CssClass="form-control mb-2"></asp:TextBox>
                </div>
                <div class="d-flex justify-content-center mb-2">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control mb-2 js-select">
                    </asp:DropDownList>
                    &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" CssClass="btn btn-primary"/>
                </div>
            <div class="d-flex justify-content-center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update">
                                <i class="fa fa-check"></i>
                            </asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel">
                                <i class="fa fa-times"></i>
                                  </asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CssClass="icon-btn" CommandName="Edit">
                                <i class="fa fa-pen"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False"  CssClass="icon-btn" CommandName="Select" >
                                <i class="fa fa-eye"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False"  CssClass="icon-btn" CommandName="Delete" Text="Eliminar" OnClientClick="return confirm('¿Desea borrar el registro?')">
                                <i class="fa fa-trash"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:TemplateField HeaderText="Fecha" SortExpression="fecha">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbFecha" runat="server" Text='<%# Bind("fecha","{0:yyyy-MM-ddTHH:mm}") %>' TextMode="DateTimeLocal"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("fecha") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="numeroVuelo" HeaderText="Numero" SortExpression="numeroVuelo" />
                    <asp:TemplateField HeaderText="Aerolinea" SortExpression="nombre">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" SelectedValue='<%# Bind("idAerolinea")%>' runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAerolinea" runat="server" Text='<%# Eval("idAerolinea") +"-"+Eval("nombre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
                </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Vuelos] WHERE [id] = @id" InsertCommand="INSERT INTO [Vuelos] ([fecha], [numeroVuelo], [idAerolinea]) VALUES (@fecha, @numeroVuelo, @idAerolinea)" ProviderName="<%$ ConnectionStrings:cadena.ProviderName %>" SelectCommand="SELECT Vuelos.id, Vuelos.fecha, Vuelos.numeroVuelo, Vuelos.idAerolinea, Aerolineas.nombre FROM Vuelos INNER JOIN Aerolineas ON Vuelos.idAerolinea = Aerolineas.id" UpdateCommand="UPDATE [Vuelos] SET [fecha] = @fecha, [numeroVuelo] = @numeroVuelo, [idAerolinea] = @idAerolinea WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="fecha" Type="DateTime" />
                    <asp:Parameter Name="numeroVuelo" Type="Int32" />
                    <asp:Parameter Name="idAerolinea" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="fecha" Type="DateTime" />
                    <asp:Parameter Name="numeroVuelo" Type="Int32" />
                    <asp:Parameter Name="idAerolinea" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Aerolineas]"></asp:SqlDataSource>
            <div id="detalleVueloContainer" style="display:none" runat="server">
                <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered">
                </asp:DetailsView>
            </div>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            $('.js-select').select2();
        });
    </script>
</body>
</html>
