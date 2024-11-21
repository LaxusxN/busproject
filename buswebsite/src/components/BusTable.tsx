import React, { useState, useEffect } from "react";

interface Bus {
  busId: number;
  busNumber: string;
  placa: string;
  creationDate: string;
  busDetail: string;
  busMarca: {
    id: number;
    name: string;
  };
  busStatus: boolean;
}

const BusTable: React.FC = () => {
  const [buses, setBuses] = useState<Bus[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [currentPage, setCurrentPage] = useState<number>(1);
  const busesPerPage = 5;

  useEffect(() => {
    const fetchBuses = async () => {
      try {
        const response = await fetch("/bus");
        const data = await response.json();
        setBuses(data);
      } catch (error) {
        console.error("Error fetching buses:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchBuses();
  }, []);

  const indexOfLastBus = currentPage * busesPerPage;
  const indexOfFirstBus = indexOfLastBus - busesPerPage;
  const currentBuses = buses.slice(indexOfFirstBus, indexOfLastBus);

  const showBusDetails = async (id: number) => {
    try {
      console.log(id);
      const response = await fetch(`http://localhost:8080/bus/${id}`);
      const data = await response.json();

      const message = `
      Detalles del Bus:
      -----------------
      Número de Bus: ${data.busNumber}
      Placa: ${data.placa}
      Fecha de Creación: ${data.creationDate}
      Características: ${data.busDetail}
      Marca: ${data.busMarca?.name || "Sin Marca"}
      Activo: ${data.busStatus ? "Activo" : "Inactivo"}
    `;

      alert(message);
    } catch (error) {
      console.error("Error fetching bus details:", error);
      alert("No se pudieron obtener los detalles del bus.");
    }
  };

  if (loading) return <p>Cargando buses...</p>;

  return (
    <div>
      <h1>Reporte de Buses</h1>
      <table cellPadding="10">
        <thead>
          <tr>
            <th>ID</th>
            <th>Número de Bus</th>
            <th>Placa</th>
            <th>Fecha de Creación</th>
            <th>Características</th>
            <th>Marca</th>
            <th>Activo o Inactivo</th>
          </tr>
        </thead>
        <tbody>
          {currentBuses.map((bus) => (
            <tr
              key={bus.busId}
              className="table-row"
              onClick={() => showBusDetails(bus.busId)}
            >
              <td>{bus.busId}</td>
              <td>{bus.busNumber}</td>
              <td>{bus.placa}</td>
              <td>{bus.creationDate}</td>
              <td>{bus.busDetail}</td>
              <td>{bus.busMarca.name}</td>
              <td>{bus.busStatus ? "Activo" : "Inactivo"}</td>
            </tr>
          ))}
        </tbody>
      </table>
      <div>
        <button
          onClick={() => setCurrentPage(currentPage - 1)}
          disabled={currentPage === 1}
        >
          Anterior
        </button>
        <span style={{ margin: "0 10px" }}>
          Página {currentPage} de {Math.ceil(buses.length / busesPerPage)}
        </span>
        <button
          onClick={() => setCurrentPage(currentPage + 1)}
          disabled={indexOfLastBus >= buses.length}
        >
          Siguiente
        </button>
      </div>
    </div>
  );
};

export default BusTable;
