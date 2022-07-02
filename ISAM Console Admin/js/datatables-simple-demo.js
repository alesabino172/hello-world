window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
	// const data = {
		// // 'headings': [
			// // 'HostName',
			// // 'HostIP',
			// // 'Service',
			// // 'Rede'
		// // ],
		// 'data': [
			// ['acxxp3227cld.itau', '10.59.98.123' , 'Webseal', '???? - ??????'],
			// ['acxxp3115cld.itau', '10.225.48.102', 'Webseal', 'CTMM1 - Corporativa'],
			// ['acxxp3116cld.itau', '10.225.48.108', 'Webseal', 'rede':'CTMM1 - Corporativa'],
			// ['acxxp3135cld.itau', '10.225.48.152', 'Webseal', 'rede':'CTMM2 - Corporativa'],
			// ['acxxp3136cld.itau', '10.225.48.158', 'Webseal', 'rede':'CTMM1 - Corporativa'],
			// ['acxxp3111cld.rse.itau', '192.168.79.230', 'Webseal', 'rede':'CTMM1 - R_S_E'],
			// ['acxxp3112cld.rse.itau', '192.168.79.234', 'Webseal', 'rede':'CTMM1 - R_S_E'],
			// ['acxxp3131cld.rse.itau', '192.168.79.238', 'Webseal', 'rede':'CTMM2 - R_S_E'],
			// ['acxxp3132cld.rse.itau', '192.168.79.242', 'Webseal', 'rede':'CTMM2 - R_S_E'],
			// ['acxxp3113cld.rsv.itau', '10.59.98.56', 'Webseal', 'rede':'RSV'],
			// ['acxxp3114cld.rsv.itau', '10.59.98.64', 'Webseal', 'rede':'RSV'],
			// ['acxxp3133cld.rsv.itau', '10.59.98.88', 'Webseal', 'rede':'RSV'],
			// ['acxxp3134cld.rsv.itau', '10.59.98.96', 'Webseal', 'rede':'RSV'],
			// ['acxxp3137cld.itau', '10.224.220.126', 'Policy Server', 'rede':'CTMM1'],
			// ['acxxp3138cld.itau', '10.224.220.128', 'Policy Server', 'rede':'CTMM1'],
			// ['acxxp3117cld.itau', '10.224.220.102', 'ISDS', 'rede':'CTMM1'],
			// ['acxxp3118cld.itau', '10.224.220.104', 'ISDS', 'rede':'CTMM1'],
			// ['acxxp3125cld.itau', '10.224.220.110', 'ISDS', 'rede':'CTMM2'],
			// ['acxxp3126cld.itau', '10.224.220.112', 'ISDS', 'rede':'CTMM2']
			// ]
	// }
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple, {
			columns: [
				// Classifique a segunda coluna em ordem crescente
				//{ select: 0, sort: "asc" },
				// Defina a 4ª coluna (data instalação P1) como string de data e hora no formato "DD/MM/YYY"
				//{ select: 4, type: "date", format: "DD/MM/YYYY" },
				// Desabilita a ordenação na coluna Ações
				{ select: 8, sortable: false},
				// Anexa um botão à oitava coluna
				//{
				//	select: 7,
				//	render: function(data, cell, row){
				//		return data + "<button type='button' data-row'" + row.dataIndex + "'>Selecionar</button>";
				//	}
				//}
			]
		});
    }
});
