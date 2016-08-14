package br.edu.ifce.tests

import com.google.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.xbase.compiler.CompilationTestHelper
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(MakerInjectorProvider)
class CodeGeneratorTest {	
	@Inject CompilationTestHelper compilationTestHelper

	@Test
	def void testCodeGeneratedForCursos() {
		
		val template = '''
			curso 'Inteligência Artificial' {
				descricao 'Mais um curso de IA'
				instituicao 'IFCE - Fortaleza'
			}
		'''

		val result = '''
			<html>
				<h1> Inteligência Artificial </h1>
				<h3> IFCE - Fortaleza </h3>
				<p> Mais um curso de IA </p>
				<p> Quantidade de Módulos: 0 </p>
			</html>
		'''
		
		compilationTestHelper.assertCompilesTo(template, result);
	}
	
	@Test
	def void testCodeGeneratedForModules() {
		val template = '''
			modulo 'Semana 01' {
				descricao 'Introdução à IA'
			}
		'''

		val result = '''
			<html>
				<h1> Semana 01 </h1>
				<p> Introdução à IA </p>
				<p> Quantidade de Aulas: 0 </p>
			</html>
		'''
		
		compilationTestHelper.assertCompilesTo(template, result);
	}

}
