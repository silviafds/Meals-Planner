import com.example.mealsplanner.controller.AlimentosController;
import com.example.mealsplanner.domain.alimentos.Alimentos;
import com.example.mealsplanner.domain.alimentos.AlimentosDTO;
import com.example.mealsplanner.service.AlimentosService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;
import org.springframework.web.client.HttpServerErrorException;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.math.BigDecimal;
import java.util.List;

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
public class AlimentosControllerTest {

    @Mock
    private AlimentosService alimentosService;
    @InjectMocks
    private AlimentosController alimentosController;

    @BeforeEach
    public void init() {
        AlimentosService alimentosService = mock(AlimentosService.class);
        alimentosController = new AlimentosController(alimentosService);

    }

    @Test
    @DisplayName("Listar alimentos")
    public void testListarAlimentosSucesso() {
        List<Alimentos> result = alimentosController.listarTodosAlimentos();
        assertNotNull(result);
    }
    @Test
    @DisplayName("Listar alimentos lança exceção")
    public void testListarAlimentosFalha() throws HttpServerErrorException {

        when(alimentosService.buscarTodosAlimentos()).thenThrow(HttpServerErrorException.class);
        assertThrows(HttpServerErrorException.class, () -> alimentosController.listarTodosAlimentos());
    }

    @Test
    @DisplayName("Listar alimentos individuais")
    public void testListarAlimentosIndividuaisSucesso() {
        Alimentos result = alimentosController.listarAlimentoIndividual(1L);
        assertNotNull(result);
    }

    @Test
    @DisplayName("Listar alimentos Indi lança exceção")
    public void testListarAlimentosIndividuaisFalha() throws HttpServerErrorException {
        when(alimentosService.buscarAlimentosPorId(1l)).thenThrow(HttpServerErrorException.class);

        assertThrows(HttpServerErrorException.class, () -> alimentosController.listarAlimentoIndividual(1L));

    }

    @Test
    @DisplayName("Listar alimentos que não existe")
    public void testListarAlimentosInexistente() {
        when(alimentosService.buscarAlimentosPorId(10000L)).thenReturn(null);

        Alimentos result = alimentosController.listarAlimentoIndividual(10000L);
        assertNull(result);
    }

    @Test
    @DisplayName("Cadastrando alimentos com sucesso")
    public void cadastrarAlimento() {
        AlimentosDTO alimentosDTO = new AlimentosDTO(
                "Caja",
                "Fruta",
                new BigDecimal("30.00"),
                new BigDecimal("5.00"),
                new BigDecimal("100.00"),
                new BigDecimal("23.00"),
                new BigDecimal("4.00"),
                new BigDecimal("124.00"),
                new BigDecimal("0.00")
        );

        //when(alimentosService.cadastroAlimento(any(AlimentosDTO.class))).thenReturn(true);

        boolean resultado = alimentosController.cadastrarAlimento(alimentosDTO);

        assertTrue(resultado, "Deveria cadastrar o alimento com sucesso");
    }

    @Test
    @DisplayName("Cadastrando alimentos com falha")
    public void cadastrarAlimentoComFalha() {
        AlimentosDTO alimentosDTO = new AlimentosDTO(
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null
        );

        when(alimentosService.cadastroAlimento(any(AlimentosDTO.class))).thenReturn(false);

        Boolean bool = alimentosController.cadastrarAlimento(alimentosDTO);
        assertFalse(bool);
    }

}